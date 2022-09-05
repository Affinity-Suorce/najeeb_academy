import 'package:flutter/material.dart';
import 'package:najeeb_academy/app/constants/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Indicator extends StatelessWidget {
  final PageController controller;
  final int length;
  const Indicator({
    super.key,
    required this.controller,
    required this.length,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SmoothPageIndicator(
      controller: controller,
      effect: ExpandingDotsEffect(
        dotHeight: 5,
        dotWidth: 9,
        dotColor: AppColors.purple200,
        activeDotColor: theme.colorScheme.primary,
      ),
      count: length,
    );
  }
}
