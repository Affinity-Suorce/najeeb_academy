import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najeeb_academy/features/courses/widgets/tab_bar_item.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../video_player/presentation/video_player_page.dart';
import 'models/course.dart';
import 'widgets/all_courses_floating_action_button.dart';
import 'widgets/top_section.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({Key? key}) : super(key: key);

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage>
    with SingleTickerProviderStateMixin {
  static const courses = [
    Course(
      id: '0',
      title: 'بكالوريا',
      imagePath: 'https://loremflickr.com/48/48',
    ),
    Course(
      id: '1',
      title: 'تاسع',
      imagePath: 'https://loremflickr.com/48/48',
    ),
    Course(
      id: '2',
      title: 'TOEFL',
      imagePath: 'https://loremflickr.com/48/48',
    ),
  ];
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
          length: courses.length,
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
                isScrollable: courses.length > 2,
                tabs: List.generate(
                  courses.length,
                  (i) => TabBarItem(
                    title: courses[i].title,
                    imagePath: courses[i].imagePath,
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: List.generate(
                    courses.length,
                    (index) => ListView.separated(
                      padding: EdgeInsets.symmetric(
                          vertical: 16.h, horizontal: 16.w),
                      separatorBuilder: (context, index) => 8.verticalSpace,
                      itemCount: 8,
                      itemBuilder: (context, i) => LectureWidget(index: i),
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

class LectureWidget extends StatelessWidget {
  const LectureWidget({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: InkWell(
        onTap: () {
          pushNewScreen(
            context,
            screen: VideoPlayerPage(
              subject: "الرياضيات",
            ),
            withNavBar: false, // OPTIONAL VALUE. True by default.
            pageTransitionAnimation: PageTransitionAnimation.cupertino,
          );
        },
        child: Padding(
          padding:
              const EdgeInsets.only(right: 12, bottom: 18, top: 8, left: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.58,
                child: ListTile(
                  title: Text(
                    index % 2 == 0 ? "الفيزياء" : "الرياضيات",
                    style: const TextStyle(
                      height: 1,
                      color: Colors.black,
                      fontSize: 22,
                    ),
                  ),
                  subtitle: Text(
                    "عدد الدروس: ${(((index + 1) * 10) - index).toInt()}",
                    style: const TextStyle(
                      height: 1,
                      color: Colors.black87,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(index % 2 == 0
                            ? 'assets/images/physics.png'
                            : 'assets/images/math.png'),
                        fit: BoxFit.cover)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
