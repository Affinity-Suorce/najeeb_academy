import 'package:flutter/material.dart';
import 'package:najeeb_academy/app/constants/colors.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DatePickerWidget extends StatefulWidget {
  const DatePickerWidget({required this.availableDates});
  final List<DateTime> availableDates;

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  @override
  Widget build(BuildContext context) {
    DateRangePickerController _dateRangePickerController =
        DateRangePickerController();
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(top: 32),
        child: SfDateRangePicker(
          backgroundColor: Colors.white,
          cancelText: "رجوع",
          confirmText: "إختر يوم",
          selectionMode: DateRangePickerSelectionMode.single,
          selectionColor: AppColors.indigo,
          view: DateRangePickerView.month,
          controller: _dateRangePickerController,
          showActionButtons: true,
          showNavigationArrow: true,
          selectableDayPredicate: (date) {
            if (widget.availableDates
                .any((availableDate) => date == availableDate)) {
              return true;
            }
            return false;
          },
          monthViewSettings: const DateRangePickerMonthViewSettings(),
          monthCellStyle: DateRangePickerMonthCellStyle(
              blackoutDatesDecoration:
                  BoxDecoration(color: Colors.red, shape: BoxShape.circle),
              todayCellDecoration: BoxDecoration(
                  border: Border.all(
                      color: AppColors.indigo, style: BorderStyle.solid),
                  shape: BoxShape.circle)),
          onCancel: () {
            Navigator.pop(context);
          },
          onSubmit: (Object? value) {
            Navigator.pop(context, value);
          },
        ),
      ),
    );
  }
  
}
