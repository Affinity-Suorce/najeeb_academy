import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najeeb_academy/app/constants/colors.dart';
import 'package:najeeb_academy/app/extensions/bottom_sheet_widget.dart';
import 'package:najeeb_academy/app/extensions/date_time_helper.dart';
import 'package:najeeb_academy/features/video_player/presentation/video_player_page.dart';
import 'package:najeeb_academy/features/lectures/widgets/wheel_date_picker_bottom_sheet.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class LectureSection extends StatefulWidget {
  const LectureSection({Key? key}) : super(key: key);

  @override
  State<LectureSection> createState() => _LectureSectionState();
}

class _LectureSectionState extends State<LectureSection> {
  late DateTime day;

  @override
  void initState() {
    super.initState();
    day = DateTimeHelper.today;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "الدروس ${day.agoDate}",
                    style: const TextStyle(
                      height: 1,
                      color: Colors.black,
                      fontSize: 22,
                    ),
                  ),
                  Text(
                    day.formattedDate,
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              ),
              GestureDetector(
                onTap: () async {
                  final date = await WheelDatePickerBottomSheet(
                    initialDate: day,
                  ).showAsBottomSheet<DateTime>(
                    context,
                    isScrollControlled: true,
                  );
                  if (date != null) {
                    setState(() {
                      day = date;
                    });
                  }
                },
                child: const Text(
                  "اختر يوماً آخر",
                  style: TextStyle(
                    height: 1,
                    color: AppColors.indigo,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
          ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 8.h),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return LectureWidget(
                  index: index + 1,
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 22,
                );
              },
              itemCount: 5)
        ],
      ),
    );
  }
}

class LectureWidget extends StatelessWidget {
  const LectureWidget({Key? key, this.index = 1}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        pushNewScreen(
          context,
          screen: const VideoPlayerPage(
            subject: "الرياضيات",
          ),
          withNavBar: false, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
      },
      child: Container(
        padding: const EdgeInsets.only(right: 12, bottom: 18, top: 8, left: 12),
        width: double.infinity,
        height: 120,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(13)),
            boxShadow: [
              BoxShadow(
                  color: Color(0x669e9e9e),
                  spreadRadius: 1,
                  blurRadius: 6,
                  offset: Offset(6, 6))
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0, top: 8),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.58,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          index == 1 ? "الفيزياء" : "الرياضيات",
                          style: const TextStyle(
                            height: 1,
                            color: Colors.black,
                            fontSize: 22,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          "الدرس $index",
                          style: const TextStyle(
                            height: 1,
                            color: AppColors.indigo,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 9,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text(
                            index == 1
                                ? "قانون نيوتن الأول"
                                : index == 2
                                    ? "الاشتقاق"
                                    : index == 3
                                        ? "التكامل"
                                        : index == 4
                                            ? "اللوغاريتم"
                                            : index == 5
                                                ? "المتتاليات"
                                                : "",
                            style: const TextStyle(
                              height: 1,
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          width: 45,
                          height: 22,
                          decoration: BoxDecoration(
                              color: const Color(0xFFFFEBF0),
                              borderRadius: BorderRadius.circular(10)),
                          child: const Center(
                            child: Text(
                              '1.5h',
                              style: TextStyle(color: Color(0XFFFF6905)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Row(
                        children: const [
                          Text(
                            "عدد المشاهدات",
                            style: TextStyle(
                              height: 1,
                              color: Colors.black87,
                              fontSize: 16,
                            ),
                          ),
                          Spacer(),
                          Text(
                            " 127",
                            style: TextStyle(
                              height: 1,
                              color: Colors.black87,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(index == 1
                          ? 'assets/images/physics.png'
                          : 'assets/images/math.png'),
                      fit: BoxFit.cover)),
            ),
          ],
        ),
      ),
    );
  }
}
