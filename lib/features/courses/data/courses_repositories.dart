import 'package:dartz/dartz.dart';
import 'package:najeeb_academy/core/error/failures.dart';
import 'package:najeeb_academy/core/network/repositories.dart';
import 'package:najeeb_academy/features/courses/data/courses_data_source.dart';
import 'package:najeeb_academy/features/courses/data/models/course_model.dart';

class CoursesRepositories {
  CoursesDataSource _coursesDataSource;
  CoursesRepositories(this._coursesDataSource);

  Future<Either<Failure, List<CourseModel>>> getMyCourses(bool isAllCourses) async =>
      await repository<List<CourseModel>>(
          () async => await _coursesDataSource.getMyCourses(isAllCourses));
}
