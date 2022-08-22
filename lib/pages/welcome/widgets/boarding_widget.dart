import 'package:flutter/material.dart';

class BoardingWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  const BoardingWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Image.asset(
          imagePath,
          width: 260,
          height: 260,
        ),
        const SizedBox(height: 16),
        Text(
          title,
          style: theme.textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Text(
          subtitle,
          style: theme.textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
