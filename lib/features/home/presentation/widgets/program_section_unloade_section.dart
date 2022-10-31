import 'package:flutter/material.dart';
import 'package:najeeb_academy/app/widgets/shimmer.dart';

class ProgramSectionNotLoadedWidget extends StatelessWidget {
  const ProgramSectionNotLoadedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 8, bottom: 36, top: 12),
      width: MediaQuery.of(context).size.width * 0.9,
      height: 170,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "برنامج الأسبوع",
            style: TextStyle(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 22,
          ),
          shimmer(
            Row(
              children: [
                Container(
                  width: 90,
                  margin: const EdgeInsets.only(right: 12),
                  child: Column(
                    children: const [
                      ShimmerWidget1(
                        height: 10,
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      ShimmerWidget1(
                        height: 10,
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      ShimmerWidget1(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  width: 40,
                  margin: const EdgeInsets.only(left: 14),
                  child: Column(
                    children: const [
                      ShimmerWidget1(
                        height: 10,
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      ShimmerWidget1(
                        height: 10,
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      ShimmerWidget1(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
