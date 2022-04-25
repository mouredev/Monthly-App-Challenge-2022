package com.esaudev.pomodoro.ui.breaks

import android.app.AlarmManager
import android.app.PendingIntent
import android.content.Context
import android.content.Intent
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
import com.esaudev.pomodoro.databinding.FragmentBreakBinding
import com.esaudev.pomodoro.domain.model.CurrentActivity
import com.esaudev.pomodoro.ui.dialogs.SaveActivityDialog
import com.esaudev.pomodoro.ui.works.WorkFragmentDirections
import com.esaudev.pomodoro.util.*
import dagger.hilt.android.AndroidEntryPoint
import java.util.*

@AndroidEntryPoint
class BreakFragment : Fragment() {

    private var _binding: FragmentBreakBinding? = null
    private val binding: FragmentBreakBinding
        get() = _binding!!

    private val viewModel: BreakViewModel by viewModels()
    private val args: BreakFragmentArgs by navArgs()

    var isTimerPaused: Boolean = false
    var breakTimeElapsed: Int = 0

    var pendingIntent : PendingIntent? = null
    var alarmManager: AlarmManager? = null

    private var alarmScheduled: Boolean = false

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        // Inflate the layout for this fragment
        return FragmentBreakBinding
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

    private fun initObservers() {
        viewModel.countDownTime.observe(viewLifecycleOwner) {
            binding.cWorkTimer.tvWorkTimer.text = it
        }
        viewModel.isTimerPaused.observe(viewLifecycleOwner) {
            setupTimerState(state = it)
        }
        viewModel.breakTimeElapsed.observe(viewLifecycleOwner) {
            breakTimeElapsed = it
        }
        viewModel.hasTimerEnded.observe(viewLifecycleOwner) { hasTimerEnded ->
            if (hasTimerEnded) {
                navigateToWork()
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

    private fun initView() {

        val cyclesFinished = "Ciclos terminados: ${args.activityState.cycles}"

        with(binding) {
            cWorkRound.tvRoundDescription.text = "DESCANSA"
            cActivityControl.tvNextRound.text = "Continuar actividad"
            tvActivityName.text = args.activityState.name
            cWorkTimer.tvCycle.text = cyclesFinished
        }

        setupRound()
    }

    private fun setupRound() {
        when(args.activityState.breakRound) {
            CurrentActivity.BreakRounds.SECOND -> {
                binding.cWorkTimer.tvWorkRound.text = "Segundo descanso"
                binding.cWorkRound.mcvSecondRound.setCardBackgroundColor(ContextCompat.getColor(requireContext(), R.color.purple_200))
            }
            CurrentActivity.BreakRounds.THIRD -> {
                binding.cWorkTimer.tvWorkRound.text = "Tercer descanso"
                binding.cWorkRound.mcvSecondRound.setCardBackgroundColor(ContextCompat.getColor(requireContext(), R.color.purple_200))
                binding.cWorkRound.mcvThirdRound.setCardBackgroundColor(ContextCompat.getColor(requireContext(), R.color.purple_200))
            }
            CurrentActivity.BreakRounds.FOURTH -> {
                binding.cWorkTimer.tvWorkRound.text = "Cuarto descanso"
                binding.cWorkRound.mcvSecondRound.setCardBackgroundColor(ContextCompat.getColor(requireContext(), R.color.purple_200))
                binding.cWorkRound.mcvThirdRound.setCardBackgroundColor(ContextCompat.getColor(requireContext(), R.color.purple_200))
                binding.cWorkRound.mcvQuadRound.setCardBackgroundColor(ContextCompat.getColor(requireContext(), R.color.purple_200))
            }
            else -> Unit
        }
    }

    private fun initListeners() {
        with(binding) {
            cActivityControl.mcvPlayPauseActivity.setOnClickListener {
                handlePlayPauseClick()
            }
            cActivityControl.mcvEndRound.setOnClickListener {
                navigateToWork()
            }
            cActivityControl.mcvCloseActivity.setOnClickListener {
                showSaveActivityDialog()
            }
        }
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
                workSeconds = getTotalWorkSecondsFromBreak(
                    currentActivity = args.activityState
                ),
                breakSeconds = getTotalBreakTimeFromBreak(
                    latestBreakSeconds = breakTimeElapsed,
                    currentActivity = args.activityState
                ),
                date = Calendar.getInstance().time
            )
        )

        navigateToHome()
    }

    private fun navigateToHome() {
        val action = BreakFragmentDirections.actionBreakFragmentToHomeFragment()
        findNavController().navigate(action)
    }


    private fun navigateToWork() {
        val action = BreakFragmentDirections.actionBreakFragmentToCurrentActivityFragment(
            activityState = args.activityState.copy(
                workRound = getNextWorkRound(),
                breakRound = getNextBreakRound(),
                cycles = getNextCycle()
            )
        )

        findNavController().navigate(action)
    }

    private fun getNextWorkRound(): CurrentActivity.WorkRounds {
        return when(args.activityState.workRound) {
            CurrentActivity.WorkRounds.FIRST -> CurrentActivity.WorkRounds.SECOND
            CurrentActivity.WorkRounds.SECOND -> CurrentActivity.WorkRounds.THIRD
            CurrentActivity.WorkRounds.THIRD -> CurrentActivity.WorkRounds.FOURTH
            else -> CurrentActivity.WorkRounds.FIRST
        }
    }

    private fun getNextBreakRound(): CurrentActivity.BreakRounds {
        return when(args.activityState.breakRound) {
            CurrentActivity.BreakRounds.FIRST -> CurrentActivity.BreakRounds.SECOND
            CurrentActivity.BreakRounds.SECOND -> CurrentActivity.BreakRounds.THIRD
            CurrentActivity.BreakRounds.THIRD -> CurrentActivity.BreakRounds.FOURTH
            else -> CurrentActivity.BreakRounds.FIRST
        }
    }

    private fun getNextCycle(): Int {
        return if (args.activityState.workRound == CurrentActivity.WorkRounds.FOURTH) args.activityState.cycles.plus(1) else args.activityState.cycles
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