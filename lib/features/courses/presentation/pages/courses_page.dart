import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najeeb_academy/app/widgets/error_occured_widget.dart';
import 'package:najeeb_academy/app/widgets/shimmer.dart';
import 'package:najeeb_academy/features/courses/data/models/course_model.dart';
import 'package:najeeb_academy/features/courses/presentation/cubit/courses_cubit.dart';
import 'package:najeeb_academy/features/courses/presentation/widgets/tab_bar_item.dart';

import '../widgets/all_courses_floating_action_button.dart';
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
    controller = TabController(length: 2, vsync: this);
    final coursesCubit = BlocProvider.of<CoursesCubit>(context);
    coursesCubit.getMyCourses(false);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
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
                  child: Column(
                    children: const [
                      SizedBox(
                        height: 86,
                      ),
                      ShimmerWidget1(height: 45),
                      SizedBox(
                        height: 28,
                      ),
                      ShimmerWidget2(),
                    ],
                  ),
                ));
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
                          imagePath: 'assets/images/logo.png',
                        ),
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: controller,
                        children: List.generate(
                          courses.length,
                          (index) => ListView.separated(
                            padding: EdgeInsets.symmetric(
                                vertical: 16.h, horizontal: 16.w),
                            separatorBuilder: (context, index) =>
                                8.verticalSpace,
                            itemCount:
                                courses[controller.index].subjects!.length,
                            itemBuilder: (context, i) => SubjectWidget(
                              subject:
                                  courses[controller.index].subjects![index],
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
            }),
      ),
      floatingActionButton: const AllCoursesFloatingActionButton(),
    );
  }
}
