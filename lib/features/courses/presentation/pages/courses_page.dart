import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najeeb_academy/app/di.dart';
import 'package:najeeb_academy/app/router/app_router.dart';
import 'package:najeeb_academy/app/widgets/error_occured_widget.dart';
import 'package:najeeb_academy/app/widgets/shimmer.dart';
import 'package:najeeb_academy/features/courses/data/models/course_model.dart';
import 'package:najeeb_academy/features/courses/presentation/cubit/courses_cubit.dart';
import 'package:najeeb_academy/features/courses/presentation/widgets/tab_bar_item.dart';

import '../widgets/subject_widget.dart';
import '../widgets/top_section.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({super.key});

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage>
    with SingleTickerProviderStateMixin {
  late final TabController controller;

  @override
  void initState() {
    super.initState();
    if (DI.userInfo.isUnAuthenticated) {
      DI.router.push(AllCoursesRoute());
    }
    controller = TabController(length: 2, vsync: this);
    final coursesCubit = BlocProvider.of<CoursesCubit>(context);
    coursesCubit.getMyCourses(false);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

// Text(
//               "$message!!",
//               style: const TextStyle(color: Color.fromRGBO(0, 0, 0, 1), fontSize: 28),
//             ),
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: DI.userInfo.isAuthenticated
            ? BlocConsumer<CoursesCubit, CoursesState>(
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
                    if (courses.length == 1) {
                      return CoursesPageWithSingleClass(
                        course: courses[0],
                      );
                    }
                    return Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.fromLTRB(12, 40, 12, 0),
                          child: CoursesTopSection(),
                        ),
                        const SizedBox(
                          height: 28,
                        ),
                        TabBar(
                          controller: controller,
                          isScrollable: courses.length > 2,
                          tabs: List.generate(
                            courses.length,
                            (i) => TabBarItem(
                              title: courses[i].name!,
                              // imagePath: 'assets/images/logo.png',
                            ),
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: controller,
                            children: List.generate(
                              courses.length,
                              (index) => RefreshIndicator(
                                onRefresh: () {
                                  return BlocProvider.of<CoursesCubit>(context)
                                      .getMyCourses(false);
                                },
                                child: ListView.separated(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 16.h, horizontal: 16.w),
                                  separatorBuilder: (context, index) =>
                                      8.verticalSpace,
                                  itemCount: courses[index].subjects!.length,
                                  itemBuilder: (context, i) => SubjectWidget(
                                    subject: courses[index].subjects![i],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                  return ErrorOccuredTextWidget(
                    fun: () {
                      return BlocProvider.of<CoursesCubit>(context)
                          .getMyCourses(false);
                    },
                  );
                })
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/boarding_0.png",
                      fit: BoxFit.cover,
                    ),
                    const Text(
                      "لعرض دروسك عليك اختيار المواد\nوتسجيل الدخول إضغط الزر في \nالأسفل",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1), fontSize: 24),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

class CoursesPageWithSingleClass extends StatelessWidget {
  const CoursesPageWithSingleClass({Key? key, required this.course})
      : super(key: key);
  final CourseModel course;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 60, 12, 0),
          child: CoursesTopSection(
            classname: course.name,
          ),
        ),
        const SizedBox(
          height: 28,
        ),
        RefreshIndicator(
          onRefresh: () {
            return BlocProvider.of<CoursesCubit>(context).getMyCourses(false);
          },
          child: ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
            separatorBuilder: (context, index) => 8.verticalSpace,
            itemCount: course.subjects!.length,
            itemBuilder: (context, i) => SubjectWidget(
              subject: course.subjects![i],
            ),
          ),
        ),
      ],
    );
  }
}
