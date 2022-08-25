import 'package:flutter/material.dart';

class PasswordFormField extends StatefulWidget {
  const PasswordFormField({
    super.key,
    this.decoration,
    this.textInputAction = TextInputAction.next,
    this.autofocus = false,
    this.onFieldSubmitted,
  });
  final InputDecoration? decoration;
  final TextInputAction textInputAction;
  final bool autofocus;
  final ValueChanged<String>? onFieldSubmitted;

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      decoration:
          widget.decoration?.copyWith(prefixIcon: toggleVisibilityButton) ??
              InputDecoration(
                prefixIcon: toggleVisibilityButton,
              ),
      autofocus: widget.autofocus,
      textInputAction: widget.textInputAction,
      onFieldSubmitted: widget.onFieldSubmitted,
      keyboardType: TextInputType.visiblePassword,
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
