import 'package:flutter/cupertino.dart';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:najeeb_academy/app/di.dart';
import 'package:najeeb_academy/core/helpers/funcs.dart';
import 'package:najeeb_academy/core/network/urls.dart';

import 'package:najeeb_academy/features/lectures/models/event.dart';

class ScheduleService extends ChangeNotifier {
  final Dio _api;

  EventModel? events;
  bool? isLoaded;

  ScheduleService(this._api);

  Future<String> getEvents() async {
    try {
      final response = await Dio().get(eventsUrl,
      options: Options (
          validateStatus: (_) => true,
          contentType: Headers.jsonContentType,
          responseType:ResponseType.json,
          headers: {"Authorization":"Bearer ${DI.userInfo.token}"}
          ));
      final data = response.data;
      if (response.statusCode == 200) {
        events = eventModelFromJson(data);
        isLoaded = true;
        notifyListeners();
        return 'success';
      }
      return getResponseMessage(data);
    } catch (e) {
      return 'خطأ غير معروف';
    }
  }
}
