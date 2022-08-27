import 'package:flutter/cupertino.dart';

class LoginFormService extends ChangeNotifier {
  LoginFormService({
    this.mobile = '',
    this.password = '',
  });
  final formKey = GlobalKey<FormState>();
  String mobile;
  String password;
  Future<void> login() async {
    final formState = formKey.currentState;
    if (formState != null && formState.validate()) {
      formState.save();
      print('mobile: $mobile\npassword: $password');
    }
  }

  void saveMobile(String? mobile) {
    if (mobile == null) return;
    this.mobile = mobile;
    notifyListeners();
  }

  void savePassword(String? password) {
    if (password == null) return;
    this.password = password;
    notifyListeners();
  }
}
