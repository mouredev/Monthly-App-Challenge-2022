package com.esaudev.pomodoro.domain.repository

import com.esaudev.pomodoro.data.room.entities.ActivityDetailEntity

interface ActivitiesRepository {

    suspend fun getAllActivitiesByDate(): List<ActivityDetailEntity>

    suspend fun saveActivity(activity: ActivityDetailEntity)

}