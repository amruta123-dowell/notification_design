import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen2 extends StatelessWidget {
  const HomeScreen2({super.key});

  void createFlightNotification() {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: 10,
          channelKey: 'basic_channel',
          title: 'Air India AI 540',
          body: '<b>Flight from DEL to MAA</b><br>'
              '<i>Gate 34B</i><br>'
              '<u>Seat 17F</u><br>'
              '<img src="asset:/assets/notification_icon.png" alt="Graph Icon" width="50" height="50"/><br>',
          notificationLayout: NotificationLayout.BigPicture,
          payload: {'boarding_time': '50:19'},
          bigPicture: "assets/background_image.jpg"),
      actionButtons: [
        NotificationActionButton(
          key: 'MARK_DONE',
          label: 'Boarding ends in 50:19',
          color: Colors.red,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: Text(
          'Flight Notification',
          style: TextStyle(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: createFlightNotification,
              child: const Text(
                'Show Notification',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Image.asset("assets/background_image.jpg")
        ],
      ),
    );
    ;
  }
}
