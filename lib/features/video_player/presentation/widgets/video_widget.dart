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
    return SizedBox(
      height: 65,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            indexFunction(index),
            style: TextStyle(color: Colors.grey.shade300, fontSize: 36),
          ),
          const SizedBox(
            width: 34,
          ),
          Column(
            children: [
              Text(
                title,
                style: const TextStyle(
                  height: 1.4,
                  color: Colors.black54,
                  fontSize: 24,
                ),
                textDirection: TextDirection.rtl,
              ),
              const Spacer(),
              Text(
                "${length.toStringAsFixed(2)}h",
                style: const TextStyle(
                  height: 1.4,
                  color: AppColors.indigo,
                  fontSize: 20,
                ),
                textDirection: TextDirection.rtl,
              ),
            ],
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
      ),
    );
  }
}
