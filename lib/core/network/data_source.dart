import 'dart:convert';

import 'package:najeeb_academy/core/error/exceptions.dart';
import 'package:najeeb_academy/core/helpers/funcs.dart';

Future<T> dataSource<T>(Function call, Function model) async {
  final response = await call();
  var jsonResponse = json.decode(response.body);
  try {
    if (response.statusCode == 200) {
      return model(response.body);
    } else {
      throw HttpException(getResponseMessage(jsonResponse));
    }
  }catch(e){
    throw HttpException(getResponseMessage(jsonResponse));
  }
}
