import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  static final LocalNotificationService _notificationService = LocalNotificationService._internal();

  factory LocalNotificationService() {
    return _notificationService;
  }

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  LocalNotificationService._internal();

  Future<void> initNotification() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
     AndroidInitializationSettings('mipmap/ic_launcher');

    const IOSInitializationSettings initializationSettingsIOS =
     IOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    const InitializationSettings initializationSettings =
     InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> showAlertNotification(int id, String title, String body) async {
    await flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      
       const NotificationDetails(
        android: AndroidNotificationDetails(
          'main_channel',
          'main Channel',
          channelDescription: 'main channel notifications',
          importance: Importance.max,
          priority: Priority.max,
          icon: 'mipmap/ic_launcher',
          enableVibration: true,
          color: Colors.white,
          colorized: true,
          styleInformation: DefaultStyleInformation(
            false,
            false,
          ),
        ),
        iOS: IOSNotificationDetails(
          sound: 'default.wav',
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      )
    );
  }

  Future<void> cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }
}