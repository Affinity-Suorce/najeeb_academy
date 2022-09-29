import 'package:najeeb_academy/features/auth/repositories/user_info_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeService {
  final SharedPreferences _preferences;
  final UserInfoRepository _userInfo;

  WelcomeService(this._preferences, this._userInfo);

  static const _isFirstTimeOpenKey = 'is-first-time-open-key';

  Future<bool> setIsFirstTime(bool isFirstTime) {
    return _preferences.setBool(_isFirstTimeOpenKey, isFirstTime);
  }

  UserState get userState {
    if (_userInfo.isAuthenticated) {
      return UserState.authenticated;
    }
    return (_preferences.getBool(_isFirstTimeOpenKey) ?? true)
        ? UserState.firstTime
        : UserState.guest;
  }
}

enum UserState {
  firstTime,
  authenticated,
  guest,
}
