import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:najeeb_academy/core/helpers/funcs.dart';
import 'package:najeeb_academy/features/video_player/presentation/video_player_page.dart';
import 'package:najeeb_academy/features/video_player/presentation/widgets/video_widget.dart';
import 'package:video_player/video_player.dart';

class VideoPageBottomSection extends StatefulWidget {
  VideoPageBottomSection(
      {Key? key,
      required this.subject,
      required this.states,
      this.changeVideo,
      required this.controller})
      : super(key: key);
  final String subject;
  final List<bool> states;
  final VideoPlayerController controller;
  Function(int index)? changeVideo;

  @override
  State<VideoPageBottomSection> createState() => _BottomSectionState();
}

class _BottomSectionState extends State<VideoPageBottomSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 24, 16, 26),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(
                  CupertinoIcons.arrow_left,
                  size: 30,
                  color: Colors.black,
                ),
              ),
              Spacer(),
              Text(
                widget.subject,
                style: TextStyle(
                  height: 1.4,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                ),
                textDirection: TextDirection.rtl,
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "24 درس",
            style: TextStyle(
              height: 1.4,
              color: Colors.black54,
              fontSize: 20,
            ),
            textDirection: TextDirection.rtl,
          ),
          SizedBox(height: 8),
          ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    // setState(() {
                    widget.changeVideo!(index);
                    // });
                  },
                  child: VideoWidget(
                    isSelected: widget.states[index],
                    index: index + 1,
                    length: index * 1.1,
                    title: 'التكامل',
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 22,
                );
              },
              itemCount: 10)
        ],
      ),
    );
  }
}
