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
        color: Colors.black.withOpacity(0.3),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}

class ShimmerWidget2 extends StatelessWidget {
  const ShimmerWidget2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) => Container(
            height: 115,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          separatorBuilder: (context, index) => SizedBox(
            height: 20,
          ),
          itemCount: 4,
        ),
      ],
    );
  }
}
