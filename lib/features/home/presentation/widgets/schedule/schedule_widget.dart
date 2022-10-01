import 'dart:math';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class ScheduleViewCalendar extends StatefulWidget {
  const ScheduleViewCalendar({Key? key}) : super(key: key);

  @override
  State<ScheduleViewCalendar> createState() => _ScheduleViewCalendarState();
}

class _ScheduleViewCalendarState extends State<ScheduleViewCalendar> {
  _ScheduleViewCalendarState();

  late _DataSource events;

  @override
  void initState() {
    events = _DataSource(_getAppointments());
    super.initState();
  }

  /// Method that creates the collection the data source for calendar, with
  /// required information.
  List<Appointment> _getAppointments() {
    final List<String> subjectCollection = <String>[];
    subjectCollection.add('رياضيات');
    subjectCollection.add('فيزياء');
    subjectCollection.add('كيمياء');
    subjectCollection.add('علوم');
    subjectCollection.add('رياضيات');
    subjectCollection.add('انكليزي');
    subjectCollection.add('فرنسي');
    subjectCollection.add('عربي');
    subjectCollection.add('فيزياء');

    final List<Color> colorCollection = <Color>[];
    colorCollection.add(const Color(0xFF0F8644));
    colorCollection.add(const Color(0xFF8B1FA9));
    colorCollection.add(const Color(0xFFD20100));
    colorCollection.add(const Color(0xFFFC571D));
    colorCollection.add(const Color(0xFF36B37B));
    colorCollection.add(const Color(0xFF01A1EF));
    colorCollection.add(const Color(0xFF3D4FB5));
    colorCollection.add(const Color(0xFFE47C73));
    colorCollection.add(const Color(0xFF636363));
    colorCollection.add(const Color(0xFF0A8043));

    final Random random = Random();
    final DateTime rangeStartDate =
        DateTime.now().add(const Duration(days: -(365 ~/ 2)));

    final DateTime rangeEndDate = DateTime.now().add(const Duration(days: 365));

    final List<Appointment> appointments = <Appointment>[];

    for (DateTime i = rangeStartDate;
        i.isBefore(rangeEndDate);
        i = i.add(Duration(days: random.nextInt(10)))) {
      final DateTime date = i;
      final int count = 1 + random.nextInt(3);
      for (int j = 0; j < count; j++) {
        final DateTime startDate =
            DateTime(date.year, date.month, date.day, 8 + random.nextInt(8));
        appointments.add(Appointment(
          subject: subjectCollection[random.nextInt(7)],
          startTime: startDate,
          endTime: startDate.add(Duration(hours: random.nextInt(3))),
          color: colorCollection[random.nextInt(9)],
        ));
      }
    }

    DateTime date = DateTime.now();
    date = DateTime(date.year, date.month, date.day, 11);
    return appointments;
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(
            colorScheme: ColorScheme.fromSwatch(backgroundColor: Colors.white)),
        child: Container(
            color: Colors.white,
            child: getScheduleViewCalendar(
                events: events, scheduleViewBuilder: scheduleViewBuilder)));
  }

  /// returns the calendar widget based on the properties passed
  SfCalendar getScheduleViewCalendar(
      {_DataSource? events, dynamic scheduleViewBuilder}) {
    return SfCalendar(
      showDatePickerButton: true,
      scheduleViewMonthHeaderBuilder: scheduleViewBuilder,
      view: CalendarView.schedule,
      dataSource: events,
    );
  }
}

/// An object to set the appointment collection data source to collection, and
/// allows to add, remove or reset the appointment collection.
class _DataSource extends CalendarDataSource {
  _DataSource(List<Appointment> source) {
    appointments = source;
  }
}

/// Returns the month name based on the month value passed from date.
String _getMonthDate(int month) {
  if (month == 01) {
    return 'January';
  } else if (month == 02) {
    return 'February';
  } else if (month == 03) {
    return 'March';
  } else if (month == 04) {
    return 'April';
  } else if (month == 05) {
    return 'May';
  } else if (month == 06) {
    return 'June';
  } else if (month == 07) {
    return 'July';
  } else if (month == 08) {
    return 'August';
  } else if (month == 09) {
    return 'September';
  } else if (month == 10) {
    return 'October';
  } else if (month == 11) {
    return 'November';
  } else {
    return 'December';
  }
}

/// Returns the builder for schedule view.
Widget scheduleViewBuilder(
    BuildContext buildContext, ScheduleViewMonthHeaderDetails details) {
  final String monthName = _getMonthDate(details.date.month);
  return Stack(
    children: <Widget>[
      Image(
          image: ExactAssetImage('assets/images/calendar/$monthName.png'),
          fit: BoxFit.cover,
          width: details.bounds.width,
          height: details.bounds.height),
      Positioned(
        left: 55,
        right: 0,
        top: 20,
        bottom: 0,
        child: Text(
          '$monthName ${details.date.year}',
          style: const TextStyle(fontSize: 18),
        ),
      )
    ],
  );
}
