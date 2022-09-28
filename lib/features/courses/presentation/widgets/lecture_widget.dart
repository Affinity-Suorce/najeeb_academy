import 'package:flutter/material.dart';
import 'package:najeeb_academy/app/di.dart';
import 'package:najeeb_academy/app/router/app_router.dart';
import 'package:najeeb_academy/core/helpers/funcs.dart';
import 'package:najeeb_academy/features/courses/data/models/course_model.dart';

class SubjectWidget extends StatelessWidget {
  const SubjectWidget({Key? key, required this.subject}) : super(key: key);
  final Subject subject;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: InkWell(
        onTap: () {
          DI.router.push(VideoPlayerRoute(id: subject.name!));
          // pushNewScreen(
          //   context,
          //   screen: VideoPlayerPage(
          //     subject: subject.name!,
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
                    subject.name!,
                    style: const TextStyle(
                      height: 1,
                      color: Colors.black,
                      fontSize: 22,
                    ),
                  ),
                  subtitle: Text(
                    "عدد الدروس: ${subject.lectures.length}",
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
                        image: AssetImage(getSubjectImage(subject.name!)),
                        fit: BoxFit.cover)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
