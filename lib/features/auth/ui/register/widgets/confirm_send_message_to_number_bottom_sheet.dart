import 'package:flutter/material.dart';
import 'package:najeeb_academy/app/widgets/confirm_bottom_sheet.dart';

class ConfirmSendMessageToNumberBottomSheet extends StatelessWidget {
  final String number;
  const ConfirmSendMessageToNumberBottomSheet(
      {super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ConfirmBottomSheet.confirm(
      primaryButtonLabel: 'حسناً',
      child: RichText(
        text: TextSpan(
          style: theme.textTheme.bodyLarge,
          children: [
            const TextSpan(
              text: 'سيتم إرسال رمز التحقق إلى الرقم: ',
              style: TextStyle(
                fontWeight: FontWeight.normal,
              ),
            ),
            TextSpan(text: number),
          ],
        ),
      ),
    );
  }
}
