import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:najeeb_academy/app/constants/colors.dart';
import 'package:najeeb_academy/app/di.dart';
import 'package:najeeb_academy/app/extensions/date_time_helper.dart';
import 'package:najeeb_academy/app/widgets/error_occured_widget.dart';
import 'package:najeeb_academy/app/widgets/shimmer.dart';
import 'package:najeeb_academy/features/courses/data/models/course_model.dart';
import 'package:najeeb_academy/features/courses/presentation/cubit/courses_cubit.dart';
import 'package:najeeb_academy/features/lectures/models/lecture.dart';
import 'package:najeeb_academy/features/lectures/presentation/lectures_page.dart';

import '../../../lectures/presentation/widgets/date_picker_widget.dart';

class SliderSection extends StatefulWidget {
  const SliderSection({Key? key}) : super(key: key);

  @override
  State<SliderSection> createState() => _SliderSectionState();
}

class _SliderSectionState extends State<SliderSection> {

  @override
  void initState() {
    super.initState();
    final coursesCubit = BlocProvider.of<CoursesCubit>(context);
    coursesCubit.getMyCourses(false);
    
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      // color: Colors.,
      child: ListView(
        padding: const EdgeInsets.only(right: 24, left: 24),
        reverse: false,
        scrollDirection: Axis.horizontal,
        children: [
          sliderContainer(context, 1),
          const SizedBox(
            width: 12,
          ),
          sliderContainer(context, 2)
        ],
      ),
    );
  }

  Widget sliderContainer(BuildContext context, int index) {
    return BlocConsumer<CoursesCubit, CoursesState>(
        listener: (context, state) {},
        builder: (context, state) {
        if (state is LoadingState) {
                return shimmer(const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: ShimmerWidget3()));
              } else if (state is ErrorState) {
                return ErrorOccuredTextWidget(
                  message: state.message,
                  fun: () {
                    return BlocProvider.of<CoursesCubit>(context)
                        .getMyCourses(false);
                  },
                );
              } else if (state is GotCoursesState) {
                List<CourseModel> courses = state.courses;
                List<Subject> allSubjects = [];
                List<Lecture> allLectures = [];
                for (var course in courses) {
                  allSubjects.addAll(course.subjects!);
                }
                for (var subject in allSubjects) {
                  allLectures.addAll(subject.lectures!);
                  DI.lectureServices.setLectures(allLectures);
                }
                return Container(
          height: double.infinity,
          width: 340,
          decoration: const BoxDecoration(
            color: AppColors.blue50,
            borderRadius: BorderRadius.all(Radius.circular(18)),
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 170,
                  margin: const EdgeInsets.only(left: 10),
                  child: Image.asset(
                    index == 1
                        ? 'assets/images/illustration1.png'
                        : 'assets/images/illustration2.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(right: 8, bottom: 36, top: 12),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          index == 1
                              ? "دروسك تنتظرك\n ما الذي ترغب في تعلمه"
                              : "يمكنك مشاهدة دروس جميع المواد\nلتعويض ما قد\nفاتك ",
                          textDirection: TextDirection.rtl,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.w700),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 8),
                          child: ElevatedButton(
                            onPressed: () {
                              if (DI.userInfo.isUnAuthenticated) {
                                AutoTabsRouter.of(context).setActiveIndex(1);
                              } else {
                                index == 1
                                    ? Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const LecturesPage(
                                                  isAllLectures: false,
                                                )))
                                    : Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DatePickerWidget(
                                                  availableDates:
                                                  getAvailableDates(allLectures)
                                                      // getAvailableDates(),
                                                ))).then((date) {
                                        if (date != null) {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => LecturesPage(
                                                  isAllLectures: false,
                                                  date: date,
                                                ),
                                              ));
                                        }
                                      });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7)),
                                side: BorderSide.none,
                                backgroundColor: index == 1
                                    ? AppColors.orange700
                                    : AppColors.purple,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 37, vertical: 6),
                                foregroundColor: Colors.white),
                            child: Text(
                              index == 1 ? 'دروسي' : 'اختر الدرس',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        )
                      ]))
            ],
          ),
        );
                }
                return ErrorOccuredTextWidget(
                fun: () {
                  return BlocProvider.of<CoursesCubit>(context)
                      .getMyCourses(false);
                },
              );
      }
    );
  }

  List<DateTime> getAvailableDates(List<Lecture> allLectures) {
    List<DateTime> listOfDates = [];
    for (var lecture in allLectures) {
      listOfDates.add(DateTime.parse(lecture.timePush!.formattedDate2));
    }
    return listOfDates;
  }
}
