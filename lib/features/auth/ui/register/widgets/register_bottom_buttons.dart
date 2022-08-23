import 'package:flutter/material.dart';
import 'package:najeeb_academy/app/widgets/secondary_button.dart';

class RegisterBottomButtons extends StatelessWidget {
  final VoidCallback nextPage;
  final VoidCallback prevPage;
  final bool isLastPage;
  final VoidCallback register;
  const RegisterBottomButtons({
    super.key,
    required this.nextPage,
    required this.prevPage,
    required this.isLastPage,
    required this.register,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0,
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
        child: Row(
          children: [
            Expanded(
              child: SecondaryButton(
                onPressed: prevPage,
                child: const Text('رجوع'),
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  if (isLastPage) {
                    return register();
                  }
                  nextPage();
                },
                child: Text(isLastPage ? 'إنشاء الحساب' : 'التالي'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
