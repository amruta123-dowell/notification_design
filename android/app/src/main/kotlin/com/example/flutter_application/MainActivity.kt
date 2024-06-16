//package com.example.flutter_application
//import android.annotation.SuppressLint
//import android.app.NotificationChannel
//import android.app.NotificationManager
//import android.os.Build
//import android.os.Bundle
//import android.widget.RemoteViews
//import androidx.core.app.NotificationCompat
//import androidx.core.app.NotificationManagerCompat
//import io.flutter.embedding.android.FlutterActivity
//
//import io.flutter.plugin.common.MethodCall
//import io.flutter.plugin.common.MethodChannel
//
//import android.content.Context
//
//class MainActivity : FlutterActivity() {
//    private val channel = "flutter/notifications"
//    private val channelId = "custom_notification_channel"
//
//    override fun onCreate(savedInstanceState: Bundle?) {
//
//        super.onCreate(savedInstanceState)
//
//        createNotificationChannel()
//        MethodChannel(flutterEngine!!.dartExecutor.binaryMessenger, channel).setMethodCallHandler { call: MethodCall, result: MethodChannel.Result ->
//            if (call.method == "showCustomNotification") {
//                 val data = call.arguments as Map<String, String>
//                showCustomNotification(data)
//                result.success(null)
//            } else {
//                result.notImplemented()
//            }
//        }
//    }
//
//    private fun createNotificationChannel() {
//        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
//            val name = "Custom Notification Channel"
//            val descriptionText = "Channel for custom notifications"
//            val importance = NotificationManager.IMPORTANCE_DEFAULT
//            val channel = NotificationChannel(channelId, name, importance).apply {
//                description = descriptionText
//            }
//            val notificationManager: NotificationManager =
//                    getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
//            notificationManager.createNotificationChannel(channel)
//        }
//    }
//
//
//    private fun showCustomNotification(data: Map<String, String>) {
//
//        val notificationLayout = RemoteViews(packageName, R.layout.notification_design).apply {
//            setTextViewText(R.id.departure, data["currentLocation"])
//            setTextViewText(R.id.arriveLocation, data["destination"])
//            setTextViewText(R.id.departure_time, data["departedTime"])
//            setTextViewText(R.id.arriving_time, data["arrivingTime"])
//            setTextViewText(R.id.flight_number, data["flightNo"])
//            setTextViewText(R.id.flightStatus, data["planeStatus"])
//            setTextViewText(R.id.seatNo, data["seatNo"])
//
////            setTextViewText(R.id.seat, data["seatNo"])
//            setTextViewText(R.id.gate, data["gateNo"])
//        }
////        val notificationLayout = RemoteViews(packageName, R.layout.notification_design)
//
//        val builder = NotificationCompat.Builder(this, channelId)
//                .setSmallIcon(R.drawable.icons)
//                .setStyle(NotificationCompat.DecoratedCustomViewStyle())
//                .setCustomContentView(notificationLayout)
//                .setPriority(NotificationCompat.PRIORITY_DEFAULT)
//
//
//
//        with(NotificationManagerCompat.from(this)) {
//            notify(1, builder.build())
//        }
//    }
//}



package com.example.flutter_application

import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.content.Context
import android.content.Intent
import android.os.Build
import android.os.Bundle
import android.widget.RemoteViews
import androidx.core.app.NotificationCompat
import androidx.core.app.NotificationManagerCompat
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val channel = "flutter/notifications"
    private val channelId = "custom_notification_channel"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        createNotificationChannel()
        MethodChannel(flutterEngine!!.dartExecutor.binaryMessenger, channel).setMethodCallHandler { call: MethodCall, result: MethodChannel.Result ->
            if (call.method == "showCustomNotification") {
                val data = call.arguments as Map<String, String>
                showCustomNotification(data)
                result.success(null)
            } else {
                result.notImplemented()
            }
        }
    }

    private fun createNotificationChannel() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val name = "Custom Notification Channel"
            val descriptionText = "Channel for custom notifications"
            val importance = NotificationManager.IMPORTANCE_DEFAULT
            val channel = NotificationChannel(channelId, name, importance).apply {
                description = descriptionText
            }
            val notificationManager: NotificationManager =
                getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
            notificationManager.createNotificationChannel(channel)
        }
    }

    private fun showCustomNotification(data: Map<String, String>) {

        val notificationLayout = RemoteViews(packageName, R.layout.notification_design).apply {
            setTextViewText(R.id.departure, data["currentLocation"])
            setTextViewText(R.id.departure_time, data["departureTime"])
            setTextViewText(R.id.arriveLocation, data["arriveLocation"])
            setTextViewText(R.id.arriveLocation, data["destination"])
            setTextViewText(R.id.departure_time, data["departedTime"])
            setTextViewText(R.id.arriving_time, data["arrivingTime"])
            setTextViewText(R.id.flight_number, data["flightNo"])
            setTextViewText(R.id.gate, data["gate"])
            setTextViewText(R.id.seatNo, data["seatNo"])
            setTextViewText(R.id.flightStatus, data["planeStatus"])
        }

        val pendingIntent: PendingIntent = PendingIntent.getActivity(this, 0, intent, PendingIntent.FLAG_IMMUTABLE)

        val customNotification = NotificationCompat.Builder(this, channelId)
            .setSmallIcon(R.drawable.icons)

            .setPriority(NotificationCompat.PRIORITY_DEFAULT)
            .setCustomContentView(notificationLayout)
            .setColor(10)
            .setColorized(true)
            .setStyle(NotificationCompat.DecoratedCustomViewStyle())


//            .setCustomBigContentView(notificationLayout)
//            .setPriority(NotificationCompat.PRIORITY_DEFAULT)



            .setContentIntent(pendingIntent)
            .build()


        with(NotificationManagerCompat.from(this)) {
            notify(1, customNotification)
        }
    }
}


