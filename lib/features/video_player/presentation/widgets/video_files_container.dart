import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:najeeb_academy/core/helpers/download_file_funcs.dart';

class VideoFilesContainer extends StatelessWidget {
  VideoFilesContainer(
      {Key? key, required this.lectureFiles, required this.lectureName})
      : super(key: key);
  List<String> lectureFiles;
  String lectureName;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.fromLTRB(24, 22, 24, 22),
      child: lectureFiles.isEmpty
          ? const Text(
              'ليس هناك ملفات للدرس',
              textDirection: TextDirection.rtl,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w700),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(children: [
                  Text(
                    'ملفات $lectureName:',
                    textDirection: TextDirection.rtl,
                    style: const TextStyle(
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
                    return InkWell(
                      onTap: () async {
                        downloadFile(lectureFiles[index], '-');
                      },
                      child: fileColumn(index + 1),
                    );
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
