import 'package:flutter/material.dart';
import 'package:najeeb_academy/app/di.dart';

class Navbar extends StatelessWidget {
  const Navbar(
      {Key? key,
      this.title,
      this.color = Colors.white,
      this.withdrawer = true,
      this.withBackButton = false})
      : super(key: key);
  final String? title;
  final Color color;
  final bool withBackButton;
  final bool withdrawer;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title ?? getTitle(),
          style: TextStyle(
            height: 1.4,
            color: color,
            fontWeight: FontWeight.w700,
            fontSize: 30,
          ),
          textDirection: TextDirection.rtl,
        ),
        const Spacer(),
        withBackButton
            ? InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(
                  Icons.arrow_forward,
                  color: color,
                  size: 30,
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }

  String getTitle() {
    return DI.userInfo.isUnAuthenticated
        ? 'أهلاً بك'
        : "أهلاً ${getNameFromTitle(DI.userInfo.student!.name)}";
  }

  String getNameFromTitle(String title) => title.split('-')[0].toString();
}
