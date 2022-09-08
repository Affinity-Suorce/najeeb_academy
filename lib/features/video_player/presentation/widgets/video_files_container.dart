import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:najeeb_academy/app/constants/colors.dart';
import 'package:najeeb_academy/app/widgets/button.dart';
import 'package:najeeb_academy/app/widgets/text_form_field.dart';

class VideoFilesContainer extends StatelessWidget {
  const VideoFilesContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 250,
      padding: const EdgeInsets.fromLTRB(24, 22, 24, 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(children: [
            Text(
              'ملفات الجلسة:',
              textDirection: TextDirection.rtl,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w700),
            ),
          ]),
          SizedBox(
            height: 28,
          ),
          SizedBox(
            height: 100,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) => fileColumn(index + 1),
              separatorBuilder: (context, index) => SizedBox(
                width: 50,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget fileColumn(int index) => Column(
        children: [
          Icon(
            FontAwesomeIcons.solidFilePdf,
            color: Colors.red,
            size: 58,
          ),
          Text('الملف $index')
        ],
      );
}
