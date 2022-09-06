import 'package:flutter/material.dart';

import '../../courses/models/course.dart';

class CourseWidget extends StatelessWidget {
  const CourseWidget({Key? key, required this.course}) : super(key: key);
  final Course course;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: InkWell(
        onTap: () {
          // pushNewScreen(
          //   context,
          //   screen: VideoPlayerPage(
          //     subject: "الرياضيات",
          //   ),
          //   withNavBar: false, // OPTIONAL VALUE. True by default.
          //   pageTransitionAnimation: PageTransitionAnimation.cupertino,
          // );
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
                    course.title,
                    style: const TextStyle(
                      height: 1,
                      color: Colors.black,
                      fontSize: 22,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "عدد المواد: ${course.lecturesCount}",
                        style: const TextStyle(
                          height: 1,
                          color: Colors.black87,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'السعر: ${course.price}',
                        style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  isThreeLine: true,
                ),
              ),
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(course.imagePath),
                        fit: BoxFit.contain)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
