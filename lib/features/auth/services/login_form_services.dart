import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:najeeb_academy/core/network/urls.dart';

class LoginFormService extends ChangeNotifier {
  final Dio _api;
  LoginFormService(this._api);
  final formKey = GlobalKey<FormBuilderState>();

  Future<void> login({
    required void Function(DioError e) onFailed,
  }) async {
    final formState = formKey.currentState;
    if (formState != null && formState.validate()) {
      final username = formState.fields['username']!.value;
      final password = formState.fields['password']!.value;
      try {
        final response = await _api.post(
          loginUrl,
          data: {
            'username': username,
            'password': password,
          },
        );
        debugPrint(response.data);
      } on DioError catch (e) {
        onFailed(e);
        debugPrint(e.message);
      }
    }
  }
}
