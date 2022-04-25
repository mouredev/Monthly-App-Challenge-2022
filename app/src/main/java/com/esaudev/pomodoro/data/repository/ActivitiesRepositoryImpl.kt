package com.esaudev.pomodoro.data.repository

import com.esaudev.pomodoro.data.room.dao.ActivityDetailDao
import com.esaudev.pomodoro.data.room.entities.ActivityDetailEntity
import com.esaudev.pomodoro.domain.repository.ActivitiesRepository
import javax.inject.Inject

class ActivitiesRepositoryImpl @Inject constructor(
    private val dao: ActivityDetailDao
): ActivitiesRepository {

    override suspend fun getAllActivitiesByDate(): List<ActivityDetailEntity> {
        return dao.getAllActivities().sortedBy { it.date }
    }

    override suspend fun saveActivity(activity: ActivityDetailEntity) {
        dao.insertActivityDetail(activity = activity)
    }

}