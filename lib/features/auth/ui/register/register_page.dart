import 'package:flutter/material.dart';
import 'package:najeeb_academy/features/auth/services/register_form_service.dart';
import 'package:najeeb_academy/features/auth/ui/register/widgets/register_form_steps.dart';
import 'package:najeeb_academy/features/auth/ui/register/widgets/register_prev_form_step_on_back_pressed.dart';
import 'package:najeeb_academy/features/auth/ui/widgets/auth_app_bar.dart';
import 'package:provider/provider.dart';

import 'widgets/register_bottom_buttons.dart';
import 'widgets/register_header.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RegisterFormService>(
      create: (context) => RegisterFormService(),
      child: Scaffold(
        appBar: const AuthAppBar('إنشاء حساب'),
        body: Column(
          children: const [
            RegisterHeader(),
            Expanded(
              child: RegisterPrevFormStepOnBackPressed(
                child: RegisterFormSteps(),
              ),
            ),
          ],
        ),
        bottomNavigationBar: const RegisterBottomButtons(),
      ),
    );
  }
}
