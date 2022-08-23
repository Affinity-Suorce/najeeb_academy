import 'package:flutter/material.dart';

class RegisterFormStep extends StatelessWidget {
  final Widget child;
  const RegisterFormStep({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          sliver: SliverFillRemaining(
            child: child,
          ),
        ),
      ],
    );
  }
}
