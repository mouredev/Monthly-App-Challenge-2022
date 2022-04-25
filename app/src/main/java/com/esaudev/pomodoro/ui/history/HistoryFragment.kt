package com.esaudev.pomodoro.ui.history

import android.os.Bundle
import android.util.Log
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.viewModels
import androidx.recyclerview.widget.LinearLayoutManager
import com.esaudev.pomodoro.data.room.entities.ActivityDetailEntity
import com.esaudev.pomodoro.databinding.FragmentHistoryBinding
import com.esaudev.pomodoro.ui.adapters.lists.ActivityListAdapter
import dagger.hilt.android.AndroidEntryPoint
import javax.inject.Inject

@AndroidEntryPoint
class HistoryFragment : Fragment() {

    private var _binding: FragmentHistoryBinding? = null
    private val binding: FragmentHistoryBinding
        get() = _binding!!

    @Inject
    lateinit var activityListAdapter: ActivityListAdapter

    private val viewModel: HistoryViewModel by viewModels()

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        // Inflate the layout for this fragment
        return FragmentHistoryBinding
            .inflate(layoutInflater, container, false)
            .apply { _binding = this }
            .root
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        initRecyclerView()
        initObservers()
        initListeners()
    }

    private fun initRecyclerView() {
        with(binding.rvActivities) {
            adapter = activityListAdapter
            layoutManager = LinearLayoutManager(requireContext())
        }
    }

    private fun initObservers() {
        viewModel.activities.observe(viewLifecycleOwner) {
            Log.d("TAG_TESTING", it.toString())
            handleActivitiesList(activities = it)
        }
    }

    private fun initListeners() {
        with(binding) {
            bBack.setOnClickListener {
                requireActivity().onBackPressed()
            }
        }
    }

    private fun handleActivitiesList(activities: List<ActivityDetailEntity>) {
        if (activities.isEmpty()) {
            showEmptyScreen()
            return
        }
        activityListAdapter.submitList(activities)
        showActivitiesScreen()
    }

    private fun showEmptyScreen() {
        with(binding) {
            cpiActivities.visibility = View.GONE
            tvTitle.visibility = View.GONE
            cEmptyActivities.visibility = View.VISIBLE
            rvActivities.visibility = View.GONE
        }
    }

    private fun showActivitiesScreen() {
        with(binding) {
            cpiActivities.visibility = View.GONE
            tvTitle.visibility = View.VISIBLE
            cEmptyActivities.visibility = View.GONE
            rvActivities.visibility = View.VISIBLE
        }
    }
}