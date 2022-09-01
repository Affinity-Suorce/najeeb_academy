import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class LoginFormService extends ChangeNotifier {
  LoginFormService();
  final formKey = GlobalKey<FormBuilderState>();

  Future<void> login() async {
    final formState = formKey.currentState;
    if (formState != null && formState.validate()) {
      final username = formState.fields['username']!.value;
      final password = formState.fields['password']!.value;
      print('username: $username\npassword: $password');
    }
  }
}
