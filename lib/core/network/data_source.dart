import 'dart:convert';

import 'package:najeeb_academy/core/error/excpetions.dart';
import 'package:najeeb_academy/core/helpers/funcs.dart';

Future<T> dataSource<T>(Function call, Function model,
    {bool? isAllCourses}) async {
  final response = await call();
  print("${response.statusCode} isallCourses: $isAllCourses");
  print("responseIs: [${response.body}]");
  var jsonResponse = json.decode(response.body);
  if (response.statusCode == 200) {
    if (isAllCourses == null) {
      return model(response.body);
    }
    return model(response.body, isAllCourses);
  } else {
    throw HttpException(getResponseMessage(jsonResponse));
  }
}
