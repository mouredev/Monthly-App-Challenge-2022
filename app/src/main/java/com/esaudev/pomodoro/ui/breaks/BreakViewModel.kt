package com.esaudev.pomodoro.ui.breaks

import android.app.AlarmManager
import android.app.NotificationManager
import android.app.PendingIntent
import android.content.Context
import android.content.Intent
import android.os.CountDownTimer
import android.os.SystemClock
import androidx.core.app.AlarmManagerCompat
import androidx.core.app.NotificationCompat
import androidx.core.app.NotificationManagerCompat
import androidx.core.content.ContextCompat
import androidx.lifecycle.*
import com.esaudev.pomodoro.R
import com.esaudev.pomodoro.data.room.entities.ActivityDetailEntity
import com.esaudev.pomodoro.domain.model.CurrentActivity
import com.esaudev.pomodoro.domain.repository.ActivitiesRepository
import com.esaudev.pomodoro.ui.MainActivity
import com.esaudev.pomodoro.util.NotificationReceiver
import com.esaudev.pomodoro.util.cancelNotifications
import dagger.hilt.android.lifecycle.HiltViewModel
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class BreakViewModel @Inject constructor(
    savedStateHandle: SavedStateHandle,
    private val repository: ActivitiesRepository,
    @ApplicationContext private val context: Context
): ViewModel() {

    private var _countDownTime = MutableLiveData<String>()
    val countDownTime: LiveData<String> = _countDownTime

    private var _isTimerPaused = MutableLiveData(false)
    val isTimerPaused : LiveData<Boolean> = _isTimerPaused

    private var _breakTimeElapsed = MutableLiveData(0)
    val breakTimeElapsed : LiveData<Int> = _breakTimeElapsed

    private var _hasTimerEnded = MutableLiveData(false)
    val hasTimerEnded : LiveData<Boolean> = _hasTimerEnded

    private val second: Long = 1_000L
    var resumeFromMillis: Long = 0L
    private val defaultStartTime = 10000L

    private val notifyPendingIntent: PendingIntent
    private val notifyIntent = Intent(context, NotificationReceiver::class.java)
    private val REQUEST_CODE = 0
    private val EXTRAS_MESSAGE = "extra_message"
    private val alarmManager = context.getSystemService(Context.ALARM_SERVICE) as AlarmManager

    //300000
    init {
        val activityState = savedStateHandle.get<CurrentActivity>("activityState")
        val isLastBreak = activityState?.breakRound == CurrentActivity.BreakRounds.FOURTH

        notifyIntent.putExtra(EXTRAS_MESSAGE, "A trabajar!")

        notifyPendingIntent = PendingIntent.getBroadcast(
            context,
            REQUEST_CODE,
            notifyIntent,
            PendingIntent.FLAG_UPDATE_CURRENT
        )

        if (isLastBreak) {
            val customBreak = (((activityState?.customBreak)?.times(60))?.times(1000) ?: 300000).toLong()
            timer(customBreak).start()
            setNotificationTime(millisToFinish = customBreak)
        } else {
            timer(defaultStartTime).start()
            setNotificationTime(millisToFinish = defaultStartTime)
        }
    }

    private fun setNotificationTime(millisToFinish: Long = resumeFromMillis) {
        val secondsLeft = millisToFinish / 1000 % 60
        val interval = second * secondsLeft
        val triggerTime = SystemClock.elapsedRealtime() + interval

        AlarmManagerCompat.setExactAndAllowWhileIdle(
            alarmManager,
            AlarmManager.ELAPSED_REALTIME_WAKEUP,
            triggerTime,
            notifyPendingIntent
        )
    }

    private fun timer(millisInFuture:Long,countDownInterval:Long = 1000): CountDownTimer {
        return object: CountDownTimer(millisInFuture,countDownInterval){
            override fun onTick(millisUntilFinished: Long){

                if (_isTimerPaused.value == true) {
                    resumeFromMillis = millisUntilFinished
                    cancel()
                } else {

                    val minutes = if ((millisUntilFinished / 1000 / 60) > 9) "${millisUntilFinished / 1000 / 60}"
                    else "0${millisUntilFinished / 1000 / 60}"
                    val seconds = if ((millisUntilFinished / 1000 % 60) > 9) "${millisUntilFinished / 1000 % 60}"
                    else "0${millisUntilFinished / 1000 % 60}"

                    _countDownTime.value = "$minutes:$seconds"
                    _breakTimeElapsed.value = _breakTimeElapsed.value?.plus(1)
                }
            }

            override fun onFinish()  {
                _hasTimerEnded.value = true
            }
        }

    }

    fun pauseTimer() {
        _isTimerPaused.value = !(_isTimerPaused.value)!!
        alarmManager.cancel(notifyPendingIntent)
    }

    fun resumeTimer() {
        _isTimerPaused.value = !(_isTimerPaused.value)!!
        timer(resumeFromMillis).start()
        setNotificationTime()
    }

    fun saveActivity(activity: ActivityDetailEntity) {
        viewModelScope.launch {
            repository.saveActivity(activity = activity)
        }
    }

}