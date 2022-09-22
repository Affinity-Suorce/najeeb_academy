import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:najeeb_academy/app/router/app_router.dart';
import 'package:najeeb_academy/features/courses/data/courses_data_source.dart';
import 'package:najeeb_academy/features/courses/data/courses_repositories.dart';
import 'package:najeeb_academy/features/courses/presentation/cubit/courses_cubit.dart';

abstract class DI {
  static GetIt get _ => GetIt.instance;

  static Future<void> init() async {
    _.registerLazySingleton<AppRouter>(() => AppRouter());
    _.registerLazySingleton<Client>(() => Client());
    registerCourses();
  }

  static void registerCourses() {
    _.registerLazySingleton<CoursesDataSource>(
        () => CoursesDataSource(_<Client>()));
    _.registerLazySingleton<CoursesRepositories>(
        () => CoursesRepositories(_<CoursesDataSource>()));
    _.registerFactory<CoursesCubit>(
        () => CoursesCubit(_<CoursesRepositories>()));
  }

  static AppRouter get router => _.get<AppRouter>();
}
