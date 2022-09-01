import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class PasswordFormField extends StatefulWidget {
  const PasswordFormField({
    super.key,
    this.decoration,
    this.textInputAction = TextInputAction.next,
    this.autofocus = false,
    this.onFieldSubmitted,
    this.onChanged,
    this.controller,
    this.validator,
    this.name = 'password',
  });
  final String name;
  final InputDecoration? decoration;
  final TextInputAction textInputAction;
  final bool autofocus;
  final ValueChanged<String?>? onFieldSubmitted;
  final ValueChanged<String?>? onChanged;
  final TextEditingController? controller;
  final String? Function(String input)? validator;

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: widget.name,
      obscureText: obscureText,
      controller: widget.controller,
      decoration:
          widget.decoration?.copyWith(prefixIcon: toggleVisibilityButton) ??
              InputDecoration(
                prefixIcon: toggleVisibilityButton,
              ),
      autofocus: widget.autofocus,
      textInputAction: widget.textInputAction,
      onSubmitted: widget.onFieldSubmitted,
      keyboardType: TextInputType.visiblePassword,
      onChanged: widget.onChanged,
      validator: (input) {
        if (input == null || input.trim().isEmpty) {
          return 'هذا الحقل مطلوب';
        }
        if (input.trim().length < 6) {
          return 'يجب أن تكون كلمة المرور أطول من 6 محارف';
        }
        final validator = widget.validator;
        if (validator != null) {
          return validator(input);
        }
        return null;
      },
      inputFormatters: [
        FilteringTextInputFormatter.deny(RegExp(r'\s')),
      ],
    );
  }

  Widget get toggleVisibilityButton => ExcludeFocus(
        child: IconButton(
          onPressed: _toggleObscureText,
          icon: Icon(obscureText
              ? Icons.visibility_rounded
              : Icons.visibility_off_rounded),
        ),
      );

  void _toggleObscureText() {
    setState(() {
      obscureText = !obscureText;
    });
  }
}
