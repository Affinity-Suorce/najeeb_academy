import 'package:flutter/material.dart';

class FixedScaleTextWidget extends StatelessWidget {
  final Widget child;
  const FixedScaleTextWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: child,
    );
  }
}
