import 'package:flutter/material.dart';
import 'package:najeeb_academy/app/constants/assets.dart';
import 'package:najeeb_academy/app/constants/colors.dart';
import 'package:najeeb_academy/app/extensions/snack_bar_build_context.dart';
import 'package:najeeb_academy/features/auth/services/register_form_service.dart';
import 'package:najeeb_academy/features/auth/ui/register/widgets/register_form_step.dart';
import 'package:provider/provider.dart';

class RegisterClassStep extends StatefulWidget {
  const RegisterClassStep({super.key});

  @override
  State<RegisterClassStep> createState() => _RegisterClassStepState();
}

class _RegisterClassStepState extends State<RegisterClassStep>
    with AutomaticKeepAliveClientMixin {
  int? selectedClass;
  bool get showErrorMessage {
    final currentClass = selectedClass;
    return currentClass == null || currentClass > 1 || currentClass < 0;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return RegisterFormStep(
      formKey: context.read<RegisterFormService>().formsKeys[0],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox.shrink(
            child: TextFormField(
              readOnly: true,
              validator: (_) {
                if (showErrorMessage) {
                  context.showFailSnackBar('الرجاء اختيار الصف');
                  return '';
                }
                return null;
              },
            ),
          ),
          const Spacer(),
          Expanded(
            flex: 3,
            child: _ClassItem(
              text: 'بكالوريا',
              imagePath: Assets.images.highSchool,
              selected: selectedClass == 0,
              onPressed: () {
                setState(() {
                  selectedClass = 0;
                });
              },
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            flex: 3,
            child: _ClassItem(
              text: 'تاسع',
              imagePath: Assets.images.middleSchool,
              selected: selectedClass == 1,
              onPressed: () {
                setState(() {
                  selectedClass = 1;
                });
              },
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

class _ClassItem extends StatelessWidget {
  final String text;
  final String imagePath;
  final bool selected;
  final VoidCallback? onPressed;
  const _ClassItem({
    required this.text,
    required this.imagePath,
    required this.selected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final background = selected ? Colors.green : null;
    final foreground = selected ? AppColors.white : null;
    final imageColor = selected ? null : const Color(0x44000000);
    return Card(
      child: InkWell(
        onTap: onPressed,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Image.asset(
                imagePath,
                fit: BoxFit.fitWidth,
                color: imageColor,
                colorBlendMode: BlendMode.darken,
              ),
            ),
            Container(
              color: background,
              child: Text(
                text,
                style: theme.textTheme.titleLarge?.copyWith(
                  color: foreground,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
