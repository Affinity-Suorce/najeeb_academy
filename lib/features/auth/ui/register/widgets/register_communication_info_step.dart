import 'package:flutter/material.dart';
import 'package:najeeb_academy/features/auth/ui/register/widgets/register_form_step.dart';
import 'package:najeeb_academy/features/auth/ui/widgets/syrian_mobile_form_field.dart';

class RegisterCommunicationInfoStep extends StatefulWidget {
  const RegisterCommunicationInfoStep({
    super.key,
    this.onLastFieldSubmitted,
  });
  final ValueChanged<String>? onLastFieldSubmitted;

  @override
  State<RegisterCommunicationInfoStep> createState() =>
      _RegisterCommunicationInfoStepState();
}

class _RegisterCommunicationInfoStepState
    extends State<RegisterCommunicationInfoStep>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return RegisterFormStep(
      child: Column(
        children: [
          const Spacer(),
          const SyrianMobileFormField(
            decoration: InputDecoration(
              hintText: 'الجوال',
            ),
            autofocus: true,
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'الهاتف الثابت',
            ),
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 16),
          SyrianMobileFormField(
            decoration: const InputDecoration(
              hintText: 'جوال ولي الأمر',
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
