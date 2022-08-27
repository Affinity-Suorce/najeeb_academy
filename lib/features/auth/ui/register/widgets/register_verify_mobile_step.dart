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
          RichText(
            text: TextSpan(
              children: [
                const TextSpan(text: 'تم إرسال رمز التفعيل إلى الرقم '),
                TextSpan(
                  text: context.read<RegisterFormService>().mobile,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
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
                  activeFillColor: theme.inputDecorationTheme.fillColor,
                  borderWidth:
                      theme.inputDecorationTheme.border?.borderSide.width,
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
                errorTextDirection: TextDirection.rtl,
                errorTextSpace: 24,
                validator: (input) {
                  if (input == null ||
                      input.trim().length < widget.verifyCodeLength) {
                    return 'الرجاء إدخال رمز التحقق';
                  }
                  return null;
                },
                onChanged: (_) {},
                onSaved: (input) {
                  context.read<RegisterFormService>().verifyMobileCode =
                      input?.trim();
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
    // _controller.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}
