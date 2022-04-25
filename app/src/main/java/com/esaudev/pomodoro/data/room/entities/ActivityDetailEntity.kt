package com.esaudev.pomodoro.data.room.entities

import android.os.Parcelable
import androidx.room.Entity
import androidx.room.PrimaryKey
import com.esaudev.pomodoro.util.Constants.ACTIVITY_DETAIL_ENTITY
import kotlinx.parcelize.Parcelize
import java.time.LocalDate
import java.util.*

@Parcelize
@Entity(tableName = ACTIVITY_DETAIL_ENTITY)
data class ActivityDetailEntity(
    @PrimaryKey(autoGenerate = false)
    val id: String= UUID.randomUUID().toString(),
    val name: String,
    val workSeconds: Int,
    val breakSeconds: Int,
    val date: Date
): Parcelable
