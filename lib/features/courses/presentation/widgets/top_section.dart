import 'package:flutter/material.dart';
import 'package:najeeb_academy/app/widgets/nav_bar.dart';

class CoursesTopSection extends StatelessWidget {
  const CoursesTopSection({Key? key, this.classname}) : super(key: key);
  final String? classname;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Navbar(
          title: classname != null ? "مواد صف $classname" : "صفوفي",
          color: Colors.black,
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
