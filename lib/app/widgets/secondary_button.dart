import 'package:flutter/material.dart';
import 'package:najeeb_academy/app/constants/colors.dart';

class SecondaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  const SecondaryButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    if (brightness == Brightness.light) {
      return OutlinedButton(onPressed: onPressed, child: child);
    }
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(primary: AppColors.purple200),
      child: child,
    );
  }
}
