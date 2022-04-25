package com.esaudev.pomodoro.util

import android.app.NotificationManager
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import androidx.core.app.NotificationCompat
import androidx.core.content.ContextCompat
import com.esaudev.pomodoro.R

class NotificationReceiver: BroadcastReceiver() {

    private val EXTRAS_MESSAGE = "extra_message"

    override fun onReceive(context: Context, intent: Intent) {
        val notificationManager = ContextCompat.getSystemService(
            context,
            NotificationManager::class.java
        ) as NotificationManager

        val message = intent.getStringExtra(EXTRAS_MESSAGE).orEmpty().ifEmpty { "Has terminado un sprint" }

        notificationManager.sendNotification(
            message,
            context
        )
    }
}