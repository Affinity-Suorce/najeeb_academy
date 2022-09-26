import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:najeeb_academy/app/di.dart';
import 'package:najeeb_academy/app/router/app_router.dart';
import 'package:najeeb_academy/features/courses/presentation/cubit/courses_cubit.dart';
import 'package:najeeb_academy/features/courses/presentation/pages/all_courses_page.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class AllCoursesFloatingActionButton extends StatelessWidget {
  const AllCoursesFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        pushNewScreen(
          context,
          screen: AllCoursesPage(),
          withNavBar: false,
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
      },
      tooltip: 'كل الدورات',
      child: const Icon(CupertinoIcons.rectangle_stack_badge_plus),
    );
  }
}
