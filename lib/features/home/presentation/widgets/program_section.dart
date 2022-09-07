import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ProgramSection extends StatelessWidget {
  const ProgramSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0,
      child: Container(
        padding: const EdgeInsets.only(right: 8, bottom: 36, top: 12),
        width: MediaQuery.of(context).size.width * 0.9,
        // height: 230,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "برنامج الإسبوع",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 2,
            ),
            ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return programSectionWidget();
                },
                separatorBuilder: (context, index) {
                  return Container(
                    height: 2,
                  );
                },
                itemCount: 2)
          ],
        ),
      ),
    );
  }

  Widget programSectionWidget(
      {String subject = "الرياضيات",
      int done = 0,
      int from = 40,
      double progress = 0.0}) {
    return Padding(
      padding: const EdgeInsets.only(right: 34, left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircularPercentIndicator(
            radius: 17.0,
            lineWidth: 2.5,
            percent: progress,
            center: const Text(""),
            progressColor: Colors.green,
          ),
          const SizedBox(
            width: 12,
          ),
          Text(
            subject,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          const Spacer(),
          Text(
            "$from/",
            style: const TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700),
          ),
          Text(
            "$done",
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
