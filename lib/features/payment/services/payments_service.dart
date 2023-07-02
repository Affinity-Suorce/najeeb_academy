import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:najeeb_academy/app/di.dart';
import 'package:najeeb_academy/core/network/urls.dart';
import 'package:najeeb_academy/features/payment/models/payment.dart';

class PaymentsService extends ChangeNotifier {
  final Dio _api;
  List<Payment>? payments;

  PaymentsService(this._api);

  Future<bool> load() async {
    // try {
      final response = await Dio().get(myPaymentsUrl,
      options: Options (
          contentType: Headers.jsonContentType,
          responseType:ResponseType.json,
          headers: {"Authorization":"Bearer ${DI.userInfo.token}"}
          )
      );
      final data = response.data;
      if (response.statusCode == 200 &&
          data is Map<String, dynamic> &&
          data.containsKey('data')) {
        debugPrint(data['data'].toString());
        final List paymentsJson = data['data'];
        payments = List<Payment>.from(paymentsJson.reversed.map((paymentJson) {
          return Payment.fromMap(paymentJson);
        }));

        notifyListeners();
        return true;
      }
      return false;
    // } catch (e) {
    //   debugPrint("we have got an error\t"+e.toString());
    //   return false;
    // }
  }
}
