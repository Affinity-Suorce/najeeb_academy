import 'package:najeeb_academy/features/auth/models/student.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserInfoRepository {
  final SharedPreferences _preferences;

  const UserInfoRepository(this._preferences);

  static const _tokenKey = 'token-key';
  static const _studentKey = 'student-info-key';

  Future<bool> setToken(String? token) => token == null
      ? _preferences.remove(_tokenKey)
      : _preferences.setString(_tokenKey, token);

  Future<bool> setStudent(Student? student) => student == null
      ? _preferences.remove(_studentKey)
      : _preferences.setString(_studentKey, student.toJson());

  Future<bool> storeFromApi(dynamic data) async {
    final token = data['data']['token'];

    final user = data['data']['user'];
    final student = Student(
      id: user['id'].toString(),
      name: user['name'],
      username: user['username'],
      token: token,
      imageUrl: user['photo'],
    );
    return (await Future.wait<bool>([setToken(token), setStudent(student)]))
        .every((success) => success);
  }

  String? get token => _preferences.getString(_tokenKey);
  Student? get student {
    final json = _preferences.getString(_studentKey);
    if (json == null) return null;
    return Student.fromJson(json);
  }

  bool get isAuthenticated => token != null;
  bool get isUnAuthenticated => token == null;
}
