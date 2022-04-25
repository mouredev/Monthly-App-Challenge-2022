package com.esaudev.pomodoro.data.room.converters

import androidx.room.TypeConverter
import java.util.*

class ActivityDetailTypeConverters {

    @TypeConverter
    fun fromLocalDateToString(date: Date): Long {
        return date.time
    }

    @TypeConverter
    fun fromStringToLocalDate(long: Long): Date {
        return Date(long)
    }
}
