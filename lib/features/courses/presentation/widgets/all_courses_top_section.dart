import 'package:flutter/material.dart';
import 'package:najeeb_academy/app/widgets/nav_bar.dart';

class AllCoursesTopSection extends StatelessWidget {
  const AllCoursesTopSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            BackButton(),
            Expanded(
              child: Navbar(
                title: "اختر المواد",
                color: Colors.black,
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
