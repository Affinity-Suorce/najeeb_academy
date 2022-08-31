import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {Key? key,
      this.isObscur,
      this.onFieldSubmit,
      this.onSaved,
      this.suffix,
      this.prefix,
      this.textInputAction = TextInputAction.done,
      required this.validator,
      this.fillColor = Colors.white,
      this.textColor = Colors.black,
      this.controller,
      this.fontSize = 14,
      this.padding,
      this.hintText = '',
      this.textDirection = TextDirection.ltr})
      : super(key: key);
  final void Function(String?)? onSaved;
  final String? Function(String?) validator;
  final void Function(String?)? onFieldSubmit;
  final TextInputAction textInputAction;
  final bool? isObscur;
  final TextEditingController? controller;
  final Widget? suffix;
  final Widget? prefix;
  final Color fillColor;
  final Color textColor;
  final double fontSize;
  final padding;
  final String hintText;
  final TextDirection textDirection;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(14.0)),
              borderSide: BorderSide.none),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(14.0)),
              borderSide: BorderSide.none),
          disabledBorder: InputBorder.none,
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(14.0)),
              borderSide: BorderSide(
                color: Colors.red,
              )),
          hintText: hintText,
          contentPadding:
              padding ?? EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          filled: true,
          prefixIcon: prefix,
          fillColor: fillColor,
          suffixIcon: suffix,hintTextDirection: TextDirection.rtl,
          hintStyle: TextStyle(color: textColor,)
          // prefix: prefix,
          ),
      obscuringCharacter: '*',
      style: TextStyle(
          letterSpacing: (isObscur != null && isObscur!) ? 3 : 0,
          color: textColor,
          fontSize: fontSize),
      textDirection: textDirection,
      obscureText: isObscur ?? false,
      keyboardType: TextInputType.emailAddress,
      textInputAction: textInputAction,
      validator: validator,
      onSaved: onSaved,
      onFieldSubmitted: onFieldSubmit,
    );
  }
}
