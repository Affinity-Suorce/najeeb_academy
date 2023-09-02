import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najeeb_academy/app/constants/colors.dart';
import 'package:najeeb_academy/app/di.dart';
import 'package:najeeb_academy/app/extensions/date_time_helper.dart';
import 'package:najeeb_academy/app/widgets/error_occured_widget.dart';
import 'package:najeeb_academy/app/widgets/shimmer.dart';
import 'package:najeeb_academy/core/helpers/funcs.dart';
import 'package:najeeb_academy/features/courses/data/models/course_model.dart';
import 'package:najeeb_academy/features/courses/presentation/cubit/courses_cubit.dart';
import 'package:najeeb_academy/features/lectures/models/lecture.dart';
import 'package:najeeb_academy/features/lectures/presentation/widgets/lecture_section.dart';

class HomePageBottomSection extends StatefulWidget {
  const HomePageBottomSection({super.key});

  @override
  State<HomePageBottomSection> createState() => _HomePageBottomSectionState();
}

class _HomePageBottomSectionState extends State<HomePageBottomSection> {
  List<Lecture> tempListOfLectures = [];

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<CoursesCubit, CoursesState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is LoadingState) {
            return shimmer(const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: ShimmerWidget3()));
          }
          else if (state is ErrorState) {
            return ErrorOccuredTextWidget(
              message: state.message,
              fun: () {
                return BlocProvider.of<CoursesCubit>(context)
                    .getMyCourses(false);
              },
            );
          }
          else if (state is GotCoursesState) {
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
            tempListOfLectures = getLecturesByDate();

            return tempListOfLectures.isNotEmpty
                ? ListView.separated(
                  shrinkWrap: true,
                padding: EdgeInsets.only(top: 8.h,right: 25.w,left: 25.w),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  Subject lectureSubject = getLectureSubject(allSubjects, tempListOfLectures[index].subjectId ?? 1);
                  return LectureWidget(
                    isHome: true,
                    lecture: tempListOfLectures[index],
                    lectureIndex: lectureSubject.lectures!
                        .indexWhere((lecture) =>
                    lecture.id ==
                        tempListOfLectures[index].id),
                    lectureSubject: lectureSubject,
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 22,
                  );
                },
                itemCount: tempListOfLectures.length): Container(
              padding: const EdgeInsets.only(right: 8, bottom: 30, top: 12),
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: const BoxDecoration(
                  color: AppColors.lightPurple,
                  borderRadius: BorderRadius.all(Radius.circular(13)),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0x669e9e9e),
                        spreadRadius: 1,
                        blurRadius: 6,
                        offset: Offset(6, 6))
                  ]),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.only(top: 8, left: 12),
                      width: 115,
                      height: 115,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/group1.png'),
                              fit: BoxFit.contain)),
                    ),
                  ),
                  const SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'دروس اليوم',
                          style: TextStyle(
                            color: AppColors.purple,
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                          ),
                          textDirection: TextDirection.rtl,
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          "لايوجد دروس اليوم",
                          style: TextStyle(
                            height: 1.4,
                            color: AppColors.purple,
                            fontSize: 20,
                          ),
                          textDirection: TextDirection.rtl,
                        ),
                      ],
                    ),
                  ),
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
        });
  }

  List<Lecture> getLecturesByDate() {
    List<Lecture> list =  DI.lectureServices.getLectures
        .where((lecture) {
           return lecture.timePush!.isToday;
        }).toList();
    return list;
  }
}
