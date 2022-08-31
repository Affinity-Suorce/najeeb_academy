import 'package:flutter/material.dart';
import 'package:najeeb_academy/app/constants/colors.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:najeeb_academy/features/video_player/presentation/video_player_page.dart';

class LectureSection extends StatelessWidget {
  const LectureSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "اختر يوماً آخر",
                style: TextStyle(
                  height: 1,
                  color: AppColors.purple100,
                  fontSize: 18,
                ),
              ),
              Text(
                "دروس اليوم",
                style: TextStyle(
                  height: 1,
                  color: Colors.black,
                  fontSize: 22,
                ),
              ),
            ],
          ),
          ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return LectureWidget(
                  index: index + 1,
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
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
  final index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        pushNewScreen(
        context,
        screen: VideoPlayerPage(subject: "الرياضيات",),
        withNavBar: false, // OPTIONAL VALUE. True by default.
        pageTransitionAnimation: PageTransitionAnimation.cupertino,
    );
      },
      child: Container(
        padding: EdgeInsets.only(right: 12, bottom: 18, top: 8, left: 12),
        width: double.infinity,
        height: 120,
        decoration: BoxDecoration(
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
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 8.0, top: 8),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.58,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Text(
                          "الدرس $index",
                          style: TextStyle(
                            height: 1,
                            color:AppColors.indigo,
                            fontSize: 16,
                          ),
                        ),
                        Spacer(),
                        Text(
                          index == 1 ? "الفيزياء" : "الرياضيات",
                          style: TextStyle(
                            height: 1,
                            color: Colors.black,
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 9,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 45,
                          height: 22,
                          decoration: BoxDecoration(
                              color: Color(0xFFFFEBF0),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              '1.5h',
                              style: TextStyle(color: Color(0XFFFF6905)),
                            ),
                          ),
                        ),
                        Spacer(),
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
                            style: TextStyle(
                              height: 1,
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Row(
                        children: [
                          Text(
                            " 127",
                            style: TextStyle(
                              height: 1,
                              color: Colors.black87,
                              fontSize: 16,
                            ),
                          ),
                          Spacer(),
                          Text(
                            "عدد المشاهدات",
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
          ],
        ),
      ),
    );
  }
}
