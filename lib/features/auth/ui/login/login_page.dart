import 'package:flutter/material.dart';
import 'package:najeeb_academy/app/constants/assets.dart';
import 'package:najeeb_academy/features/auth/services/login_form_services.dart';
import 'package:najeeb_academy/features/auth/ui/widgets/auth_app_bar.dart';
import 'package:najeeb_academy/features/auth/ui/widgets/password_form_field.dart';
import 'package:najeeb_academy/features/auth/ui/widgets/syrian_mobile_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final LoginFormService service;

  @override
  void initState() {
    super.initState();
    service = LoginFormService();
  }

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
                key: service.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(child: Image.asset(Assets.images.loginImage)),
                    const Spacer(),
                    SyrianMobileFormField(
                      autofocus: true,
                      decoration: const InputDecoration(hintText: 'رقم الجوال'),
                      onSaved: service.saveMobile,
                    ),
                    const SizedBox(height: 16),
                    PasswordFormField(
                      decoration:
                          const InputDecoration(hintText: 'كلمة المرور'),
                      onSaved: service.savePassword,
                      textInputAction: TextInputAction.go,
                      onFieldSubmitted: (_) => service.login(),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: service.login,
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

  @override
  void dispose() {
    service.dispose();
    super.dispose();
  }
}
