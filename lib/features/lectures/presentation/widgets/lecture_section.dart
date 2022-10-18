import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najeeb_academy/app/constants/colors.dart';
import 'package:najeeb_academy/app/di.dart';
import 'package:najeeb_academy/app/extensions/bottom_sheet_widget.dart';
import 'package:najeeb_academy/app/extensions/date_time_helper.dart';
import 'package:najeeb_academy/app/extensions/snack_bar_build_context.dart';
import 'package:najeeb_academy/app/router/app_router.dart';
import 'package:najeeb_academy/core/helpers/funcs.dart';
import 'package:najeeb_academy/features/courses/data/models/course_model.dart';
import 'package:najeeb_academy/features/lectures/models/lecture.dart';
import 'package:najeeb_academy/features/lectures/presentation/widgets/wheel_date_picker_bottom_sheet.dart';

class LectureSection extends StatefulWidget {
  const LectureSection({
    Key? key,
    required this.lectures,
    required this.subjects,
  }) : super(key: key);
  final List<Lecture> lectures;
  final List<Subject> subjects;
  @override
  State<LectureSection> createState() => _LectureSectionState();
}

class _LectureSectionState extends State<LectureSection> {
  late DateTime day;

  @override
  void initState() {
    super.initState();
    day = DateTimeHelper.today;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "الدروس ${day.agoDate}",
                    style: const TextStyle(
                      height: 1,
                      color: Colors.black,
                      fontSize: 22,
                    ),
                  ),
                  Text(
                    day.formattedDate,
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              ),
              GestureDetector(
                onTap: () async {
                  final date = await WheelDatePickerBottomSheet(
                    initialDate: day,
                  ).showAsBottomSheet<DateTime>(
                    context,
                    isScrollControlled: true,
                  );
                  if (date != null) {
                    setState(() {
                      day = date;
                    });
                  }
                },
                child: const Text(
                  "اختر يوماً آخر",
                  style: TextStyle(
                    height: 1,
                    color: AppColors.indigo,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
          ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 8.h),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                Subject lectureSubject = getLectureSubject(
                    widget.subjects, widget.lectures[index].subjectId ?? 1);
                return LectureWidget(
                  lecture: widget.lectures[index],
                  lectureIndex: lectureSubject.lectures!.indexWhere(
                      (lecture) => lecture.id == widget.lectures[index].id),
                  lectureSubject: lectureSubject,
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 22,
                );
              },
              itemCount: widget.lectures.length)
        ],
      ),
    );
  }
}

class LectureWidget extends StatelessWidget {
  const LectureWidget(
      {Key? key,
      required this.lecture,
      required this.lectureIndex,
      required this.lectureSubject})
      : super(key: key);
  final Lecture lecture;
  final Subject lectureSubject;
  final int lectureIndex;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (lecture.statusVideo!) {
          DI.router.push(VideoPlayerRoute(
              lectureSubject: lectureSubject,
              lecture: lecture,
              lectureIndex: lectureIndex));
        } else {
          context.showBasicSnackBar(
              'لا يمكنك مشاهدة هذا الفيديو عليك دفع المترتب عليك');
        }
      },
      child: Container(
        padding: const EdgeInsets.only(right: 12, bottom: 18, top: 8, left: 12),
        width: double.infinity,
        height: 120,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(13)),
            boxShadow: [
              BoxShadow(
                  color: Color(0x669e9e9e),
                  spreadRadius: 1,
                  blurRadius: 6,
                  offset: Offset(6, 6))
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0, top: 8),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.58,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          lectureSubject.name ?? '  ',
                          style: const TextStyle(
                            height: 1,
                            color: Colors.black,
                            fontSize: 22,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          "الدرس ${lectureIndex + 1}", /////////// add getlectureindex()
                          style: const TextStyle(
                            height: 1,
                            color: AppColors.indigo,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 9,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text(
                            lecture.name ?? '  ',
                            style: const TextStyle(
                              height: 1,
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            context
                                .showBasicSnackBar(lecture.description ?? '');
                          },
                          child: Container(
                            width: 45,
                            height: 22,
                            decoration: BoxDecoration(
                                color: const Color(0xFFFFEBF0),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                              child: Text(
                                "الوصف",
                                style: TextStyle(color: Color(0XFFFF6905)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Row(
                        children: const [
                          Text(
                            "عدد المشاهدات",
                            style: TextStyle(
                              height: 1,
                              color: Colors.black87,
                              fontSize: 16,
                            ),
                          ),
                          Spacer(),
                          Text(
                            " 127",
                            style: TextStyle(
                              height: 1,
                              color: Colors.black87,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          getSubjectImage(lectureSubject.name ?? '')),
                      fit: BoxFit.cover)),
            ),
          ],
        ),
      ),
    );
  }
}
