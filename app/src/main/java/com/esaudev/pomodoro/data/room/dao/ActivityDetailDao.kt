package com.esaudev.pomodoro.data.room.dao

import androidx.room.Dao
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.Query
import com.esaudev.pomodoro.data.room.entities.ActivityDetailEntity

@Dao
interface ActivityDetailDao {

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertActivityDetail(activity: ActivityDetailEntity)

    @Query("SELECT * FROM activity_details_entity")
    suspend fun getAllActivities(): List<ActivityDetailEntity>

}