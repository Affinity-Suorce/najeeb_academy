import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najeeb_academy/app/di.dart';
import 'package:najeeb_academy/app/router/app_router.dart';

class RegistrationCompleteDialog extends StatelessWidget {
  const RegistrationCompleteDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(12.r),
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                child: Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 150.r,
                ),
              ),
              12.verticalSpace,
              const Text(
                'تم تقديم طلبك بنجاح!.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'ستصلك رسالة SMS بمعلومات الحساب',
                textAlign: TextAlign.center,
              ),
              12.verticalSpace,
              ElevatedButton(
                onPressed: () {
                  DI.router.replaceAll([const MainRoute()]);
                },
                child: const Text('الصفحة الرئيسية'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
