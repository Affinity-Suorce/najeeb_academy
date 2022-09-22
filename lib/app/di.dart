import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:najeeb_academy/app/router/app_router.dart';

abstract class DI {
  static GetIt get _ => GetIt.instance;

  static Future<void> init() async {
    _.registerLazySingleton(() => AppRouter());
    _.registerLazySingleton<Client>(() => Client());
  }

  static AppRouter get router => _.get<AppRouter>();
}
