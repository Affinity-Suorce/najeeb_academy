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
      //TODO: remove in production
      // if (userInfo.isAuthenticated) 'Authorization': 'Bearer ${userInfo.token}',
      'Authorization':
          'Bearer iU0J0HyfsJZoUWhA7yz9awWw3owCiMmuvDedECCXrFrSJoVJzEksSyNTMmzAcUhKwKfcTHycXfOQtAtw',
    });

    return handler.next(options);
  }
}
