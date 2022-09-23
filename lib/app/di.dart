import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:najeeb_academy/app/router/app_router.dart';
import 'package:najeeb_academy/features/auth/repositories/user_info_repository.dart';
import 'package:najeeb_academy/features/auth/services/login_form_services.dart';
import 'package:najeeb_academy/features/auth/services/register_form_services.dart';
import 'package:najeeb_academy/features/courses/data/courses_data_source.dart';
import 'package:najeeb_academy/features/courses/data/courses_repositories.dart';
import 'package:najeeb_academy/features/courses/presentation/cubit/courses_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class DI {
  static GetIt get di => GetIt.instance;

  static Future<void> init() async {
    final preferences = await SharedPreferences.getInstance();
    final userInfo = UserInfoRepository(preferences);

    final token = userInfo.token;
    final api = Dio(
      BaseOptions(
        headers: {
          if (token != null) 'Authorization': 'Bearer $token',
        },
      ),
    );
    di.registerFactory<LoginFormService>(() => LoginFormService(api));
    di.registerFactory<RegisterFormService>(() => RegisterFormService(api));
    di.registerSingleton<AppRouter>(AppRouter());
    di.registerLazySingleton<Client>(() => Client());
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
  static LoginFormService loginFormServiceFactory() => di.get<LoginFormService>();
  static RegisterFormService registerFormServiceFactory() => di.get<RegisterFormService>();
}
