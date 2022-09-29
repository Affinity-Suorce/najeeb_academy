import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IsInstallmentField extends StatefulWidget {
  const IsInstallmentField({Key? key}) : super(key: key);

  @override
  State<IsInstallmentField> createState() => _IsInstallmentFieldState();
}

class _IsInstallmentFieldState extends State<IsInstallmentField> {
  int currentValue = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return FormBuilderChoiceChip<int>(
      name: 'is_installment',
      options: [
        FormBuilderChipOption(
          value: 0,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 24.w),
            child: Text(
              'تقسيط',
              style: TextStyle(
                  color:
                      currentValue == 0 ? theme.colorScheme.onPrimary : null),
            ),
          ),
        ),
        FormBuilderChipOption(
          value: 1,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 24.w),
            child: Text(
              'دفعة واحدة',
              style: TextStyle(
                  color:
                      currentValue == 1 ? theme.colorScheme.onPrimary : null),
            ),
          ),
        ),
      ],
      initialValue: currentValue,
      onChanged: (value) {
        setState(() {
          currentValue = value as int;
        });
      },
      alignment: WrapAlignment.spaceBetween,
      elevation: 5,
      selectedColor: theme.colorScheme.primary,
      decoration: const InputDecoration(filled: false),
    );
  }
}
