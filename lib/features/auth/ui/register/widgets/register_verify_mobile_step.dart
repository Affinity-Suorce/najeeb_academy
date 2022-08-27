import 'package:flutter/material.dart';
import 'package:najeeb_academy/app/widgets/numeric_keyboard.dart';
import 'package:najeeb_academy/features/auth/services/register_form_service.dart';
import 'package:najeeb_academy/features/auth/ui/register/widgets/register_form_step.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class RegisterVerifyMobileStep extends StatefulWidget {
  const RegisterVerifyMobileStep({
    super.key,
    required this.verifyCodeLength,
    this.onLastFieldSubmitted,
  });
  final int verifyCodeLength;
  final ValueChanged<String>? onLastFieldSubmitted;

  @override
  State<RegisterVerifyMobileStep> createState() =>
      _RegisterVerifyMobileStepState();
}

class _RegisterVerifyMobileStepState extends State<RegisterVerifyMobileStep>
    with AutomaticKeepAliveClientMixin {
  late final TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final theme = Theme.of(context);
    return RegisterFormStep(
      formKey: context.read<RegisterFormService>().formsKeys[4],
      child: Column(
        children: [
          const Spacer(),
          Text(
              'تم إرسال رمز التفعيل إلى ${context.read<RegisterFormService>().mobile}'),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Theme(
              data: theme.copyWith(
                  inputDecorationTheme:
                      theme.inputDecorationTheme.copyWith(filled: false)),
              child: PinCodeTextField(
                controller: _controller,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  activeColor: theme.colorScheme.primary,
                  inactiveColor: theme.textTheme.caption?.color,
                  borderRadius: BorderRadius.circular(8),
                ),
                autoDismissKeyboard: true,
                appContext: context,
                length: widget.verifyCodeLength,
                autoFocus: true,
                showCursor: true,
                readOnly: true,
                keyboardType: TextInputType.none,
                beforeTextPaste: (input) {
                  if (input == null) return false;
                  final number = int.tryParse(input);
                  return number != null &&
                      number.toString().length == widget.verifyCodeLength;
                },
                validator: (input) {
                  if (input == null || input.trim().isEmpty) {
                    return 'الرجاء إدخال رمز التحقق';
                  }
                  return null;
                },
                onChanged: (input) {
                  context.read<RegisterFormService>().verifyMobileCode =
                      input.trim();
                },
              ),
            ),
          ),
          const Spacer(),
          NumericKeyboard(
            onBackspace: () {
              if (_controller.text.isNotEmpty) {
                _controller.text =
                    _controller.text.substring(0, _controller.text.length - 1);
              }
            },
            onTap: (String text) {
              if (_controller.text.length == widget.verifyCodeLength) return;
              _controller.text += text;
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}
