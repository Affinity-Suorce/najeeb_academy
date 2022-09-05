import 'package:flutter/material.dart';
import 'package:najeeb_academy/app/constants/colors.dart';

class MyPaymentsWidget extends StatelessWidget {
  const MyPaymentsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Column(
        children: [
          Container(
            padding:
                const EdgeInsets.only(right: 12, bottom: 18, top: 8, left: 12),
            width: double.infinity,
            height: 120,
            color: Colors.pink.shade100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0, top: 8),
                  child: Container(
                    color: Colors.amber,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "الرياضيات",
                              style: const TextStyle(
                                height: 1,
                                color: Colors.black,
                                fontSize: 22,
                              ),
                            ),
                            Spacer(),
                            Text(
                              "الدرس ",
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
                                "قانون نيوتن الأول",
                                style: const TextStyle(
                                  height: 1,
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Spacer(),
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
              ],
            ),
          ),
          Divider()
        ],
      ),
    );
  }
}
