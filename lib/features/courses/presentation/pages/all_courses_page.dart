import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najeeb_academy/app/di.dart';
import 'package:najeeb_academy/app/widgets/error_occured_widget.dart';
import 'package:najeeb_academy/app/widgets/shimmer.dart';
import 'package:najeeb_academy/features/courses/data/models/course_model.dart';
import 'package:najeeb_academy/features/courses/presentation/cubit/courses_cubit.dart';
import 'package:najeeb_academy/features/courses/presentation/widgets/all_course_widget.dart';

import '../widgets/all_courses_top_section.dart';

class AllCoursesPage extends StatelessWidget {
  const AllCoursesPage({
    Key? key,
    this.onResult,
  }) : super(key: key);
  final void Function(bool success)? onResult;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DI.di<CoursesCubit>(),
      child: AllCoursesPageImpl(
        onResult: onResult,
      ),
    );
  }
}

class AllCoursesPageImpl extends StatefulWidget {
  final void Function(bool success)? onResult;
  const AllCoursesPageImpl({
    super.key,
    this.onResult,
  });

  @override
  State<AllCoursesPageImpl> createState() => _AllCoursesPageImplState();
}

class _AllCoursesPageImplState extends State<AllCoursesPageImpl> {
  @override
  void initState() {
    super.initState();
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
                return shimmer(const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: ShimmerWidget3()));
              } else if (state is ErrorState) {
                return ErrorOccuredTextWidget(
                  message: state.message,
                );
              } else if (state is GotAllCoursesState) {
                List<CourseModel> courses = state.courses;
                List<Subject> allSubjects = [];
                for (var course in courses) {
                  allSubjects.addAll(course.subjects!);
                }
                return Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(12, 40, 12, 0),
                      child: AllCoursesTopSection(),
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                    Expanded(
                      child: ListView.separated(
                        padding: EdgeInsets.symmetric(
                            vertical: 16.h, horizontal: 16.w),
                        separatorBuilder: (context, index) => 8.verticalSpace,
                        itemCount: allSubjects.length,
                        itemBuilder: (context, i) => CourseWidget(
                          subject: allSubjects[i],
                        ),
                      ),
                    )
                  ],
                );
              }
              return const ErrorOccuredTextWidget();
            }),
      ),
    );
  }
}
