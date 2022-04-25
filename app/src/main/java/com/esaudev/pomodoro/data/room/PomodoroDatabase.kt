package com.esaudev.pomodoro.data.room

import androidx.room.Database
import androidx.room.RoomDatabase
import androidx.room.TypeConverters
import com.esaudev.pomodoro.data.room.converters.ActivityDetailTypeConverters
import com.esaudev.pomodoro.data.room.dao.ActivityDetailDao
import com.esaudev.pomodoro.data.room.entities.ActivityDetailEntity

@Database(
    entities = [ActivityDetailEntity::class],
    version = 1
)
@TypeConverters(ActivityDetailTypeConverters::class)
abstract class PomodoroDatabase: RoomDatabase() {

    abstract fun activitiesDao(): ActivityDetailDao

}