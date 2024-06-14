import 'package:flutter/material.dart';
import 'package:flutter_application/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: SafeArea(child: HomeScreen()));
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   static const platform = MethodChannel('flutter/notifications');

//   Future<void> _showNotification() async {
//     try {
//       await platform.invokeMethod('showCustomNotification', {
//         'gateNo': '34B',
//         'seatNo': '17F',
//         'departureTime': '20:40',
//         'arrivalTime': '23:22',
//         'progress': 50,
//         "status": "On time",
//       });
//     } on PlatformException catch (e) {
//       print("Failed to show notification: '${e.message}'.");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Flutter to Native Notification'),
//         ),
//         body: Center(
//           child: ElevatedButton(
//             onPressed: _showNotification,
//             child: Text('Show Notification'),
//           ),
//         ),
//       ),
//     );
//   }
// }
