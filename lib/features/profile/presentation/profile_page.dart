import 'package:flutter/material.dart';
import 'package:najeeb_academy/app/constants/colors.dart';
import 'package:najeeb_academy/app/widgets/nav_bar.dart';
import 'package:najeeb_academy/features/profile/presentation/widgets/go_to_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(12, 40, 12, 0),
              child: Navbar(
                title: "حسابي",
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 44,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                GoToWidget(
                  title: "مدفوعاتي",
                ),
                GoToWidget(
                  title: "الرئيسية",
                ),
              ],
            ),
            const SizedBox(
              height: 34,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 31),
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
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(13)),
                child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    ),
                    value: "العربية",
                    onChanged: (type) {
                      // onSelect(type);
                    },
                    style: const TextStyle(color: Colors.black, fontSize: 18),
                    items: const [
                      DropdownMenuItem(
                        value: "العربية",
                        child: Text(
                          "العربية",
                        ),
                      ),
                      DropdownMenuItem(
                        value: "الانكليزية",
                        child: Text(
                          "الانكليزية",
                        ),
                      ),
                    ]),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
                padding: const EdgeInsets.only(
                    left: 18, right: 18, top: 25, bottom: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    rowWidget('الاسم الكامل:', 'Adnan Kuzaiz'),
                    const SizedBox(height: 12),
                    rowWidget('الإيميل:', 'adnankuza@gmail.com'),
                    const SizedBox(height: 12),
                    rowWidget('الجوال:', '0936289209'),
                    const SizedBox(height: 12),
                    rowWidget('التلفون:', '0116612043'),
                    const SizedBox(height: 12),
                    rowWidget('تاريخ الميلاد:', '1999/8/2'),
                    const SizedBox(height: 12),
                    rowWidget('الجنس:', 'male'),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Widget rowWidget(String lable, String value) {
    if (value.isEmpty || value.toLowerCase() == 'null') {
      return const SizedBox.shrink();
    }
    if (value == 'null') value = '';

    return Material(
      shadowColor: AppColors.searchField,
      elevation: 1.8,
      borderRadius: BorderRadius.circular(4),
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          height: 55,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: AppColors.searchField),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                lable,
                style: const TextStyle(color: Colors.black54, fontSize: 16),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Expanded(
                  child: Text(
                    value,
                    textAlign: TextAlign.end,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
