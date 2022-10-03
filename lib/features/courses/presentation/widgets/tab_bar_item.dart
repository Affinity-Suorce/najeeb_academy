import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabBarItem extends StatelessWidget {
  final String title;
  // final String imagePath;
  const TabBarItem({
    super.key,
    required this.title,
    // required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    // const imageSize = 32;
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 4.h),
      // child: Row(
      //   mainAxisSize: MainAxisSize.min,
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: [
      //     SizedBox(
      //       width: imageSize.r,
      //       height: imageSize.r,
      //       child: Image.asset(
      //         imagePath,
      //         width: imageSize.r,
      //         height: imageSize.r,
      //       ),
      //     ),
      //     8.horizontalSpace,
      child: Text(
        title,
        //   ),
        // ],
      ),
    );
  }
}
