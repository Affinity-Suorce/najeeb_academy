import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:najeeb_academy/core/network/urls.dart';

import '../models/notification_model.dart';

class NotificationsService extends ChangeNotifier {
  final Dio _api;

  List<NotificationModel>? notifications;
  bool hasUnseenNotifications = false;
  int unseenNotificationsCount = 0;

  NotificationsService(this._api);

  Future<bool> load() async {
    try {
      final response = await _api.get(myNotificationsAllUrl);
      final data = response.data;
      if (response.statusCode == 200 &&
          data is Map<String, dynamic> &&
          data.containsKey('data')) {
        final List notificationsJson = data['data'];

        notifications = List<NotificationModel>.from(
            notificationsJson.reversed.map((notificationJson) {
          return NotificationModel.fromMap(notificationJson);
        }));
        // notifications.sort(((a, b) {
        //   if(a.seen ^ b.seen){

        //   }
        // }))
        notifyListeners();
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> get checkHasNotifications async {
    try {
      final response = await _api.get(myNotificationsUnseenUrl);
      final data = response.data;
      if (response.statusCode == 200 &&
          data is Map<String, dynamic> &&
          data.containsKey('data')) {
        final List notificationsJson = data['data'];
        unseenNotificationsCount = notificationsJson.length;
        hasUnseenNotifications = notificationsJson.isNotEmpty;
        notifyListeners();
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> get makeAllNotificationsSeen async {
    try {
      final response = await _api.put(myNotificationsUrl, data: {
        "notifications": [0],
      });
      final data = response.data;
      if (response.statusCode == 200 &&
          data is Map<String, dynamic> &&
          data.containsKey('data')) {
        final List notificationsJson = data['data'];

        notifications = List<NotificationModel>.from(
            notificationsJson.reversed.map((notificationJson) {
          return NotificationModel.fromMap(notificationJson);
        }));
        // notifications.sort(((a, b) {
        //   if(a.seen ^ b.seen){

        //   }
        // }))
        notifyListeners();
        return true;
      }
      return false;
    } catch (e) {
      return false;
    } finally {
      checkHasNotifications;
    }
  }
}
