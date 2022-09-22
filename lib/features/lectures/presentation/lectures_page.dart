import 'package:flutter/material.dart';
import 'package:najeeb_academy/features/lectures/presentation/widgets/lecture_section.dart';
import 'package:najeeb_academy/features/lectures/presentation/widgets/top_section.dart';

class LecturesPage extends StatelessWidget {
  const LecturesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: const [
              Padding(
                padding: EdgeInsets.fromLTRB(12, 40, 12, 0),
                child: TopSection(),
              ),
              SizedBox(
                height: 28,
              ),
              LectureSection(),
            ],
          ),
        ),
      ),
    );
  }
}
