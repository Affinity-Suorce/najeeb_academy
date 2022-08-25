import 'package:flutter/material.dart';
import 'package:najeeb_academy/features/auth/ui/widgets/auth_app_bar.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AuthAppBar('تسجيل الدخول'),
    );
  }
}
