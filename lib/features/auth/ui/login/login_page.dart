import 'package:flutter/material.dart';
import 'package:najeeb_academy/features/auth/ui/widgets/auth_app_bar.dart';
import 'package:najeeb_academy/features/auth/ui/widgets/password_form_field.dart';
import 'package:najeeb_academy/features/auth/ui/widgets/syrian_mobile_form_field.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AuthAppBar('تسجيل الدخول'),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Spacer(),
                    const SyrianMobileFormField(
                      decoration: InputDecoration(hintText: 'رقم الجوال'),
                    ),
                    const SizedBox(height: 16),
                    const PasswordFormField(
                      decoration: InputDecoration(hintText: 'كلمة المرور'),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: _login,
                      child: const Text('تسجيل الدخول'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _login() async {
    if (_formKey.currentState?.validate() ?? false) {}
  }
}
