import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget shimmer(Widget t) => Shimmer.fromColors(
      child: t,
      baseColor: Colors.black.withOpacity(0.2),
      highlightColor: Colors.white,
    );

class ShimmerWidget1 extends StatelessWidget {
  const ShimmerWidget1({Key? key, this.height}) : super(key: key);
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}

class ShimmerWidget2 extends StatelessWidget {
  const ShimmerWidget2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.custom(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 150,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12),
        childrenDelegate: SliverChildBuilderDelegate((context, index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2),
              borderRadius: BorderRadius.circular(15),
            ),
          );
        }, childCount: 4));
  }
}

