import 'package:flutter/material.dart';

import 'register_form_step.dart';

class RegisterPersonalInfoStep extends StatefulWidget {
  const RegisterPersonalInfoStep({super.key});

  @override
  State<RegisterPersonalInfoStep> createState() =>
      _RegisterPersonalInfoStepState();
}

class _RegisterPersonalInfoStepState extends State<RegisterPersonalInfoStep>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return RegisterFormStep(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'الاسم الأول',
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'اسم الأب',
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'الكنية',
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
