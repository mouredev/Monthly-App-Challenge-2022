package com.esaudev.pomodoro.ui.works

import android.app.AlarmManager
import android.app.PendingIntent
import android.content.Context
import android.content.Intent
import android.os.CountDownTimer
import android.os.SystemClock
import androidx.core.app.AlarmManagerCompat
import androidx.lifecycle.*
import com.esaudev.pomodoro.data.room.entities.ActivityDetailEntity
import com.esaudev.pomodoro.domain.repository.ActivitiesRepository
import com.esaudev.pomodoro.util.NotificationReceiver
import dagger.hilt.android.lifecycle.HiltViewModel
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class WorkViewModel @Inject constructor(
    private val repository: ActivitiesRepository,
    @ApplicationContext private val context: Context
): ViewModel() {

    private var _countDownTime = MutableLiveData<String>()
    val countDownTime: LiveData<String> = _countDownTime

    private var _isTimerPaused = MutableLiveData(false)
    val isTimerPaused : LiveData<Boolean> = _isTimerPaused

    private var _workTimeElapsed = MutableLiveData(0)
    val workTimeElapsed : LiveData<Int> = _workTimeElapsed

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

    //1500000
    init {
        timer(defaultStartTime).start()

        notifyIntent.putExtra(EXTRAS_MESSAGE, "A descansar!")

        notifyPendingIntent = PendingIntent.getBroadcast(
            context,
            REQUEST_CODE,
            notifyIntent,
            PendingIntent.FLAG_UPDATE_CURRENT
        )

        setNotificationTime(millisToFinish = defaultStartTime)
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

    private fun timer(millisInFuture:Long,countDownInterval:Long = 1000):CountDownTimer{
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
                    _workTimeElapsed.value = _workTimeElapsed.value?.plus(1)
                }
            }

            override fun onFinish() {
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