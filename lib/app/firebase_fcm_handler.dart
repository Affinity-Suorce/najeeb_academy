import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'local_notification_service.dart';

class FirebaseFCMHandler {
  static late BuildContext context;

  static Future<void> _messageHandler(RemoteMessage message) async {
    print("got message!!!!!");
    LocalNotificationService().showAlertNotification(1, message.data["title"],
        message.data["body"]);
  }

  static Future<void> initialize() async {
    await Firebase.initializeApp();
    await FirebaseMessaging.instance.setAutoInitEnabled(true);
    FirebaseMessaging.instance.getToken();
    FirebaseMessaging.onBackgroundMessage(_messageHandler);
    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
          print("got message!!!!!");

    LocalNotificationService().showAlertNotification(
          1, event.data["title"], event.data["body"]);
    });
    FirebaseMessaging.instance.getInitialMessage().then((message) {
          print("got message!!!!!");

      if (message != null) {
        
        LocalNotificationService().showAlertNotification(1, message.data["title"],
            message.data["body"]);
      }
    });
  }
}
