import 'package:dio/dio.dart';
import 'package:najeeb_academy/features/auth/repositories/user_info_repository.dart';

class AuthInterceptor extends Interceptor {
  final UserInfoRepository userInfo;

  AuthInterceptor(this.userInfo);
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.contentType = 'application/json';
    if (userInfo.isAuthenticated) {
      options.headers.addAll({'Authorization': 'Bearer ${userInfo.token}'});
    }
  }
}
