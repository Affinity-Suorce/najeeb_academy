import 'package:flutter/material.dart';
import 'package:najeeb_academy/features/auth/services/register_form_service.dart';
import 'package:provider/provider.dart';

import 'register_class_step.dart';
import 'register_communication_info_step.dart';
import 'register_password_step.dart';
import 'register_personal_info_step.dart';
import 'register_verify_mobile_step.dart';

class RegisterFormSteps extends StatelessWidget {
  const RegisterFormSteps({super.key});

  @override
  Widget build(BuildContext context) {
    final service = context.read<RegisterFormService>();
    return PageView(
      controller: service.pageController,
      physics: const NeverScrollableScrollPhysics(),
      onPageChanged: service.onPageChanged,
      children: [
        const RegisterClassStep(),
        RegisterPersonalInfoStep(
          onLastFieldSubmitted: (_) => service.nextPage(context),
        ),
        RegisterCommunicationInfoStep(
          onLastFieldSubmitted: (_) => service.nextPage(context),
        ),
        RegisterPasswordStep(
          onLastFieldSubmitted: (_) => service.nextPage(context),
        ),
        RegisterVerifyMobileStep(
          verifyCodeLength: 4,
          onLastFieldSubmitted: (_) => service.register(),
        ),
      ],
    );
  }
}
