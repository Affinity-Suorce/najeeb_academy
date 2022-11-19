import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:najeeb_academy/features/lectures/models/event.dart';

const widthRadius = 0.196;
const heightRadius = 0.14;

class Calendar extends StatefulWidget {
  const Calendar({Key? key, required this.events}) : super(key: key);
  final EventModel? events;
  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
        return true;
      },
      child: Scaffold(
        body: Container(
          color: Colors.white,
          child: Stack(
            children: [
              const VerticalLines(),
              const HorizontalLines(),
              DataWidget(events: widget.events),
            ],
          ),
        ),
      ),
    );
  }
}

class DataWidget extends StatelessWidget {
  const DataWidget({Key? key, required this.events}) : super(key: key);
  final EventModel? events;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: List.generate(8, (index) {
            final List<String> finalList = getList(index, events!);
            return DataRow(
              dataList: finalList,
            );
          })),
    );
  }

  List<String> getList(int index, EventModel events) {
    switch (index) {
      case 0:
        return [...getSubjectList(events.sunday), 'الأحد'];
      case 1:
        return [...getSubjectList(events.monday), 'الإثنين'];
      case 3:
        return [...getSubjectList(events.tuesday), 'الثلاثاء'];
      case 4:
        return [...getSubjectList(events.wednesday), 'الأربعاء'];
      case 5:
        return [...getSubjectList(events.thursday), 'الخميس'];
      case 6:
        return [...getSubjectList(events.friday), 'الجمعة'];
      case 7:
        return [...getSubjectList(events.saturday), 'السبت'];
    }
    return [];
  }

  List<String> getSubjectList(List<String> list) {
    List<String> tempList = [];
    for (String element in list) {
      tempList.add(element.split('/')[0]);
    }
    return tempList;
  }
}

class DataRow extends StatelessWidget {
  const DataRow({Key? key, required this.dataList}) : super(key: key);
  final List<String> dataList;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0.7),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children:
              List.generate(dataList.length > 5 ? 5 : dataList.length, (index) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * heightRadius,
              width: MediaQuery.of(context).size.width * widthRadius,
              child: Center(
                  child: Text(
                dataList[index],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              )),
            );
          })),
    );
  }
}

class VerticalLines extends StatelessWidget {
  const VerticalLines({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            spacingSizedBox(context),
            const Line(isVertical: true),
            spacingSizedBox(context),
            const Line(isVertical: true),
            spacingSizedBox(context),
            const Line(isVertical: true),
            spacingSizedBox(context),
            const Line(isVertical: true),
            spacingSizedBox(context),
          ],
        ));
  }
}

class HorizontalLines extends StatelessWidget {
  const HorizontalLines({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          spacingSizedBox(context),
          const Line(),
          spacingSizedBox(context),
          const Line(),
          spacingSizedBox(context),
          const Line(),
          spacingSizedBox(context),
          const Line(),
          spacingSizedBox(context),
          const Line(),
          spacingSizedBox(context),
          const Line(),
          spacingSizedBox(context),
        ],
      ),
    );
  }
}

// Widget horizontalSpacing(BuildContext context) => SizedBox(
//       width: MediaQuery.of(context).size.width * 0.18,
//     );
// Widget veticalSpacing(BuildContext context) => SizedBox(
//       height: MediaQuery.of(context).size.height * 0.135,
//     );
SizedBox spacingSizedBox(BuildContext context) => SizedBox(
      height: MediaQuery.of(context).size.height * heightRadius,
      width: MediaQuery.of(context).size.width * widthRadius,
    );

class Line extends StatelessWidget {
  const Line({Key? key, this.isVertical = false}) : super(key: key);
  final bool isVertical;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      height: isVertical ? double.infinity : 1,
      width: isVertical ? 1 : double.infinity,
    );
  }
}
