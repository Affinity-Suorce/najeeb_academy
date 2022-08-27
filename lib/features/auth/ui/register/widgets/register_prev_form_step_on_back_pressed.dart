import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../services/register_form_service.dart';

class RegisterPrevFormStepOnBackPressed extends StatelessWidget {
  final Widget child;
  const RegisterPrevFormStepOnBackPressed({super.key, required this.child,});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final service = context.read<RegisterFormService>();
        if (service.currentPageIndex > 0) {
          service.prevPage();
          return false;
        }
        return true;
      },
      child: child,
    );
  }
}
