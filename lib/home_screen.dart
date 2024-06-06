import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late FlutterLocalNotificationsPlugin flutterNotificationPlugIn =
      FlutterLocalNotificationsPlugin();
  final MethodChannel platformChannel =
      const MethodChannel("flutter/notifications");

  @override
  void initState() {
    super.initState();
    flutterNotificationPlugIn = FlutterLocalNotificationsPlugin();
    initializeNotifications();
  }

  void initializeNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    InitializationSettings initializationSettings =
        const InitializationSettings(android: initializationSettingsAndroid);

    await flutterNotificationPlugIn.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) async {
        if (response.payload != null) {
          debugPrint('notification payload: ${response.payload}');
        }
      },
    );

    // Define a notification channel
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'flight_updates', // Channel ID
      'Flight Updates', // Channel name
      description:
          'Notifications for flight updates and boarding information', // Channel description
      importance: Importance.high,
    );

    // Create the channel on the device
    await flutterNotificationPlugIn
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  Future<void> showNotification() async {
    // Define a notification channel
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      "flightUpdate", "FlightUpdate",
      channelDescription:
          'Notifications for flight updates and boarding information', // Channel description
      importance: Importance.high,
      ticker: 'ticker',
      styleInformation: BigTextStyleInformation(''),
    );

    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidNotificationDetails,
    );
    //Create the channel on the device
    await flutterNotificationPlugIn.show(
      0,
      'Air India AI 540',
      'DEL to MAA: 20:40 - 23:22\nGate: 34B\nSeat: 17F\nBoarding ends in: 50:19',
      platformChannelSpecifics,
      payload: 'item x',
    );
  }

  showNotificationPlatformChannel() async {
    try {
      await platformChannel.invokeMethod('showCustomNotification');
    } catch (e) {
      log("error string -----> $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "PLEASE CLICK ON TO SHOW NOTIFICATION",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () async {
              showNotificationPlatformChannel();
            },
            child: Container(
              height: 30,
              decoration: BoxDecoration(
                  color: Colors.pink, borderRadius: BorderRadius.circular(10)),
              alignment: Alignment.center,
              child: const Text("Notification"),
            ),
          ),
        ],
      ),
    ));
  }
}
