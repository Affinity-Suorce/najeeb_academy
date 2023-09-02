import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:najeeb_academy/app/constants/colors.dart';
import 'package:najeeb_academy/core/helpers/funcs.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget(
      {Key? key,
      this.index = 01,
      this.isSelected = false,
      this.title = '',
      this.date = ''})
      : super(key: key);
  final int index;
  final String title;
  final bool isSelected;
  final String date;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          indexFunction(index),
          style: TextStyle(color: Colors.grey.shade300, fontSize: 36),
        ),
        const SizedBox(
          width: 34,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.varela(
                  height: 1.4,
                  color: Colors.black54,
                  fontSize: 16,
                ),
                textDirection: TextDirection.rtl,
              ),
              Text(
                date,
                style: GoogleFonts.varela(
                  height: 1.4,
                  color: AppColors.indigo,
                  fontSize: 14,
                ),
                textDirection: TextDirection.rtl,
              ),
            ],
          ),
        ),
        const Spacer(),
        SizedBox(
          width: 50,
          height: 50,
          child: Icon(
            isSelected
                ? CupertinoIcons.pause_circle_fill
                : CupertinoIcons.play_circle_fill,
            color: AppColors.indigo,
            size: 60,
          ),
        ),
        const SizedBox(
          width: 34,
        ),
      ],
    );
  }
}
