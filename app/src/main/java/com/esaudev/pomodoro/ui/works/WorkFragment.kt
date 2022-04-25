package com.esaudev.pomodoro.ui.works

import android.app.AlarmManager
import android.app.PendingIntent
import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.core.content.ContextCompat
import androidx.fragment.app.viewModels
import androidx.navigation.fragment.NavHostFragment
import androidx.navigation.fragment.findNavController
import androidx.navigation.fragment.navArgs
import com.esaudev.pomodoro.R
import com.esaudev.pomodoro.data.room.entities.ActivityDetailEntity
import com.esaudev.pomodoro.databinding.FragmentWorkBinding
import com.esaudev.pomodoro.domain.model.CurrentActivity
import com.esaudev.pomodoro.ui.dialogs.SaveActivityDialog
import com.esaudev.pomodoro.util.*
import dagger.hilt.android.AndroidEntryPoint
import java.util.*

@AndroidEntryPoint
class WorkFragment : Fragment() {

    private var _binding: FragmentWorkBinding? = null
    private val binding: FragmentWorkBinding
        get() = _binding!!

    private val viewModel: WorkViewModel by viewModels()
    private val args: WorkFragmentArgs by navArgs()

    var isTimerPaused: Boolean = false
    var workTimeElapsed: Int = 0

    var pendingIntent : PendingIntent? = null
    var alarmManager: AlarmManager? = null

    private var alarmScheduled: Boolean = false

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        // Inflate the layout for this fragment
        return FragmentWorkBinding
            .inflate(layoutInflater, container, false)
            .apply { _binding = this }
            .root
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        initView()
        initObservers()
        initListeners()
    }

    private fun initView() {

        val cyclesFinished = "Ciclos terminados: ${args.activityState.cycles}"

        with(binding) {
            tvActivityName.text = args.activityState.name
            cWorkTimer.tvCycle.text = cyclesFinished
        }

        setupRound()
    }

    private fun setupRound() {
        when(args.activityState.workRound) {
            CurrentActivity.WorkRounds.SECOND -> {
                binding.cWorkTimer.tvWorkRound.text = "Segunda ronda"
                binding.cWorkRound.mcvSecondRound.setCardBackgroundColor(ContextCompat.getColor(requireContext(), R.color.purple_200))
            }
            CurrentActivity.WorkRounds.THIRD -> {
                binding.cWorkTimer.tvWorkRound.text = "Tercera ronda"
                binding.cWorkRound.mcvSecondRound.setCardBackgroundColor(ContextCompat.getColor(requireContext(), R.color.purple_200))
                binding.cWorkRound.mcvThirdRound.setCardBackgroundColor(ContextCompat.getColor(requireContext(), R.color.purple_200))
            }
            CurrentActivity.WorkRounds.FOURTH -> {
                binding.cWorkTimer.tvWorkRound.text = "Cuarta ronda"
                binding.cWorkRound.mcvSecondRound.setCardBackgroundColor(ContextCompat.getColor(requireContext(), R.color.purple_200))
                binding.cWorkRound.mcvThirdRound.setCardBackgroundColor(ContextCompat.getColor(requireContext(), R.color.purple_200))
                binding.cWorkRound.mcvQuadRound.setCardBackgroundColor(ContextCompat.getColor(requireContext(), R.color.purple_200))
            }
            else -> Unit
        }
    }

    private fun initObservers() {
        viewModel.countDownTime.observe(viewLifecycleOwner) {
            binding.cWorkTimer.tvWorkTimer.text = it
        }
        viewModel.isTimerPaused.observe(viewLifecycleOwner) {
            setupTimerState(state = it)
        }
        viewModel.workTimeElapsed.observe(viewLifecycleOwner) {
            workTimeElapsed = it
        }
        viewModel.hasTimerEnded.observe(viewLifecycleOwner) { hasTimerEnded ->
            if (hasTimerEnded) {
                navigateToBreak()
            }
        }
    }

    private fun setupTimerState(state: Boolean) {
        isTimerPaused = state

        if (isTimerPaused) {
            binding.cActivityControl.ivPlayPause.setImageResource(R.drawable.ic_play)
            binding.cActivityControl.tvPauseActivity.text = "Reanudar actividad"
            binding.pbFirst.isIndeterminate = false
            binding.pbSecond.isIndeterminate = false
        } else {
            binding.cActivityControl.ivPlayPause.setImageResource(R.drawable.ic_pause)
            binding.cActivityControl.tvPauseActivity.text = "Pausar actividad"
            binding.pbFirst.isIndeterminate = true
            binding.pbSecond.isIndeterminate = true
        }
    }

    private fun initListeners() {
        with(binding) {
            cActivityControl.mcvPlayPauseActivity.setOnClickListener {
                handlePlayPauseClick()
            }
            cActivityControl.mcvEndRound.setOnClickListener {
                navigateToBreak()
            }
            cActivityControl.mcvCloseActivity.setOnClickListener {
                showSaveActivityDialog()
            }
        }
    }

    private fun getTime(): Long {
        val calendar: Calendar = Calendar.getInstance()
        return calendar.timeInMillis
    }

    private fun showSaveActivityDialog() {
        handleDialogTimer()
        val tag = "alert_dialog"
        val navHostFragment = requireActivity().supportFragmentManager.fragments.first() as NavHostFragment
        if (navHostFragment.childFragmentManager.findFragmentByTag(tag) != null) return

        val alertDialog = SaveActivityDialog()

        alertDialog.onSaveClick = {
            saveActivity()
        }

        alertDialog.onCancelClick = {
            handleDismissTimer()
        }

        alertDialog.show(navHostFragment.childFragmentManager, tag)
    }

    private fun handleDialogTimer() {
        if (!isTimerPaused) {
            handlePlayPauseClick()
        }
    }

    private fun handleDismissTimer() {
        if (isTimerPaused) {
            handlePlayPauseClick()
        }
    }

    private fun saveActivity() {
        viewModel.saveActivity(
            activity = ActivityDetailEntity(
                name = args.activityState.name,
                workSeconds = getTotalWorkSecondsFromWork(
                    latestWorkSeconds = workTimeElapsed,
                    currentActivity = args.activityState
                ),
                breakSeconds = getTotalBreakTimeFromWork(
                    currentActivity = args.activityState
                ),
                date = Calendar.getInstance().time
            )
        )

        navigateToHome()

    }

    private fun navigateToBreak() {
        val action = WorkFragmentDirections.actionCurrentActivityFragmentToBreakFragment(
            activityState = args.activityState
        )
        findNavController().navigate(action)
    }

    private fun navigateToHome() {
        val action = WorkFragmentDirections.actionWorkFragmentToHomeFragment()
        findNavController().navigate(action)
    }

    private fun handlePlayPauseClick() {
        if (isTimerPaused) {
            viewModel.resumeTimer()
        } else {
            if (alarmScheduled) {
                cancelAlarm()
            }
            viewModel.pauseTimer()
        }
    }

    private fun cancelAlarm() {
        pendingIntent?.let {
            alarmManager?.cancel(it)
        }
    }

    override fun onPause() {
        super.onPause()
        cancelAlarm()
    }
}