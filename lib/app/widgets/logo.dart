import 'package:flutter/material.dart';

import '../constants/assets.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Assets.images.logo,
      fit: BoxFit.contain,
    );
  }
}
