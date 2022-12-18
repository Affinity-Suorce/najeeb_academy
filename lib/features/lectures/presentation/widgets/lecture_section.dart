import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najeeb_academy/app/constants/colors.dart';
import 'package:najeeb_academy/app/di.dart';
import 'package:najeeb_academy/app/extensions/date_time_helper.dart';
import 'package:najeeb_academy/app/extensions/snack_bar_build_context.dart';
import 'package:najeeb_academy/app/router/app_router.dart';
import 'package:najeeb_academy/core/helpers/funcs.dart';
import 'package:najeeb_academy/features/courses/data/models/course_model.dart';
import 'package:najeeb_academy/features/lectures/models/lecture.dart';
import 'package:najeeb_academy/features/lectures/presentation/widgets/date_picker_widget.dart';

class LectureSection extends StatefulWidget {
  const LectureSection({
    Key? key,
    required this.lectures,
    required this.subjects,
    required this.isAllLectures,
  }) : super(key: key);
  final List<Lecture> lectures;
  final List<Subject> subjects;
  final bool isAllLectures;
  @override
  State<LectureSection> createState() => _LectureSectionState();
}

class _LectureSectionState extends State<LectureSection> {
  late DateTime day;
  List<Lecture> tempListOfLectures = [];

  @override
  void initState() {
    super.initState();
    widget.isAllLectures
        ? tempListOfLectures = widget.lectures
        : tempListOfLectures = getLecturesByDate(DateTime.now());
    day = DateTimeHelper.today;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26.0),
      child: Column(
        children: [
          widget.isAllLectures
              ? const SizedBox.shrink()
              : Row(
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
                        Row(
                          children: [
                            Text(
                              day.formattedDate,
                              style: Theme.of(context).textTheme.caption,
                            ),
                            const SizedBox(width: 6),
                            // GestureDetector(
                            //   onTap: () {
                            //     setState(() {
                            //       tempListOfLectures = widget.lectures;
                            //     });
                            //   },
                            //   child: const Text(
                            //     "اظهر كافة الدروس",
                            //     style: TextStyle(
                            //       height: 1,
                            //       color: AppColors.indigo,
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () async {
                        Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DatePickerWidget(
                                        availableDates: getAvailableDates())))
                            .then((date) {
                          if (date != null) {
                            setState(() {
                              day = date;
                              tempListOfLectures = getLecturesByDate(date);
                            });
                          }
                        });
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
          tempListOfLectures.isEmpty
              ? SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: const Center(
                      child: Text(
                    'لا يوجد دروس لليوم\nإختر يوماً اَخر',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontSize: 32),
                  )),
                )
              : ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.only(top: 8.h),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    Subject lectureSubject = getLectureSubject(widget.subjects,
                        tempListOfLectures[index].subjectId ?? 1);
                    return LectureWidget(
                      lecture: tempListOfLectures[index],
                      lectureIndex: lectureSubject.lectures!.indexWhere(
                          (lecture) =>
                              lecture.id == tempListOfLectures[index].id),
                      lectureSubject: lectureSubject,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 22,
                    );
                  },
                  itemCount: tempListOfLectures.length)
        ],
      ),
    );
  }

  List<DateTime> getAvailableDates() {
    List<DateTime> listOfDates = [];
    for (var lecture in widget.lectures) {
      listOfDates.add(DateTime.parse(lecture.timePush!.formattedDate2));
    }
    return listOfDates;
  }

  List<Lecture> getLecturesByDate(DateTime date) {
    return widget.lectures
        .where((lecture) => DateTime.parse(
                lecture.timePush!.formattedDate2)
            .isSameDate(date))
        .toList();
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
    return GestureDetector(
      onLongPress: () {
        context.showBasicSnackBar(lecture.description ?? '');
      },
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
                        Container(
                          width: MediaQuery.of(context).size.width * 0.45,
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                lecture.name ?? '  ',
                                style: const TextStyle(
                                  height: 1.2,
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                            ],
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
                        children: [
                          const Text(
                            "تاريخ الدرس",
                            style: TextStyle(
                              height: 1,
                              color: Colors.black87,
                              fontSize: 16,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            lecture.timePush!.formattedDate2,
                            style: const TextStyle(
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
                      fit: BoxFit.contain)),
            ),
          ],
        ),
      ),
    );
  }
}
