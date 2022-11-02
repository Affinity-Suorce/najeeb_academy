import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:najeeb_academy/core/network/urls.dart';

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
      final response = await _api.post(myClassesOrderCreateUrl, data: {
        "is_installment": 0,
        "my_class_id": classesIds,
        "subject_id": subjectIds,
        "amount_paid": paidAmount,
        "bill_number": billNumber
      });

      final data = response.data;
      if (response.statusCode == 200) {
        debugPrint("data['data']");
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
      notifyListeners();
      return false;
    }
  }
}
