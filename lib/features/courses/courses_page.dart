import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najeeb_academy/features/courses/widgets/tab_bar_item.dart';
import 'package:najeeb_academy/features/lectures/models/lecture.dart';

import 'models/course.dart';
import 'widgets/all_courses_floating_action_button.dart';
import 'widgets/lecture_widget.dart';
import 'widgets/top_section.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: DefaultTabController(
          length: Course.all.length,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(12, 40, 12, 0),
                child: TopSection(),
              ),
              const SizedBox(
                height: 28,
              ),
              TabBar(
                isScrollable: Course.all.length > 2,
                tabs: List.generate(
                  Course.all.length,
                  (i) => TabBarItem(
                    title: Course.all[i].title,
                    imagePath: Course.all[i].imagePath,
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: List.generate(
                    Course.all.length,
                    (index) => ListView.separated(
                      padding: EdgeInsets.symmetric(
                          vertical: 16.h, horizontal: 16.w),
                      separatorBuilder: (context, index) => 8.verticalSpace,
                      itemCount: 8,
                      itemBuilder: (context, i) => LectureWidget(
                          lecture: Lecture.all[i % Lecture.all.length]),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: const AllCoursesFloatingActionButton(),
    );
  }
}
