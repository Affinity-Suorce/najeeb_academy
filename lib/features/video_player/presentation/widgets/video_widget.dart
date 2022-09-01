import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:najeeb_academy/app/constants/colors.dart';
import 'package:najeeb_academy/core/helpers/funcs.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget(
      {Key? key,
      this.index = 01,
      this.isSelected = false,
      this.title = '',
      this.length = 1.5})
      : super(key: key);
  final int index;
  final String title;
  final bool isSelected;
  final double length;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            width: 34,
          ),
          Container(
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
          Spacer(),
          Column(
            children: [
              Text(
                title,
                style: TextStyle(
                  height: 1.4,
                  color: Colors.black54,
                  fontSize: 24,
                ),
                textDirection: TextDirection.rtl,
              ),
              Spacer(),
              Text(
                "${length.toStringAsFixed(2)}h",
                style: TextStyle(
                  height: 1.4,
                  color: AppColors.indigo,
                  fontSize: 20,
                ),
                textDirection: TextDirection.rtl,
              ),
            ],
          ),
          SizedBox(
            width: 34,
          ),
          Text(
            indexFunction(index),
            style: TextStyle(color: Colors.grey.shade300, fontSize: 36),
          ),
        ],
      ),
    );
  }
}
