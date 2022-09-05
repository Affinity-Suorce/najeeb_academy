import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllCoursesFloatingActionButton extends StatelessWidget {
  const AllCoursesFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      tooltip: 'كل الدورات',
      child: const Icon(CupertinoIcons.rectangle_stack_badge_plus),
    );
  }
}
