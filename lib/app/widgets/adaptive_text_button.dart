import 'package:flutter/material.dart';

class AdaptiveTextButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  const AdaptiveTextButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    final isLight = brightness == Brightness.light;
    final theme = Theme.of(context);
    return TextButton(
      onPressed: onPressed,
      style: isLight
          ? null
          : TextButton.styleFrom(primary: theme.colorScheme.onBackground),
      child: child,
    );
  }
}
