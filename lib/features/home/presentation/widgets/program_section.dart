import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:najeeb_academy/features/home/presentation/widgets/schedule/calendar.dart';
import 'package:najeeb_academy/features/home/services/schedule_service.dart';
import 'package:najeeb_academy/features/lectures/models/event.dart';
import 'package:provider/provider.dart';

class ProgramSection extends StatefulWidget {
  const ProgramSection({Key? key}) : super(key: key);

  @override
  State<ProgramSection> createState() => _ProgramSectionState();
}

class _ProgramSectionState extends State<ProgramSection> {
  EventModel? events;
  @override
  void initState() {
    super.initState();
    events = context.read<ScheduleService>().events;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0,
      child: InkWell(
        onTap: () {
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => Scaffold(
                body: Directionality(
                  textDirection: TextDirection.ltr,
                  child: Calendar(events: events!),
                ),
              ),
            ),
          );
        },
        child: Container(
          // padding: const EdgeInsets.only(right: 8, bottom: 36, top: 12),
          padding: const EdgeInsets.all(18),
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(13)),
              boxShadow: [
                BoxShadow(
                    color: Color(0x669e9e9e),
                    spreadRadius: 1,
                    blurRadius: 6,
                    offset: Offset(6, 6))
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(
                "برنامج الاسبوع",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w700),
              ),
              // const SizedBox(
              //   height: 2,
              // ),
              // ListView.separated(
              //     physics: const NeverScrollableScrollPhysics(),
              //     shrinkWrap: true,
              //     scrollDirection: Axis.vertical,
              //     itemBuilder: (context, index) {
              //       return programSectionWidget(events!.getAllInfo()[index]);
              //     },
              //     separatorBuilder: (context, index) {
              //       return Container(
              //         height: 2,
              //       );
              //     },
              //     itemCount: events!.getAllInfo().length)
            ],
          ),
        ),
      ),
    );
  }

  Widget programSectionWidget(String event) {
    return Padding(
      padding: const EdgeInsets.only(right: 34, left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // CircularPercentIndicator(
          //   radius: 17.0,
          //   lineWidth: 2.5,
          //   percent: progress,
          //   center: const Text(""),
          //   progressColor: Colors.green,
          // ),
          Container(
            height: 6,
            width: 15,
            decoration: BoxDecoration(
                color: Colors.black87, borderRadius: BorderRadius.circular(25)),
          ),
          const SizedBox(
            width: 12,
          ),
          Text(
            event.split('/')[1],
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          const Spacer(),
          Text(
            event.split('/')[0],
            style: const TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
