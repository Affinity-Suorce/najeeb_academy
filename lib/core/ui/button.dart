import 'package:flutter/material.dart';

typedef OnPressed = void Function();

class CustomElevatedButton extends StatelessWidget {
  final Color buttonColor;
  final Color? splashColor;
  final Color? textColor;
  final Color? iconColor;
  final String? title;
  final IconData? icon;
  final OnPressed? onpressed;
  final double? horizantalPadding;
  final double? verticalPadding;

  const CustomElevatedButton({
    Key? key,
    required this.buttonColor,
    this.splashColor,
    this.textColor,
    this.iconColor,
    this.title,
    this.icon,
    this.onpressed,
    this.horizantalPadding,
    this.verticalPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpressed == null ? () {} : onpressed!,
      child: Text(
        title == null ? 'Button' : title!,
        style: TextStyle(
            color: textColor, fontSize: 20, fontWeight: FontWeight.w500),
      ),
      // style: ElevatedButton.styleFrom(
      //     primary: buttonColor,
      //     fixedSize: Size(50, 54),
      //     side: BorderSide(
      //       color: primaryColor,
      //       width: 1,
      //     ),
      //     shape:
      //         RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
      //     onPrimary: splashColor),
      style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          side: BorderSide(
            // color: primaryColor,
            width: 0,
          ),
          primary: buttonColor,
          padding: EdgeInsets.symmetric(
              horizontal: horizantalPadding ?? 16,
              vertical: verticalPadding ?? 16),
          onPrimary: splashColor),
    );
  }
}
