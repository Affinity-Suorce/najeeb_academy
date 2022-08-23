import 'package:flutter/material.dart';
import 'package:najeeb_academy/app/constants/colors.dart';
import 'package:percent_indicator/percent_indicator.dart';

class RegisterHeader extends StatelessWidget {
  final int currentPageIndex;
  final int lastIndex;
  final String title;
  final Widget? nextTitle;
  const RegisterHeader({
    super.key,
    required this.currentPageIndex,
    required this.lastIndex,
    required this.title,
    required this.nextTitle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        const SizedBox(width: 24),
        CircularPercentIndicator(
          percent: currentPageIndex / lastIndex,
          backgroundColor: AppColors.purple100,
          animation: true,
          animationDuration: 250,
          animateFromLastPercent: true,
          circularStrokeCap: CircularStrokeCap.round,
          progressColor: Theme.of(context).colorScheme.primary,
          radius: 32,
          lineWidth: 8,
          center: Text('${currentPageIndex + 1}/${lastIndex + 1}'),
        ),
        Expanded(
          child: ListTile(
            title: Text(
              title,
              style: theme.textTheme.titleLarge,
            ),
            subtitle: nextTitle,
          ),
        ),
      ],
    );
  }
}
