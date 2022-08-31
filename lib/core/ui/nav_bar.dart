import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class Navbar extends StatelessWidget {
  Navbar({Key? key, this.title = "أهلاً ,أحمد", this.color = Colors.white})
      : super(key: key);
  final String title;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            ZoomDrawer.of(context)!.open();
          },
          child: Icon(
            Icons.menu_rounded,
            color: color,
            size: 35,
          ),
        ),
        Spacer(),
        Container(
          child: Text(
            title,
            style: TextStyle(
              height: 1.4,
              color: color,
              fontWeight: FontWeight.w700,
              fontSize: 30,
            ),
            textDirection: TextDirection.rtl,
          ),
        )
      ],
    );
  }
}
