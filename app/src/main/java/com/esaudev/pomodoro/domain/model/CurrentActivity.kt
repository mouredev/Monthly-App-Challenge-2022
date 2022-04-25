package com.esaudev.pomodoro.domain.model

import android.os.Parcelable
import kotlinx.parcelize.Parcelize
import java.util.*

@Parcelize
data class CurrentActivity (
    val id: String = UUID.randomUUID().toString(),
    val workRound: WorkRounds = WorkRounds.FIRST,
    val breakRound: BreakRounds = BreakRounds.FIRST,
    val name: String,
    val customBreak: Int = 15,
    val cycles: Int = 0
        ): Parcelable {
    enum class WorkRounds {
        FIRST, SECOND, THIRD, FOURTH
    }

    enum class BreakRounds {
        FIRST, SECOND, THIRD, FOURTH
    }
}