import 'package:flutter/material.dart';
import 'package:najeeb_academy/app/widgets/numeric_keyboard.dart';
import 'package:najeeb_academy/features/auth/ui/register/widgets/register_form_step.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

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
      child: Column(
        children: [
          const Spacer(),
          const Text('تم إرسال رمز التفعيل إلى 0987654321'),
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
                autoFocus: true,
                autoDismissKeyboard: true,
                appContext: context,
                length: widget.verifyCodeLength,
                readOnly: true,
                onChanged: (_) {},
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
