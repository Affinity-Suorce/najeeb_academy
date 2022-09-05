import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabBarItem extends StatelessWidget {
  final String title;
  final String imagePath;
  const TabBarItem({
    super.key,
    required this.title,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    const imageSize = 24;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: SizedBox(
              width: imageSize.r,
              height: imageSize.r,
              child: Image.network(
                imagePath,
                width: imageSize.r,
                height: imageSize.r,
              ),
            ),
          ),
          8.horizontalSpace,
          Text(
            title,
          ),
        ],
      ),
    );
  }
}
