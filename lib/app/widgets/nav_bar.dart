import 'package:flutter/material.dart';
import 'package:najeeb_academy/app/di.dart';

class Navbar extends StatelessWidget {
  const Navbar(
      {Key? key, this.title, this.color = Colors.white, this.withdrawer = true})
      : super(key: key);
  final String? title;
  final Color color;
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
        // withdrawer
        //     ? InkWell(
        //         onTap: () {
        //           ZoomDrawer.of(context)!.open();
        //         },
        //         child: Icon(
        //           Icons.menu_rounded,
        //           color: color,
        //           size: 35,
        //         ),
        //       )
        //     : const SizedBox.shrink(),
      ],
    );
  }

  String getTitle() {
    return DI.userInfo.isUnAuthenticated
        ? title!
        : "أهلاً ${DI.userInfo.student?.name}";
  }
}
