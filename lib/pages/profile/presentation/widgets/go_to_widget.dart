import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:najeeb_academy/app/constants/colors.dart';

class GoToWidget extends StatelessWidget {
  const GoToWidget({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // pushNewScreen(
        // context,
        // screen: VideoPlayerPage(subject: "الرياضيات",),
        // withNavBar: false, // OPTIONAL VALUE. True by default.
        // pageTransitionAnimation: PageTransitionAnimation.cupertino,
        // );
      },
      child: Container(
        padding: EdgeInsets.only(right: 12, bottom: 13, top: 13, left: 12),
        width: 160,
        height: 80,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(13)),
            boxShadow: [
              BoxShadow(
                  color: Color(0x669e9e9e),
                  spreadRadius: 1,
                  blurRadius: 6,
                  offset: Offset(6, 6))
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(CupertinoIcons.arrow_uturn_left),
            Spacer(),
            Text(
              title,
              style: TextStyle(
                height: 1,
                color: Colors.black,
                fontSize: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
