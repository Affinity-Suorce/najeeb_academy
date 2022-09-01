import 'package:flutter/material.dart';
import 'package:najeeb_academy/app/constants/colors.dart';
class SliderSection extends StatelessWidget {
  const SliderSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      // color: Colors.,
      child: ListView(
        padding: EdgeInsets.only(right: 24, left: 24),
        reverse: true,
        scrollDirection: Axis.horizontal,
        children: [
          sliderContainer(context, 1),
          SizedBox(
            width: 12,
          ),
          sliderContainer(context, 2)
        ],
      ),
    );
  }

  Widget sliderContainer(BuildContext context, int index) {
    return Container(
      height: double.infinity,
      width: 340,
      decoration: BoxDecoration(
        color: AppColors.blue50,
        borderRadius: BorderRadius.all(Radius.circular(18)),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 170,
              margin: EdgeInsets.only(left: 10),
              child: Image.asset(
                index == 1
                    ? 'assets/images/illustration1.png'
                    : 'assets/images/illustration2.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
              width: double.infinity,
              padding: EdgeInsets.only(right: 8, bottom: 36, top: 12),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      index == 1
                          ? "دروسك تنتظرك\n ما الذي ترغب في تعلمه"
                          : "يمكنك مشاهدة دروس جميع المواد\nلتعويض ما قد\nفاتك ",
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w700),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 8),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          index == 1 ? 'ابدأ الآن' : 'اختر اليوم',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7)),
                            side: BorderSide.none,
                            primary: index == 1 ? AppColors.orange700 : AppColors.purple,
                            padding: EdgeInsets.symmetric(
                                horizontal: 37, vertical: 6),
                            onPrimary: Colors.white),
                      ),
                    )
                  ]))
        ],
      ),
    );
  }
}