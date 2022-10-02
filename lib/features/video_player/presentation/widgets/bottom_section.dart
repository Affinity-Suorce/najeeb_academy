import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:najeeb_academy/features/courses/data/models/course_model.dart';
import 'package:najeeb_academy/features/lectures/models/lecture.dart';
import 'package:najeeb_academy/features/video_player/presentation/widgets/video_widget.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPageBottomSection extends StatefulWidget {
  VideoPageBottomSection(
      {Key? key,
      required this.subject,
      required this.lecture,
      required this.lectureIndex,
      this.changeVideo,
      required this.controller})
      : super(key: key);
  final Subject subject;
  final Lecture lecture;
  final int lectureIndex;
  final YoutubePlayerController controller;
  Function(int index)? changeVideo;

  @override
  State<VideoPageBottomSection> createState() => _BottomSectionState();
}

class _BottomSectionState extends State<VideoPageBottomSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints:
          BoxConstraints(minHeight: MediaQuery.of(context).size.height * 0.7),
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 26),
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                widget.subject.name ?? '',
                style: const TextStyle(
                  height: 1.4,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                ),
                textDirection: TextDirection.rtl,
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(
                  CupertinoIcons.arrow_left,
                  size: 30,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            widget.subject.lectures!.length.toString(),
            style: const TextStyle(
              height: 1.4,
              color: Colors.black54,
              fontSize: 20,
            ),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 8),
          ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      widget.changeVideo!(index);
                    });
                  },
                  child: VideoWidget(
                    isSelected: widget.lectureIndex == index,
                    index: index + 1,
                    title: widget.subject.lectures![index].name ?? '',
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 22,
                );
              },
              itemCount: widget.subject.lectures!.length)
        ],
      ),
    );
  }
}
