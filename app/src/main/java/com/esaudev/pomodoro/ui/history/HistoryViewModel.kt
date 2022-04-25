package com.esaudev.pomodoro.ui.history

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.esaudev.pomodoro.data.room.entities.ActivityDetailEntity
import com.esaudev.pomodoro.domain.repository.ActivitiesRepository
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class HistoryViewModel @Inject constructor(
    private val repository: ActivitiesRepository
):ViewModel() {

    private var _activities = MutableLiveData<List<ActivityDetailEntity>>()
    val activities: LiveData<List<ActivityDetailEntity>> = _activities

    init {
        getAllActivities()
    }

    private fun getAllActivities() {
        viewModelScope.launch {
            _activities.value = repository.getAllActivitiesByDate()
        }
    }

}