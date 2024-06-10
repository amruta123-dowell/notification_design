import 'package:flutter/material.dart';
import 'package:flutter_application/home_screen.dart';

import 'package:flutter_application/home_screen2.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // AwesomeNotifications().initialize(
  //     null,
  //     [
  //       NotificationChannel(
  //         channelKey: 'basic_channel',
  //         channelName: 'Basic notifications',
  //         channelDescription: 'Notification channel for basic tests',
  //         defaultColor: Color(0xFF9D50DD),
  //         ledColor: Colors.white,
  //         importance: NotificationImportance.High,
  //       ),
  //     ],
  //     debug: true);

  runApp(const MyApp());
  // requestNotificationPermission();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: SafeArea(child: HomeScreen()));
  }
}
