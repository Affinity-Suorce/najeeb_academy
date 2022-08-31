import 'package:flutter/cupertino.dart';
import 'package:najeeb_academy/app/di.dart';
import 'package:najeeb_academy/app/router/app_router.dart';
import 'package:najeeb_academy/main_page.dart';

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
      // DI.router.push(const MainRoute());
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
