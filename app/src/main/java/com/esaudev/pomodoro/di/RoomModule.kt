package com.esaudev.pomodoro.di

import android.content.Context
import androidx.room.Room
import com.esaudev.pomodoro.data.room.PomodoroDatabase
import com.esaudev.pomodoro.util.Constants.POMODORO_DATABASE
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.android.qualifiers.ApplicationContext
import dagger.hilt.components.SingletonComponent
import javax.inject.Singleton

@Module
@InstallIn(SingletonComponent::class)
object RoomModule {

    @Singleton
    @Provides
    fun provideEventsDatabase(
        @ApplicationContext context: Context
    ) = Room.databaseBuilder(context, PomodoroDatabase::class.java, POMODORO_DATABASE).build()

    @Singleton
    @Provides
    fun provideEventsDao(db: PomodoroDatabase) = db.activitiesDao()

}