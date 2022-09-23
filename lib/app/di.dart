import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:najeeb_academy/app/router/app_router.dart';
import 'package:najeeb_academy/features/courses/data/courses_data_source.dart';
import 'package:najeeb_academy/features/courses/data/courses_repositories.dart';
import 'package:najeeb_academy/features/courses/presentation/cubit/courses_cubit.dart';

abstract class DI {
  static GetIt get di => GetIt.instance;

  static Future<void> init() async {
    di.registerLazySingleton<AppRouter>(() => AppRouter());
    di.registerLazySingleton<Client>(() => Client());
    registerCourses();
  }

  static void registerCourses() {
    di.registerLazySingleton<CoursesDataSource>(
        () => CoursesDataSource(di<Client>()));
    di.registerLazySingleton<CoursesRepositories>(
        () => CoursesRepositories(di<CoursesDataSource>()));
    di.registerFactory<CoursesCubit>(
        () => CoursesCubit(di<CoursesRepositories>()));
  }

  static AppRouter get router => di.get<AppRouter>();
}
