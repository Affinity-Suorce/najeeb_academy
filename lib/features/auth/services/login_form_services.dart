import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:najeeb_academy/app/extensions/dialog_build_context.dart';
import 'package:najeeb_academy/app/widgets/loading.dart';
import 'package:najeeb_academy/core/network/urls.dart';

class LoginFormService extends ChangeNotifier {
  final Dio _api;

  LoginFormService(this._api);
  final formKey = GlobalKey<FormBuilderState>();

  Future<void> login({
    required BuildContext context,
    required void Function(DioError e) onFailed,
  }) async {
    final formState = formKey.currentState;
    if (formState != null && formState.validate()) {
      // final cancelToken = CancelToken();
      context
          .showDialog(const Loading(), barrierDismissible: false)
          .then((value) {
        // cancelToken.cancel('cancel');
      });
      final username = formState.fields['username']!.value;
      final password = formState.fields['password']!.value;

      try {
        final response = await _api.post(
          loginUrl,
          data: {
            'username': username,
            'password': password,
          },
          // cancelToken: cancelToken,
        );
        Navigator.pop(context);
        debugPrint(response.data);
      } on DioError catch (e) {
        if (e.message != 'cancel') {
          onFailed(e);
          debugPrint(e.message);
        }
      }
    }
  }
}
