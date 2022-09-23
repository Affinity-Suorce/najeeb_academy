import 'package:shared_preferences/shared_preferences.dart';

class UserInfoRepository {
  final SharedPreferences _preferences;

  const UserInfoRepository(this._preferences);

  static const _tokenKey = 'token-key';

  Future<bool> setToken(String? token) => token == null
      ? _preferences.remove(_tokenKey)
      : _preferences.setString(_tokenKey, token);

  String? get token => _preferences.getString(_tokenKey);
}
