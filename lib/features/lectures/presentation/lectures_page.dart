import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:najeeb_academy/app/di.dart';
import 'package:najeeb_academy/app/widgets/error_occured_widget.dart';
import 'package:najeeb_academy/app/widgets/shimmer.dart';
import 'package:najeeb_academy/features/courses/data/models/course_model.dart';
import 'package:najeeb_academy/features/courses/presentation/cubit/courses_cubit.dart';
import 'package:najeeb_academy/features/lectures/models/lecture.dart';
import 'package:najeeb_academy/features/lectures/presentation/widgets/lecture_section.dart';
import 'package:najeeb_academy/features/lectures/presentation/widgets/top_section.dart';

class LecturesPage extends StatefulWidget {
  const LecturesPage({Key? key, this.isAllLectures = false}) : super(key: key);
  final bool isAllLectures;
  @override
  State<LecturesPage> createState() => _LecturesPageState();
}

class _LecturesPageState extends State<LecturesPage> {
  @override
  void initState() {
    super.initState();
    final coursesCubit = BlocProvider.of<CoursesCubit>(context);
    coursesCubit.getMyCourses(false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: BlocConsumer<CoursesCubit, CoursesState>(
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
                return RefreshIndicator(
                  onRefresh: () {
                    return BlocProvider.of<CoursesCubit>(context)
                        .getMyCourses(false);
                  },
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.fromLTRB(12, 40, 12, 0),
                          child: TopSection(),
                        ),
                        const SizedBox(
                          height: 28,
                        ),
                        LectureSection(
                            lectures: allLectures,
                            subjects: allSubjects,
                            isAllLectures: widget.isAllLectures),
                      ],
                    ),
                  ),
                );
              }
              return ErrorOccuredTextWidget(
                fun: () {
                  return BlocProvider.of<CoursesCubit>(context)
                      .getMyCourses(false);
                },
              );
            }),
      ),
    );
  }
}
