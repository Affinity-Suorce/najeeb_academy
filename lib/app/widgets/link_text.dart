import 'package:flutter/material.dart';

class LinkText extends StatelessWidget {
  const LinkText(
    this.text, {
    super.key,
    required this.onTap,
  });
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline,
          color: theme.colorScheme.primary,
        ),
      ),
    );
  }
}
