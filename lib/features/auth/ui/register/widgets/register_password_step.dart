import 'package:flutter/material.dart';
import 'package:najeeb_academy/features/auth/services/register_form_service.dart';
import 'package:najeeb_academy/features/auth/ui/register/widgets/register_form_step.dart';
import 'package:najeeb_academy/features/auth/ui/widgets/password_form_field.dart';
import 'package:provider/provider.dart';

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
  // String _password = '';
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return RegisterFormStep(
      formKey: context.read<RegisterFormService>().formsKeys[3],
      child: Column(
        children: [
          const Spacer(),
          PasswordFormField(
            decoration: const InputDecoration(
              hintText: 'كلمة مرور الحساب',
            ),
            onChanged: (input) {
              context.read<RegisterFormService>().password = input.trim();
            },
            autofocus: true,
          ),
          const SizedBox(height: 16),
          PasswordFormField(
            decoration: const InputDecoration(
              hintText: 'أعد كلمة المرور',
            ),
            validator: (input) {
              if (context.read<RegisterFormService>().password?.trim() !=
                  input.trim()) {
                return 'كملة المرور غير متطابقة';
              }
              return null;
            },
            onSaved: (input) {
              context.read<RegisterFormService>().confirmedPassword =
                  input?.trim();
            },
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
