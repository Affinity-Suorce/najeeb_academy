import 'package:flutter/material.dart';
import 'package:najeeb_academy/app/constants/colors.dart';

class HomePageBottomSection extends StatelessWidget {
  const HomePageBottomSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 8, bottom: 30, top: 12),
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: const BoxDecoration(
          color: AppColors.lightPurple,
          borderRadius: BorderRadius.all(Radius.circular(13)),
          boxShadow: [
            BoxShadow(
                color: Color(0x669e9e9e),
                spreadRadius: 1,
                blurRadius: 6,
                offset: Offset(6, 6))
          ]),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: const EdgeInsets.only(top: 8, left: 12),
              width: 115,
              height: 115,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/group1.png'),
                      fit: BoxFit.contain)),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Text(
                  'أكاديمية نجيب التعليمية',
                  style: TextStyle(
                    color: AppColors.purple,
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                  ),
                  textDirection: TextDirection.rtl,
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'تعلم معنا يوميا كافة المواد\nوالدروس بالطريقة المناسبة لك',
                  style: TextStyle(
                    height: 1.4,
                    color: AppColors.purple,
                    fontSize: 20,
                  ),
                  textDirection: TextDirection.rtl,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
