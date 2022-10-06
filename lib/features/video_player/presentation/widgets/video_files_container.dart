import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class VideoFilesContainer extends StatelessWidget {
  VideoFilesContainer({Key? key, required this.lectureFiles}) : super(key: key);
  List<String> lectureFiles;
  @override
  Widget build(BuildContext context) {
    lectureFiles = ['', ''];
    return Container(
      width: MediaQuery.of(context).size.width,
      // height: 250,
      padding: const EdgeInsets.fromLTRB(24, 22, 24, 22),
      child: lectureFiles.isEmpty
          ? const Text(
              'ليس هناك ملفات للجلسة',
              textDirection: TextDirection.rtl,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w700),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(children: const [
                  Text(
                    'ملفات الجلسة:',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                  ),
                ]),
                const SizedBox(
                  height: 28,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 160,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  itemBuilder: (context, index) {
                    return fileColumn(index + 1);
                  },
                  itemCount: lectureFiles.length,
                )
              ],
            ),
    );
  }

  Widget fileColumn(int index) => SizedBox(
        height: 80,
        child: Column(
          children: [
            const Icon(
              FontAwesomeIcons.solidFilePdf,
              color: Colors.red,
              size: 58,
            ),
            Text('الملف $index')
          ],
        ),
      );
}
