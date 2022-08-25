import 'package:flutter/material.dart';
import 'package:najeeb_academy/features/auth/ui/register/widgets/register_form_step.dart';
import 'package:najeeb_academy/features/auth/ui/widgets/password_form_field.dart';

class RegisterPasswordStep extends StatefulWidget {
  const RegisterPasswordStep({
    super.key,
    this.onLastFieldSubmitted,
  });
  final ValueChanged<String>? onLastFieldSubmitted;

  @override
  State<RegisterPasswordStep> createState() => _RegisterPasswordStepState();
}

class _RegisterPasswordStepState extends State<RegisterPasswordStep>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return RegisterFormStep(
      child: Column(
        children: [
          const Spacer(),
          const PasswordFormField(
            decoration: InputDecoration(
              hintText: 'كلمة مرور الحساب',
            ),
            autofocus: true,
          ),
          const SizedBox(height: 16),
          PasswordFormField(
            decoration: const InputDecoration(
              hintText: 'أعد كلمة المرور',
            ),
            textInputAction: TextInputAction.go,
            onFieldSubmitted: widget.onLastFieldSubmitted,
          ),
          const Spacer(),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
