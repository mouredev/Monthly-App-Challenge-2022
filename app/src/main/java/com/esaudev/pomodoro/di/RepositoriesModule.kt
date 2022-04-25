package com.esaudev.pomodoro.di

import com.esaudev.pomodoro.data.repository.ActivitiesRepositoryImpl
import com.esaudev.pomodoro.domain.repository.ActivitiesRepository
import dagger.Binds
import dagger.Module
import dagger.hilt.InstallIn
import dagger.hilt.components.SingletonComponent

@Module
@InstallIn(SingletonComponent::class)
@Suppress("unused")
abstract class RepositoriesModule {

    @Binds
    abstract fun bindActivitiesRepository(
        activitiesRepository: ActivitiesRepositoryImpl
    ): ActivitiesRepository

}