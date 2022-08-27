import 'package:flutter/material.dart';
import 'package:najeeb_academy/app/widgets/secondary_button.dart';
import 'package:najeeb_academy/features/auth/services/register_form_service.dart';
import 'package:provider/provider.dart';

class RegisterBottomButtons extends StatelessWidget {
  const RegisterBottomButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final service = context.read<RegisterFormService>();
    final watchService = context.watch<RegisterFormService>();
    return BottomAppBar(
      elevation: 0,
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
        child: Row(
          children: [
            Expanded(
              child: SecondaryButton(
                onPressed: watchService.currentPageIndex == 0
                    ? null
                    : service.prevPage,
                child: const Text('رجوع'),
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  if (watchService.isLastPage) {
                    service.register();
                    return;
                  }
                  service.nextPage(context);
                },
                child:
                    Text(watchService.isLastPage ? 'إنشاء الحساب' : 'التالي'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
