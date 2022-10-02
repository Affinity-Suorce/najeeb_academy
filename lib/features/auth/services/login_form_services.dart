import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:najeeb_academy/app/di.dart';
import 'package:najeeb_academy/app/extensions/dialog_build_context.dart';
import 'package:najeeb_academy/app/router/app_router.dart';
import 'package:najeeb_academy/app/widgets/loading.dart';
import 'package:najeeb_academy/core/network/urls.dart';
import 'package:najeeb_academy/features/auth/repositories/user_info_repository.dart';

class LoginFormService extends ChangeNotifier {
  final Dio _api;
  final UserInfoRepository _userInfo;

  LoginFormService(
    this._api,
    this._userInfo,
  );
  final formKey = GlobalKey<FormBuilderState>();

  Future<void> login({
    required BuildContext context,
    required void Function(String message) onFailed,
  }) async {
    final formState = formKey.currentState;
    if (formState != null && formState.validate()) {
      final cancelToken = CancelToken();
      context
          .showDialog(const Loading(), barrierDismissible: false)
          .then((value) {
        cancelToken.cancel('cancel');
      });
      final username = formState.fields['username']!.value;
      final password = formState.fields['password']!.value;

      try {
        final response = await (_api.post(
          loginUrl,
          data: {
            'username': username,
            'password': password,
          },
          cancelToken: cancelToken,
        )).then((value) {
          Navigator.pop(context);
          return value;
        });
        final data = response.data as Map<String, dynamic>;
        if (data.containsKey('data')) {
          if (data['data'] == false) {
            return onFailed('خطأ في اسم المستخدم أو كلمة المرور');
          }
          if (data['data'] == null) {
            return onFailed('لا يمكنك التسجيل حالياً, الرجاء المحاولة لاحقاً');
          }
          await _userInfo.storeFromApi(data).then((success) {
            if (!success) {
              return onFailed('حدث خطأ غير متوقع');
            }
            DI.router.replaceAll([const MainRoute()]);
          });
        }
      } on DioError catch (e) {
        if ([
          DioErrorType.other,
          DioErrorType.connectTimeout,
          DioErrorType.receiveTimeout,
          DioErrorType.sendTimeout,
        ].contains(e.type)) {
          return onFailed('لايمكن الاتصال بالشبكة');
        }
        if (e.message != 'cancel') {
          Navigator.pop(context);
          onFailed(e.message);
        }
      }
    }
  }
}
