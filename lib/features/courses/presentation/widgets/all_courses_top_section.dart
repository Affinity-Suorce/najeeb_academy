import 'package:flutter/material.dart';
import 'package:najeeb_academy/app/widgets/nav_bar.dart';

class AllCoursesTopSection extends StatelessWidget {
  const AllCoursesTopSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            BackButton(),
            Expanded(
              child: Navbar(
                title: "اختر المواد",
                color: Colors.black,
              ),
            ),
          ],
        ),
        SizedBox(height: 24),
      ],
    );
  }
}
