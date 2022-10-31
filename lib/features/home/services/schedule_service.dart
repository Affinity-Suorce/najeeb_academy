import 'package:flutter/cupertino.dart';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
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
      final response = await _api.get(eventsUrl);
      final data = response.data;
      debugPrint('data is : ${data['data']}');
      if (response.statusCode == 200) {
        events = eventModelFromJson(data['data']);
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
