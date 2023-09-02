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
import 'package:najeeb_academy/features/courses/services/course_service.dart';
import 'package:najeeb_academy/features/courses/services/create_classes_order_service.dart';
import 'package:najeeb_academy/features/home/bloc/home_bloc.dart';
import 'package:najeeb_academy/features/home/services/get_number_of_views_repository_and_dataBase.dart';
import 'package:najeeb_academy/features/home/services/schedule_service.dart';
import 'package:najeeb_academy/features/lectures/services/lectures_service.dart';
import 'package:najeeb_academy/features/notifications/services/notifications_service.dart';
import 'package:najeeb_academy/features/payment/services/payments_service.dart';
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
    di.registerFactory<LoginFormService>(() => LoginFormService(userInfo));
    di.registerFactory<RegisterFormService>(() => RegisterFormService(api));
    di.registerFactory<WelcomeService>(() => WelcomeService(preferences, userInfo));
    di.registerFactory<NotificationsService>(() => NotificationsService(api));
    di.registerFactory<ScheduleService>(() => ScheduleService(api));
    // di.registerFactory<LectureServices>(() => LectureServices());
    di.registerFactory<PaymentsService>(() => PaymentsService(api));
    di.registerFactory<CreateClassedOrderService>(() => CreateClassedOrderService(api));
    di.registerSingleton<AppRouter>(AppRouter());
    di.registerSingleton<UserInfoRepository>(userInfo);
    di.registerLazySingleton<CoursesServices>(() => CoursesServices(),);
    di.registerLazySingleton<LectureServices>(() => LectureServices(preferences),);

    di.registerSingleton<UserInfoService>(UserInfoService(api, userInfo));
    di.registerLazySingleton<Client>(() => Client());
    di.registerLazySingleton<BaseDataSource<int,GetNumberOfViewsEvent>>(() => GetNumberOfViewsDataSource());
    di.registerLazySingleton<BaseDataSource<String,SetNumberOfViewsEvent>>(() => SetNumberOfViewsDataSource());
    di.registerLazySingleton<BaseRepositoryGetNumberOfViews<int,GetNumberOfViewsEvent>>(() => GetNumberOfViewsRepository(getNumberOfViewsDataSource));
    di.registerLazySingleton<BaseRepositorySetNumberOfViews<String,SetNumberOfViewsEvent>>(() => SetNumberOfViewsRepository(setNumberOfViewsDataSource));
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


  static BaseDataSource<int,GetNumberOfViewsEvent> get getNumberOfViewsDataSource => di.get<BaseDataSource<int,GetNumberOfViewsEvent>>();
  static BaseDataSource<String,SetNumberOfViewsEvent> get setNumberOfViewsDataSource => di.get<BaseDataSource<String,SetNumberOfViewsEvent>>();
  static BaseRepositoryGetNumberOfViews<int,GetNumberOfViewsEvent> get getNumberOfViewsRepository => di.get<BaseRepositoryGetNumberOfViews<int,GetNumberOfViewsEvent>>();
  static BaseRepositorySetNumberOfViews<String,SetNumberOfViewsEvent> get setNumberOfViewsRepository => di.get<BaseRepositorySetNumberOfViews<String,SetNumberOfViewsEvent>>();
  static AppRouter get router => di.get<AppRouter>();
  static CoursesServices get coursesServices => di.get<CoursesServices>();
  static LectureServices get lectureServices => di.get<LectureServices>();
  static UserInfoRepository get userInfo => di.get<UserInfoRepository>();
  static UserInfoService get userInfoService => di.get<UserInfoService>();
  static LoginFormService loginFormServiceFactory() =>
      di.get<LoginFormService>();
  static RegisterFormService registerFormServiceFactory() =>
      di.get<RegisterFormService>();
  static WelcomeService welcomeServiceFactory() => di.get<WelcomeService>();
  static NotificationsService notificationsServiceFactory() => di.get<NotificationsService>();
  static ScheduleService scheduleServiceFactory() => di.get<ScheduleService>();
  // static LectureServices lectureServiceFactory() => di.get<LectureServices>();
  static PaymentsService paymentsServiceFactory() => di.get<PaymentsService>();
  static CreateClassedOrderService createClassedOrderServiceFactory() => di.get<CreateClassedOrderService>();
}
