import 'dart:io';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';


Future<String> getFileFromUrl(String url, {name}) async {
  var fileName = 'najeeb_file';
  if (name != null) {
    fileName = name + ' pdf';
  }
  try {
    var data = await http.get(Uri.parse(url));
    var bytes = data.bodyBytes;
    var dir = await getExternalStorageDirectory();
    String filePath = "${dir!.path}/" + fileName + ".pdf";
    File file = File(filePath);
    debugPrint(dir.path);
    File urlFile = await file.writeAsBytes(bytes);
    return urlFile.path;
  } catch (e) {
    throw Exception("Error opening url file${e.toString()}");
  }
}

Future<bool> requestPermission() async {
  return await Permission.storage.request().isGranted;
}
