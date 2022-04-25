package com.esaudev.pomodoro.ui.setup

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import dagger.hilt.android.lifecycle.HiltViewModel
import javax.inject.Inject

@HiltViewModel
class SetupActivityViewModel @Inject constructor(

): ViewModel() {

    private val MAX_BREAK_TIME = 30
    private val MIN_BREAK_TIME = 15

    private var _breakTime = MutableLiveData(15)
    val breakTime: LiveData<Int> = _breakTime

    private var _isAddButtonEnabled = MutableLiveData(true)
    val isAddButtonEnabled: LiveData<Boolean> = _isAddButtonEnabled

    private var _isRemoveButtonEnabled = MutableLiveData(false)
    val isRemoveButtonEnabled: LiveData<Boolean> = _isRemoveButtonEnabled

    fun addBreakTime() {
        if (_breakTime.value!! < MAX_BREAK_TIME) {

            _breakTime.value = _breakTime.value!!.plus(1)
            checkForButtonStates()
        }
    }

    fun removeBreakTime() {
        if (_breakTime.value!! > MIN_BREAK_TIME) {

            _breakTime.value = _breakTime.value!!.minus(1)
            checkForButtonStates()
        }
    }

    private fun checkForButtonStates() {
        _isAddButtonEnabled.value = _breakTime.value!! != MAX_BREAK_TIME
        _isRemoveButtonEnabled.value = _breakTime.value!! != MIN_BREAK_TIME
    }

}