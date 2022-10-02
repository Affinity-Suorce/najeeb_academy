import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:najeeb_academy/app/router/app_router.dart';
import 'package:najeeb_academy/features/auth/helpers/auth_interceptors.dart';
import 'package:najeeb_academy/features/auth/repositories/user_info_repository.dart';
import 'package:najeeb_academy/features/auth/services/login_form_services.dart';
import 'package:najeeb_academy/features/auth/services/register_form_services.dart';
import 'package:najeeb_academy/features/auth/services/user_info_service.dart';
import 'package:najeeb_academy/features/courses/data/courses_data_source.dart';
import 'package:najeeb_academy/features/courses/data/courses_repositories.dart';
import 'package:najeeb_academy/features/courses/presentation/cubit/courses_cubit.dart';
import 'package:najeeb_academy/features/notifications/services/notifications_service.dart';
import 'package:najeeb_academy/features/video_player/data/video_data_source.dart';
import 'package:najeeb_academy/features/video_player/data/video_repository.dart';
import 'package:najeeb_academy/features/video_player/presentation/cubit/video_cubit.dart';
import 'package:najeeb_academy/features/welcome/services/welcome_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class DI {
  static GetIt get di => GetIt.instance;

  static Future<void> init() async {
    final preferences = await SharedPreferences.getInstance();
    final userInfo = UserInfoRepository(preferences);

    final api = Dio()..interceptors.add(AuthInterceptor(userInfo));
    di.registerFactory<LoginFormService>(() => LoginFormService(api, userInfo));
    di.registerFactory<RegisterFormService>(() => RegisterFormService(api));
    di.registerFactory<WelcomeService>(
        () => WelcomeService(preferences, userInfo));
    di.registerFactory<NotificationsService>(() => NotificationsService(api));
    di.registerSingleton<AppRouter>(AppRouter());
    di.registerSingleton<UserInfoRepository>(userInfo);
    di.registerSingleton<UserInfoService>(UserInfoService(api, userInfo));
    di.registerLazySingleton<Client>(() => Client());
    registerCourses();
    registerVideo();
  }

  static void registerCourses() {
    di.registerLazySingleton<CoursesDataSource>(
        () => CoursesDataSource(di<Client>()));
    di.registerLazySingleton<CoursesRepositories>(
        () => CoursesRepositories(di<CoursesDataSource>()));
    di.registerFactory<CoursesCubit>(
        () => CoursesCubit(di<CoursesRepositories>()));
  }

  static void registerVideo() {
    di.registerLazySingleton<VideoDataSource>(
        () => VideoDataSource(di<Client>()));
    di.registerLazySingleton<VideoRepositories>(
        () => VideoRepositories(di<VideoDataSource>()));
    di.registerFactory<VideoCubit>(() => VideoCubit(di<VideoRepositories>()));
  }

  static AppRouter get router => di.get<AppRouter>();
  static UserInfoRepository get userInfo => di.get<UserInfoRepository>();
  static UserInfoService get userInfoService => di.get<UserInfoService>();
  static LoginFormService loginFormServiceFactory() =>
      di.get<LoginFormService>();
  static RegisterFormService registerFormServiceFactory() =>
      di.get<RegisterFormService>();
  static WelcomeService welcomeServiceFactory() => di.get<WelcomeService>();
  static NotificationsService notificationsServiceFactory() =>
      di.get<NotificationsService>();
}
