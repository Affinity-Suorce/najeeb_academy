import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:najeeb_academy/app/app.dart';
import 'package:najeeb_academy/app/di.dart';
import 'package:najeeb_academy/app/extensions/dialog_build_context.dart';
import 'package:najeeb_academy/app/router/app_router.dart';
import 'package:najeeb_academy/app/widgets/loading.dart';
import 'package:najeeb_academy/core/network/urls.dart';
import 'package:najeeb_academy/features/auth/repositories/user_info_repository.dart';

class LoginFormService extends ChangeNotifier {
  final UserInfoRepository _userInfo;

  LoginFormService(
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
      String username = formState.fields['username']!.value;
      String password = formState.fields['password']!.value;
      // final fcm_token = await FirebaseMessaging.instance.getToken();
      Dio api=Dio();
      try {
        final response = await api.post(
          loginUrl,
          data: {
            'username': username,
            'password': password,
            'fcm_token':NajeebAcademyApp.fcmToken,
          },
          cancelToken: cancelToken,
          options: Options (
          validateStatus: (_) => true,
          contentType: Headers.jsonContentType,
          responseType:ResponseType.json,
          )
        ).then((value) {
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
          await _userInfo
              .storeFromApiData(data['data'])
              .then((success) {
            if (!success) {
              return onFailed('حدث خطأ غير متوقع');
            }
            DI.router.replaceAll([const MainRoute()]);
          });
        }
        return onFailed(data['message']??"");
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
