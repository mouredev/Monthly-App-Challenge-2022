package com.esaudev.pomodoro.util

import com.esaudev.pomodoro.domain.model.CurrentActivity

fun getTotalWorkSecondsFromWork(
    latestWorkSeconds: Int,
    currentActivity: CurrentActivity
): Int {
    return if(currentActivity.cycles > 0) when(currentActivity.workRound) {
        CurrentActivity.WorkRounds.FIRST -> (currentActivity.cycles*4*25*60)+ (latestWorkSeconds)
        CurrentActivity.WorkRounds.SECOND -> (currentActivity.cycles*4*25*60)+ (latestWorkSeconds) + (1*25*60)
        CurrentActivity.WorkRounds.THIRD -> (currentActivity.cycles*4*25*60)+ (latestWorkSeconds) + (2*25*60)
        CurrentActivity.WorkRounds.FOURTH -> (currentActivity.cycles*4*25*60)+ (latestWorkSeconds) + (3*25*60)
    }
    else when(currentActivity.workRound) {
        CurrentActivity.WorkRounds.FIRST -> latestWorkSeconds
        CurrentActivity.WorkRounds.SECOND -> (1*25*60) + latestWorkSeconds
        CurrentActivity.WorkRounds.THIRD -> (2*25*60) + latestWorkSeconds
        CurrentActivity.WorkRounds.FOURTH -> (3*25*60) + latestWorkSeconds
    }
}

fun getTotalWorkSecondsFromBreak(
    currentActivity: CurrentActivity
): Int {
    return if(currentActivity.cycles > 0) when(currentActivity.workRound) {
        CurrentActivity.WorkRounds.FIRST -> (currentActivity.cycles*4*25*60)
        CurrentActivity.WorkRounds.SECOND -> (currentActivity.cycles*4*25*60) + (2*25*60)
        CurrentActivity.WorkRounds.THIRD -> (currentActivity.cycles*4*25*60) + (3*25*60)
        CurrentActivity.WorkRounds.FOURTH -> (currentActivity.cycles*4*25*60) + (4*25*60)
    }
    else when(currentActivity.workRound) {
        CurrentActivity.WorkRounds.FIRST -> (1*25*60)
        CurrentActivity.WorkRounds.SECOND -> (2*25*60)
        CurrentActivity.WorkRounds.THIRD -> (3*25*60)
        CurrentActivity.WorkRounds.FOURTH -> (4*25*60)
    }
}

fun getTotalBreakTimeFromBreak(
    latestBreakSeconds: Int,
    currentActivity: CurrentActivity
): Int {
    return if(currentActivity.cycles > 0) when(currentActivity.breakRound) {
        CurrentActivity.BreakRounds.FIRST -> (currentActivity.cycles*3*5*60)+ (latestBreakSeconds) + (60*currentActivity.customBreak*currentActivity.cycles)
        CurrentActivity.BreakRounds.SECOND -> (currentActivity.cycles*3*5*60)+ (latestBreakSeconds) + (60*currentActivity.customBreak*currentActivity.cycles) + (1*5*60)
        CurrentActivity.BreakRounds.THIRD -> (currentActivity.cycles*3*5*60)+ (latestBreakSeconds) + (60*currentActivity.customBreak*currentActivity.cycles) + (2*5*60)
        CurrentActivity.BreakRounds.FOURTH -> (currentActivity.cycles*3*5*60)+ (latestBreakSeconds) + (60*currentActivity.customBreak*currentActivity.cycles) + (3*5*60)
    }
    else when(currentActivity.breakRound) {
        CurrentActivity.BreakRounds.FIRST -> latestBreakSeconds
        CurrentActivity.BreakRounds.SECOND -> (1*5*60) + latestBreakSeconds
        CurrentActivity.BreakRounds.THIRD -> (2*5*60) + latestBreakSeconds
        CurrentActivity.BreakRounds.FOURTH -> (3*5*60) + latestBreakSeconds
    }
}

fun getTotalBreakTimeFromWork(
    currentActivity: CurrentActivity
): Int {
    return if(currentActivity.cycles > 0) when(currentActivity.breakRound) {
        CurrentActivity.BreakRounds.FIRST -> (currentActivity.cycles*3*5*60) + (60*currentActivity.customBreak*currentActivity.cycles)
        CurrentActivity.BreakRounds.SECOND -> (currentActivity.cycles*3*5*60) + (60*currentActivity.customBreak*currentActivity.cycles) + (1*5*60)
        CurrentActivity.BreakRounds.THIRD -> (currentActivity.cycles*3*5*60) + (60*currentActivity.customBreak*currentActivity.cycles) + (2*5*60)
        CurrentActivity.BreakRounds.FOURTH -> (currentActivity.cycles*3*5*60) + (60*currentActivity.customBreak*currentActivity.cycles) + (3*5*60)
    }
    else when(currentActivity.breakRound) {
        CurrentActivity.BreakRounds.FIRST -> 0
        CurrentActivity.BreakRounds.SECOND -> (1*5*60)
        CurrentActivity.BreakRounds.THIRD -> (2*5*60)
        CurrentActivity.BreakRounds.FOURTH -> (3*5*60)
    }
}