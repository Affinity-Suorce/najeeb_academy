import 'package:flutter/material.dart';
import 'package:najeeb_academy/features/lectures/models/lecture.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../video_player/presentation/video_player_page.dart';

class LectureWidget extends StatelessWidget {
  const LectureWidget({Key? key, required this.lecture}) : super(key: key);
  final Lecture lecture;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: InkWell(
        onTap: () {
          pushNewScreen(
            context,
            screen: VideoPlayerPage(
              subject: lecture.name,
            ),
            withNavBar: false, // OPTIONAL VALUE. True by default.
            pageTransitionAnimation: PageTransitionAnimation.cupertino,
          );
        },
        child: Padding(
          padding:
              const EdgeInsets.only(right: 12, bottom: 18, top: 8, left: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.58,
                child: ListTile(
                  title: Text(
                    lecture.name,
                    style: const TextStyle(
                      height: 1,
                      color: Colors.black,
                      fontSize: 22,
                    ),
                  ),
                  subtitle: Text(
                    "عدد الدروس: ${lecture.classesCount}",
                    style: const TextStyle(
                      height: 1,
                      color: Colors.black87,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(lecture.imagePath),
                        fit: BoxFit.cover)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
