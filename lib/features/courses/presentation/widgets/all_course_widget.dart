import 'package:flutter/material.dart';
import 'package:najeeb_academy/app/constants/colors.dart';
import 'package:najeeb_academy/app/di.dart';
import 'package:najeeb_academy/features/courses/data/models/course_model.dart';

class CourseExpandableHeaderWidget extends StatelessWidget {
  const CourseExpandableHeaderWidget({Key? key, required this.course})
      : super(key: key);
  final CourseModel course;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 12, bottom: 17, top: 28, left: 12),
      alignment: Alignment.centerRight,
      child: Text(
        course.name ?? '',
        style: const TextStyle(
          height: 1,
          color: Colors.black,
          fontSize: 22,
        ),
      ),
    );
  }
}

class CourseExpandableBodyWidget extends StatefulWidget {
  const CourseExpandableBodyWidget({
    Key? key,
    required this.course,
  }) : super(key: key);
  final CourseModel course;
  @override
  State<CourseExpandableBodyWidget> createState() =>
      _CourseExpandableBodyWidgetState();
}

class _CourseExpandableBodyWidgetState
    extends State<CourseExpandableBodyWidget> {
  List<bool>? checkBoxesList;
  @override
  void initState() {
    super.initState();
    checkBoxesList =
        List.generate(widget.course.subjects!.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 12, 12),
          child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => Row(
                    children: [
                      Text(
                        "${widget.course.subjects![index].name}: ",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                        ),
                      ),
                      Text(
                        '${widget.course.subjects![index].cost} ل.س',
                        style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const Spacer(),
                      !widget.course.subscribed! ?
                      Checkbox(
                        value: checkBoxesList![index],
                        onChanged: (value) {
                          subjectIdSelection(index, value);
                          coursesIdSelection();
                          
                        },
                        activeColor: Colors.green,
                      ):
                      const Text(
                        'تم الاشتراك',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.normal,
                          fontSize: 12,),)
                    ],
                  ),
              separatorBuilder: (context, index) => const SizedBox(
                    height: 6,
                  ),
              itemCount: widget.course.subjects!.length),
        )
      ],
    );
  }

  void coursesIdSelection() {
    if (checkBoxesList!.every((element) => element == false)) {
      DI.coursesServices.removeCourseId(widget.course.id);
    } else {
      DI.coursesServices.setCoursesids(widget.course.id);
    }
  }

  void subjectIdSelection(int index, bool? value) {
    setState(() {
      checkBoxesList![index] = value!;
    });
    if (!value!) {
      DI.coursesServices.removeSubjectsIds(widget.course.subjects![index].id);
    } else {
      DI.coursesServices.setSubjectsIds(checkBoxesList!.map((e) {
        if (e) return widget.course.subjects![index].id;
      }).toList());
    }
  }
}
// Card(
//       elevation: 5,
//       child: InkWell(
//         onTap: () {
//           // pushNewScreen(
//           //   context,
//           //   screen: VideoPlayerPage(
//           //     subject: "الرياضيات",
//           //   ),
//           //   withNavBar: false, // OPTIONAL VALUE. True by default.
//           //   pageTransitionAnimation: PageTransitionAnimation.cupertino,
//           // );
//         },
//         child: Padding(
//           padding:
//               const EdgeInsets.only(right: 12, bottom: 18, top: 8, left: 12),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               SizedBox(
//                 width: MediaQuery.of(context).size.width * 0.58,
                // child: ListTile(
//                   title: Text(
//                     widget.subject.name ?? '',
//                     style: const TextStyle(
//                       height: 1,
//                       color: Colors.black,
//                       fontSize: 22,
//                     ),
//                   ),
//                   subtitle: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "عدد المواد: ${widget.subject.lectures!.length}",
//                         style: const TextStyle(
//                           height: 1,
//                           color: Colors.black87,
//                           fontSize: 16,
//                         ),
//                       ),
//                       Text(
//                         'السعر: ${widget.subject.cost}',
//                         style: const TextStyle(
//                           color: Colors.green,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                   isThreeLine: true,
//                 ),
//               ),
//               Container(
//                 width: 80,
//                 height: 80,
//                 decoration: const BoxDecoration(
//                     image: DecorationImage(
//                         image: AssetImage('assets/images/logo.png'),
//                         fit: BoxFit.contain)),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );