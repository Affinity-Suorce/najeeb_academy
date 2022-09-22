import 'dart:convert';

import 'package:http/http.dart';
import 'package:najeeb_academy/core/error/excpetions.dart';
import 'package:najeeb_academy/core/helpers/funcs.dart';

Future<T> dataSource<T>(Function call, Function model, {bool? isAllCourses}) async {
  final response = await call();
  print(response.statusCode);
  var jsonResponse = json.decode(response.body);
  if (response.statusCode == 200) {
    return isAllCourses != null ? model(response.body, isAllCourses) : model(response.body);
  } else {
    throw HttpException(getResponseMessage(jsonResponse));
  }
}
