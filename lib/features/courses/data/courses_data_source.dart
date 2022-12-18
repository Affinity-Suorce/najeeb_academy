import 'package:flutter/rendering.dart';
import 'package:http/http.dart';
import 'package:najeeb_academy/app/di.dart';
import 'package:najeeb_academy/core/network/data_source.dart';
import 'package:najeeb_academy/core/network/urls.dart';
import 'package:najeeb_academy/features/courses/data/models/course_model.dart';

class CoursesDataSource {
  final Client _client;
  CoursesDataSource(this._client);
  Future<List<CourseModel>> getMyCourses(bool isAllCourses) async {
    debugPrint(DI.userInfo.token);
    return dataSource(
      () => _client.get(
        Uri.parse(isAllCourses ? allCoursesUrl : myCoursesUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${DI.userInfo.token}'
        },
      ),
      courseModelFromJson,
    );
  }
}
