import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najeeb_academy/app/widgets/error_occured_widget.dart';
import 'package:najeeb_academy/app/widgets/shimmer.dart';
import 'package:najeeb_academy/features/courses/data/models/course.dart';
import 'package:najeeb_academy/features/courses/data/models/course_model.dart';
import 'package:najeeb_academy/features/courses/presentation/cubit/courses_cubit.dart';
import 'package:najeeb_academy/features/courses/presentation/widgets/tab_bar_item.dart';
import 'package:najeeb_academy/features/lectures/models/lecture.dart';

import '../widgets/all_courses_floating_action_button.dart';
import '../widgets/lecture_widget.dart';
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
    controller = TabController(length: 2, vsync: this);
    final coursesCubit = BlocProvider.of<CoursesCubit>(context);
    coursesCubit.getMyCourses(true);
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
                return shimmer(Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: ShimmerWidget1(),
                ));
                ;
              } else if (state is ErrorState) {
                return ErrorOccuredTextWidget(
                  message: state.message,
                );
              } else if (state is GotCoursesState) {
                List<CourseModel> courses = state.courses;
                return DefaultTabController(
                  length: courses.length,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(12, 40, 12, 0),
                        child: CoursesTopSection(),
                      ),
                      const SizedBox(
                        height: 28,
                      ),
                      TabBar(
                        isScrollable: courses.length > 2,
                        tabs: List.generate(
                          courses.length,
                          (i) => TabBarItem(
                            title: courses[i].name!,
                            imagePath: 'assets/images/logo.png',
                          ),
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          children: List.generate(
                            courses[i].subjects!.length,
                            (index) => ListView.separated(
                              padding: EdgeInsets.symmetric(
                                  vertical: 16.h, horizontal: 16.w),
                              separatorBuilder: (context, index) =>
                                  8.verticalSpace,
                              itemCount: 8,
                              itemBuilder: (context, i) => SubjectWidget(
                                subject: courses[i].subjects![index],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
              return ErrorOccuredTextWidget();
            }),
      ),
      floatingActionButton: const AllCoursesFloatingActionButton(),
    );
  }
}
