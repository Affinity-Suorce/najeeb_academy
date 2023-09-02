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

  int numberOfLine = 0;

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);
    for(var element in widget.events!.props){
      if(element is List<String>){
        if(element.length > numberOfLine){
          numberOfLine = element.length;
        }
      }
    }
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
            const VHLine(),
              DataWidget(events: widget.events,numberOfLine: numberOfLine,),
            ],
          ),
        )),
    );
  }
}

class VHLine extends StatelessWidget {
  const VHLine({super.key});


  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
      HorizontalLines()
    ],);
  }
}


class DataWidget extends StatelessWidget {
  const DataWidget({Key? key, required this.events,required this.numberOfLine}) : super(key: key);
  final EventModel? events;
  final int numberOfLine;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: List.generate(7, (index) {
            final List<String> finalList = getList(index, events!);
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
                physics:const AlwaysScrollableScrollPhysics(),
            child:SizedBox(
                height: MediaQuery.of(context).size.height * heightRadius,
                child: Stack(
              children: [
                VerticalLines(numberOfLine: numberOfLine,),
                DataRow(
              dataList: finalList,
            )
              ])));
          })),
    );
  }

  List<String> getList(int index, EventModel events) {
    switch (index) {
      case 0:
        return [...getSubjectList(events.sunday), 'الأحد'];
      case 1:
        return [...getSubjectList(events.monday), 'الإثنين'];
      case 2:
        return [...getSubjectList(events.tuesday), 'الثلاثاء'];
      case 3:
        return [...getSubjectList(events.wednesday), 'الأربعاء'];
      case 4:
        return [...getSubjectList(events.thursday), 'الخميس'];
      case 5:
        return [...getSubjectList(events.friday), 'الجمعة'];
      case 6:
        return [...getSubjectList(events.saturday), 'السبت'];
    }
    return [];
  }

  List<String> getSubjectList(List<String> list) {
    List<String> tempList = [];
     for (int i = list.length - 1; i >= 0;i--) {
      tempList.add(list[i].split('/')[0]);
    }
    // for (String element in list) {
    //   tempList.add(element.split('/')[0]);
    // }
    return tempList;
  }
}

class DataRow extends StatelessWidget {
  const DataRow({Key? key, required this.dataList}) : super(key: key);
  final List<String> dataList;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
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
  const VerticalLines({Key? key,required this.numberOfLine}) : super(key: key);

  final int numberOfLine;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child:Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children:List.generate(numberOfLine + 2, (index) => Row(
            children: [
              spacingSizedBox(context),
            const Line(isVertical: true)
            ]
          )),
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
      height: isVertical ? MediaQuery.of(context).size.height * heightRadius : 1,
      width: isVertical ? 1 : double.infinity,
    );
  }
}
