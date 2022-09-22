import 'package:http/http.dart';
import 'package:najeeb_academy/core/network/data_source.dart';
import 'package:najeeb_academy/core/network/urls.dart';
import 'package:najeeb_academy/features/courses/data/models/course_model.dart';

class CoursesDataSource {
  final Client _client;
  CoursesDataSource(this._client);
  Future<CourseModel> getMyCourses(bool isAllCourses) async {
    return dataSource(
      () => _client.get(
        Uri.parse(isAllCourses ? allCoursesUrl : myCoursesUrl),
        headers: {
          'Authorization': 'Bearer Jr6mCmJEvJh9ihk01SlmqrRkUOcZ4uDeiP0UHXsywg6CIRaUl7VXnsAO1n2sk9nj6dLQuJnrP91ViNEU'
        },
      ),
      courseModelFromJson,
      isAllCourses: isAllCourses,
    );
  }
}
