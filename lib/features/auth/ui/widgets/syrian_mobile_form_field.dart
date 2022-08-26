import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SyrianMobileFormField extends StatelessWidget {
  const SyrianMobileFormField({
    super.key,
    this.decoration,
    this.textInputAction = TextInputAction.next,
    this.autofocus = false,
    this.onFieldSubmitted,
    this.required = true,
  });
  final bool required;
  final InputDecoration? decoration;
  final TextInputAction textInputAction;
  final bool autofocus;
  final ValueChanged<String>? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: decoration,
      autofocus: autofocus,
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
      keyboardType: TextInputType.phone,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\+?[0-9]*$')),
      ],
      validator: (input) {
        if (input == null || input.trim().isEmpty) {
          return required ? 'رقم الجوال مطلوب' : null;
        }
        if (!RegExp(r'^((\+|00)?9639|0?9)([3-6]|[8,2])\d{7}$')
            .hasMatch(input)) {
          return 'الرجاء إدخال رقم جوال صالح';
        }
        return null;
      },
    );
  }
}
