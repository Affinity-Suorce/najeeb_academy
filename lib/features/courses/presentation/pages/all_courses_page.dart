import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najeeb_academy/app/constants/colors.dart';
import 'package:najeeb_academy/app/di.dart';
import 'package:najeeb_academy/app/extensions/dialog_build_context.dart';
import 'package:najeeb_academy/app/extensions/snack_bar_build_context.dart';
import 'package:najeeb_academy/app/router/app_router.dart';
import 'package:najeeb_academy/app/widgets/button.dart';
import 'package:najeeb_academy/app/widgets/error_occured_widget.dart';
import 'package:najeeb_academy/app/widgets/shimmer.dart';
import 'package:najeeb_academy/features/courses/data/models/course_model.dart';
import 'package:najeeb_academy/features/courses/presentation/cubit/courses_cubit.dart';
import 'package:najeeb_academy/features/courses/presentation/widgets/all_course_widget.dart';
import 'package:najeeb_academy/features/courses/presentation/widgets/check_dialog.dart';
import 'package:najeeb_academy/features/payment/presentation/widgets/payment_dialog.dart';

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
  ExpandableController? expandableController;
  @override
  void initState() {
    super.initState();
    DI.coursesServices.clearFullPrice();
    DI.coursesServices.resetLists();
    final coursesCubit = BlocProvider.of<CoursesCubit>(context);
    coursesCubit.getMyCourses(true);
    expandableController = ExpandableController(initialExpanded: false);
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
                  if (course.subjects != null) {
                    allSubjects.addAll(course.subjects!);
                  }
                  DI.coursesServices.setSubjects(allSubjects);
                }
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(12, 40, 12, 0),
                        child: AllCoursesTopSection(),
                      ),
                      const SizedBox(
                        height: 28,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          padding: EdgeInsets.symmetric(
                              vertical: 12.h, horizontal: 12.w),
                          separatorBuilder: (context, index) =>
                              12.verticalSpace,
                          itemCount: courses.length,
                          itemBuilder: (context, i) => Material(
                            color: Colors.white,
                            elevation: 5,
                            borderRadius: BorderRadius.circular(15),
                            child: ExpandablePanel(
                              controller:
                                  ExpandableController(initialExpanded: false),
                              header: CourseExpandableHeaderWidget(
                                course: courses[i],
                              ),
                              collapsed: const SizedBox.shrink(),
                              expanded: CourseExpandableBodyWidget(
                                  course: courses[i]),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          children: [
                            Expanded(
                              child: CustomElevatedButton(
                                onPressed: () async {
                                  debugPrint('entering ashtarek function');
                                  if (validateSelection()) {
                                    DI.coursesServices
                                        .setFullPriceOfSelectedCourses();
                                      int fullPrice = DI
                                                .coursesServices.getfullPrice;
                                    bool? result = await context.showDialog(
                                        CheckDialog(
                                            fullPrice: fullPrice
                                                .toString()),
                                        barrierDismissible: false);
                                    if (result!) {
                                      if (DI.userInfo.isUnAuthenticated) {
                                        DI.router.push(RegisterRoute(
                                            myClassesIds: DI.coursesServices
                                                .getSelectedCourses,
                                            subjectsIds: DI.coursesServices
                                                .getSelectedSubjects,
                                                amount: fullPrice));
                                      } else {
                                        // ignore: use_build_context_synchronously
                                        await context.showDialog(
                                            PaymentDialog(
                                                myClassesIds: DI.coursesServices
                                                    .getSelectedCourses,
                                                subjectsIds: DI.coursesServices
                                                    .getSelectedSubjects,
                                                paidAmount: fullPrice.toString()),
                                            barrierDismissible: false);
                                        BlocProvider.of<CoursesCubit>(context).getMyCourses(true);
                                      }
                                    }

                                    debugPrint(
                                        "courses:${DI.coursesServices.getSelectedCourses} subjects:${DI.coursesServices.getSelectedSubjects}");
                                  }
                                },
                                buttonColor: AppColors.indigo,
                                verticalPadding: 8,
                                title: 'اشترك',
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                );
              }
              return const ErrorOccuredTextWidget();
            }),
      ),
    );
  }

  bool validateSelection() {
    if (DI.coursesServices.getSelectedCourses.isEmpty &&
        DI.coursesServices.getSelectedSubjects.isEmpty) {
      context.showBasicSnackBar('الرجاء اختيار أحد المواد للإستمرار');
      return false;
    }
    return true;
  }
}
