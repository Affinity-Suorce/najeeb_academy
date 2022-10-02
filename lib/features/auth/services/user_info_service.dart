import 'package:dio/dio.dart';
import 'package:najeeb_academy/core/network/urls.dart';
import 'package:najeeb_academy/features/auth/repositories/user_info_repository.dart';

class UserInfoService {
  final Dio _api;
  final UserInfoRepository _userInfo;

  const UserInfoService(
    this._api,
    this._userInfo,
  );
  Future<bool> updateUserInfo() async {
    try {
      final response = await _api.get(userInfoUrl);
      final data = response.data;
      if (response.statusCode != 200 ||
          data is! Map<String, dynamic> ||
          !data.containsKey('id') ||
          data['id'] == null) {
        return false;
      }
      final success = await _userInfo.storeFromApiData(data);
      return success;
    } catch (e) {
      return false;
    }
  }
}
