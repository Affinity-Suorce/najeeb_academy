import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najeeb_academy/features/all_courses/widgets/course_widget.dart';
import 'package:najeeb_academy/features/courses/models/course.dart';

import 'widgets/top_section.dart';

class AllCoursesPage extends StatelessWidget {
  const AllCoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(12, 40, 12, 0),
              child: TopSection(),
            ),
            const SizedBox(
              height: 28,
            ),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                separatorBuilder: (context, index) => 8.verticalSpace,
                itemCount: 8,
                itemBuilder: (context, i) =>
                    CourseWidget(course: Course.all[i % Course.all.length]),
              ),
            )
          ],
        ),
      ),
    );
  }
}