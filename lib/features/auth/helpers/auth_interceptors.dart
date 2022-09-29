import 'package:dio/dio.dart';
import 'package:najeeb_academy/features/auth/repositories/user_info_repository.dart';

class AuthInterceptor extends Interceptor {
  final UserInfoRepository userInfo;

  AuthInterceptor(this.userInfo);
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({
      "X-Requested-With": "XMLHttpRequest",
      'Content-Type': 'application/json',
      if (userInfo.isAuthenticated) 'Authorization': 'Bearer ${userInfo.token}',
    });

    return handler.next(options);
  }
}
