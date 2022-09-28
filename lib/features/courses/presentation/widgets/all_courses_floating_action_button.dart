import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:najeeb_academy/app/di.dart';
import 'package:najeeb_academy/app/router/app_router.dart';

class AllCoursesFloatingActionButton extends StatelessWidget {
  const AllCoursesFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        // pushNewScreen(
        //   context,
        //   screen: AllCoursesPage(),
        //   withNavBar: false,
        //   pageTransitionAnimation: PageTransitionAnimation.cupertino,
        // );
        DI.router.push(const AllCoursesRoute());
      },
      tooltip: 'كل الدورات',
      child: const Icon(CupertinoIcons.rectangle_stack_badge_plus),
    );
  }
}
