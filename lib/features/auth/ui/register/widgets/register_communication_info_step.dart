import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:najeeb_academy/features/auth/services/register_form_service.dart';
import 'package:najeeb_academy/features/auth/ui/register/widgets/register_form_step.dart';
import 'package:najeeb_academy/features/auth/ui/widgets/syrian_mobile_form_field.dart';
import 'package:provider/provider.dart';

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
      formKey: context.read<RegisterFormService>().formsKeys[2],
      child: Column(
        children: [
          const Spacer(),
          SyrianMobileFormField(
            decoration: const InputDecoration(
              hintText: 'الجوال',
            ),
            autofocus: true,
            onChanged: (input) {
              context.read<RegisterFormService>().mobile = input.trim();
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'الهاتف الثابت',
            ),
            onSaved: (input) {
              context.read<RegisterFormService>().landline = input?.trim();
            },
            keyboardType: TextInputType.phone,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 16),
          SyrianMobileFormField(
            decoration: const InputDecoration(
              hintText: 'جوال ولي الأمر',
            ),
            onSaved: (input) {
              context.read<RegisterFormService>().parentMobile = input?.trim();
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
