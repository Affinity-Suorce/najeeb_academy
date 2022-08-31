import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:najeeb_academy/app/constants/colors.dart';
import 'package:najeeb_academy/core/ui/nav_bar.dart';
import 'package:najeeb_academy/core/ui/text_form_field.dart';

class TopSection extends StatelessWidget {
  const TopSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Navbar(
          title: "دروسي", 
          color: Colors.black,
        ),
        SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: CustomTextFormField(
            textInputAction: TextInputAction.done,
            validator: (p0) => null,
            fillColor: AppColors.searchField,
            textColor: AppColors.purple100,
            fontSize: 19,
            prefix: Padding(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
              child: Icon(
                CupertinoIcons.search,
                color: AppColors.purple100,
                size: 30,
              ),
            ),
            suffix: Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 12, 8),
              child: Image.asset(
                "assets/icons/filter.png",
              ),
            ),
            padding: EdgeInsets.fromLTRB(14, 0,0, 14),
            hintText: "ابحث عن درس",
            textDirection: TextDirection.rtl,
          ),
        )
      ],
    );
  }
}
