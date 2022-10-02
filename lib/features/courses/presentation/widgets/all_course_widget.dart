import 'package:flutter/material.dart';
import 'package:najeeb_academy/features/courses/data/models/course_model.dart';

class CourseWidget extends StatelessWidget {
  const CourseWidget({Key? key, required this.subject}) : super(key: key);
  final Subject subject;
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
                    subject.name ?? '',
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
                        "عدد المواد: ${subject.lectures!.length}",
                        style: const TextStyle(
                          height: 1,
                          color: Colors.black87,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'السعر: ${subject.cost}',
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
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/logo.png'),
                        fit: BoxFit.contain)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
