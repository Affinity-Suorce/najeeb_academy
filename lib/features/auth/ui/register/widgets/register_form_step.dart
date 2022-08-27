import 'package:flutter/material.dart';

class RegisterFormStep extends StatelessWidget {
  final Widget child;
  final GlobalKey<FormState>? formKey;
  const RegisterFormStep({
    super.key,
    this.formKey,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverFillRemaining(
            child: formKey == null
                ? child
                : Form(
                    key: formKey,
                    child: child,
                  ),
          ),
        ),
      ],
    );
  }
}
