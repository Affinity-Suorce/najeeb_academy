import 'package:flutter/material.dart';
import 'package:najeeb_academy/app/constants/colors.dart';
import 'package:najeeb_academy/features/auth/services/register_form_service.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class RegisterHeader extends StatelessWidget {
  const RegisterHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final captionTheme = theme.textTheme.caption;
    final service = context.watch<RegisterFormService>();
    return Row(
      children: [
        const SizedBox(width: 24),
        CircularPercentIndicator(
          percent: service.currentPageIndex / service.lastIndex,
          backgroundColor: AppColors.purple100,
          animation: true,
          animationDuration: 250,
          animateFromLastPercent: true,
          circularStrokeCap: CircularStrokeCap.round,
          progressColor: Theme.of(context).colorScheme.primary,
          radius: 32,
          lineWidth: 8,
          center:
              Text('${service.currentPageIndex + 1}/${service.lastIndex + 1}'),
        ),
        Expanded(
          child: ListTile(
            title: Text(
              service.title,
              style: theme.textTheme.titleLarge,
            ),
            subtitle: RichText(
                text: TextSpan(
              style: captionTheme,
              children: [
                WidgetSpan(
                  child: Icon(
                    Icons.forward,
                    size: 12,
                    color: captionTheme?.color,
                  ),
                ),
                TextSpan(
                  text: ' ${service.nextTitle}',
                )
              ],
            )),
          ),
        ),
      ],
    );
  }
}
