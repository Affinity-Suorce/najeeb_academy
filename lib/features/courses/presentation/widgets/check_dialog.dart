import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najeeb_academy/app/di.dart';
import 'package:najeeb_academy/app/router/app_router.dart';

class CheckDialog extends StatelessWidget {
  const CheckDialog({Key? key, required this.fullPrice}) : super(key: key);
  final String fullPrice;
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
              Text(
                ' الفاتورة الإجمالية هي:$fullPrice',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              12.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, true);
                      DI.coursesServices.clearFullPrice();
                    },
                    child: const Text('موافق'),
                  ),
                  const SizedBox(
                    width: 22,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, false);
                      DI.coursesServices.clearFullPrice();
                    },
                    child: const Text('إالغاء'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
