import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:najeeb_academy/app/constants/colors.dart';
import 'package:najeeb_academy/app/extensions/date_time_helper.dart';
import 'package:najeeb_academy/app/widgets/bottom_sheet_container.dart';
import 'package:najeeb_academy/app/widgets/button.dart';

class WheelDatePickerBottomSheet extends StatefulWidget {
  final DateTime initialDate;
  const WheelDatePickerBottomSheet({
    super.key,
    required this.initialDate,
  });

  @override
  State<WheelDatePickerBottomSheet> createState() =>
      _WheelDatePickerBottomSheetState();
}

class _WheelDatePickerBottomSheetState
    extends State<WheelDatePickerBottomSheet> {
  DateTime? currentDate;

  @override
  void initState() {
    super.initState();
    currentDate = widget.initialDate.dateOnly;
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheetContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context, DateTimeHelper.today);
                },
                child: const Text('اليوم'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('إلغاء'),
              ),
            ],
          ),
          SizedBox(
            height: 250,
            child: CupertinoDatePicker(
              initialDateTime: widget.initialDate,
              mode: CupertinoDatePickerMode.date,
              maximumDate: DateTimeHelper.today,
              onDateTimeChanged: (date) {
                setState(() {
                  currentDate = date;
                });
              },
            ),
          ),
          CustomElevatedButton(
            buttonColor: AppColors.indigo,
            title: "اختيار",
            verticalPadding: 6,
            onPressed: () {
              Navigator.pop(context, currentDate);
            },
            horizontalPadding: MediaQuery.of(context).size.width * 0.36,
          )
        ],
      ),
    );
  }
}
