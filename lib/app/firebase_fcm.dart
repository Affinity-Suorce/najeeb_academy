import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'notificationservice.dart';

class FirebaseFCM {
  static late BuildContext context;

  static Future<void> _messageHandler(RemoteMessage message) async {
    print(message.data);
    NotificationService().showAlertNotification(1, message.data["title"],
        message.data["body"]);
  }

  static Future<void> initialize() async {
    await Firebase.initializeApp();
    await FirebaseMessaging.instance.setAutoInitEnabled(true);
    FirebaseMessaging.instance.getToken();
    FirebaseMessaging.onBackgroundMessage(_messageHandler);
    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      print("foreground message recieved");
      print(event.data);
      NotificationService().showAlertNotification(
          1, event.data["title"], event.data["body"]);
    });
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      print("FirebaseMessaging.instance.getInitialMessage");
      if (message != null) {
        print(message.data);
        NotificationService().showAlertNotification(1, message.data["title"],
            message.data["body"]);
      }
    });
  }
}
