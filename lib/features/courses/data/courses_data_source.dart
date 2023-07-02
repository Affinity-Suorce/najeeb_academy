import 'package:http/http.dart';
import 'package:najeeb_academy/app/di.dart';
import 'package:najeeb_academy/core/network/data_source.dart';
import 'package:najeeb_academy/core/network/urls.dart';
import 'package:najeeb_academy/features/courses/data/models/course_model.dart';

class CoursesDataSource {
  final Client _client;
  CoursesDataSource(this._client);
  Future<List<CourseModel>> getMyCourses(bool isAllCourses) async {
    return await dataSource(
      () async {
        Response res = await _client.get(
        Uri.parse(isAllCourses ? (DI.userInfo.isAuthenticated ?  allCoursesUrl: guestCoursesUrl) : myCoursesUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${DI.userInfo.token}'
        },
      );
      return res;
      },
      courseModelFromJson,
    );
  }
}
