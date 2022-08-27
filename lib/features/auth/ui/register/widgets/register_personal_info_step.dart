import 'package:flutter/material.dart';
import 'package:najeeb_academy/features/auth/services/register_form_service.dart';
import 'package:provider/provider.dart';

import 'register_form_step.dart';

class RegisterPersonalInfoStep extends StatefulWidget {
  const RegisterPersonalInfoStep({
    super.key,
    this.onLastFieldSubmitted,
  });
  final ValueChanged<String>? onLastFieldSubmitted;

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
      formKey: context.read<RegisterFormService>().formsKeys[1],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'الاسم الأول',
            ),
            validator: validator,
            autofocus: true,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'اسم الأب',
            ),
            validator: validator,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'الكنية',
            ),
            validator: validator,
            textInputAction: TextInputAction.go,
            onFieldSubmitted: widget.onLastFieldSubmitted,
          ),
          const Spacer(),
        ],
      ),
    );
  }

  String? validator(String? input) {
    if (input == null || input.trim().isEmpty) return 'هذا الحقل مطلوب';
    if (input.trim().length < 2) return 'أقل طول ممكن هو محرفين';
    return null;
  }

  @override
  bool get wantKeepAlive => true;
}
