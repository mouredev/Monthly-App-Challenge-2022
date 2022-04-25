package com.esaudev.pomodoro.ui.setup

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Toast
import androidx.fragment.app.viewModels
import androidx.navigation.fragment.findNavController
import com.esaudev.pomodoro.databinding.FragmentSetupActivityBinding
import com.esaudev.pomodoro.core.extensions.clearFocusOnDoneButton
import com.esaudev.pomodoro.domain.model.CurrentActivity
import dagger.hilt.android.AndroidEntryPoint

@AndroidEntryPoint
class SetupActivityFragment : Fragment() {

    private var _binding: FragmentSetupActivityBinding? = null
    private val binding: FragmentSetupActivityBinding
        get() = _binding!!

    private val viewModel: SetupActivityViewModel by viewModels()

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        // Inflate the layout for this fragment
        return FragmentSetupActivityBinding
            .inflate(layoutInflater, container, false)
            .apply { _binding = this }
            .root
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        initObservers()
        initListeners()
    }

    private fun initObservers() {
        viewModel.breakTime.observe(viewLifecycleOwner) {
            binding.cBreakTimeSelector.cBreakTimeText.tvBreakTimeAmount.text = it.toString()
        }
        viewModel.isAddButtonEnabled.observe(viewLifecycleOwner) {
            binding.cBreakTimeSelector.bAddTime.isEnabled = it
        }
        viewModel.isRemoveButtonEnabled.observe(viewLifecycleOwner) {
            binding.cBreakTimeSelector.bRemoveTime.isEnabled = it
        }
    }

    private fun initListeners() {
        with(binding) {
            tilActivityName.clearFocusOnDoneButton(requireContext())
            cBreakTimeSelector.bAddTime.setOnClickListener { viewModel.addBreakTime() }
            cBreakTimeSelector.bRemoveTime.setOnClickListener { viewModel.removeBreakTime() }
            bStart.setOnClickListener {
                handleOnStartClick()
            }
        }
    }

    private fun handleOnStartClick() {
        if (isNameValid()) {
            navigateToCurrentActivity()
        } else {
            Toast.makeText(requireContext(), "Ingresa un nombre para continuar", Toast.LENGTH_SHORT).show()
        }
    }

    private fun isNameValid(): Boolean = binding.tilActivityName.text?.isNotEmpty() ==  true

    private fun navigateToCurrentActivity() {
        val action = SetupActivityFragmentDirections.actionSetupActivityFragmentToCurrentActivityFragment(
            activityState = CurrentActivity(
                name = getActivityName(),
                customBreak = getBreakMinutes()
            )
        )
        findNavController().navigate(action)
    }

    private fun getBreakMinutes() = binding.cBreakTimeSelector.cBreakTimeText.tvBreakTimeAmount.text.toString().toInt()
    private fun getActivityName() = binding.tilActivityName.text.toString()

}