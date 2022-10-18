import 'dart:io';

import 'package:dio/dio.dart';
// import 'package:path_provider/path_provider.dart';

Future<File?> downloadFile(String url, String fileName) async {
  // final appStorage = await getApplicationDocumentsDirectory();
  final file = File("/storage/emulated/0/Download/$fileName");
  try {
    final response = await Dio().get(url,
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            receiveTimeout: 0));
    final raf = file.openSync(mode: FileMode.write);
    raf.writeFromSync(response.data);
    await raf.close();
    return file;
  } catch (e) {
    return null;
  }
}
