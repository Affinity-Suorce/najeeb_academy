import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:najeeb_academy/core/network/urls.dart';

import '../../../app/di.dart';

class CreateClassedOrderService extends ChangeNotifier {
  final Dio _api;
  bool isLoaded = true;
  CreateClassedOrderService(this._api);

  Future<bool> addCourse(
      {required List<int> subjectIds,
      required List<int> classesIds,
      required String paidAmount,
      required String billNumber}) async {
    try {
      isLoaded = false;
      notifyListeners();
      print({
        "payment_method_id": 1,
        // "subjects_ids": classesIds,
        "subjects_ids": jsonEncode(subjectIds),
        "amount": int.parse(paidAmount),
        "bill_number": billNumber
      });
      final response = await Dio().post(myClassesOrderCreateUrl, data: {
        "payment_method_id": 1,
        // "subjects_ids": classesIds,
        "subjects_ids": subjectIds,
        "amount": int.parse(paidAmount),
        "bill_number": billNumber
      },
      options: Options (
        validateStatus: (_) => true,
          contentType: Headers.jsonContentType,
          responseType:ResponseType.json,
          headers: {
            "Authorization":"Bearer ${DI.userInfo.token}",
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            }
          ));
      print(response.data);
      // final data = response.data;
      if (response.statusCode == 200) {
        // debugPrint("data['data']");
        isLoaded = true;
        notifyListeners();
        return true;
      } else {
        isLoaded = true;
        notifyListeners();
        return false;
      }
    } catch (e) {
      isLoaded = true;
      print(e.toString());
      notifyListeners();
      return false;
    }
  }
}
