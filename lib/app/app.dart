import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:najeeb_academy/app/constants/assets.dart';
import 'package:najeeb_academy/app/constants/orientation.dart';
import 'package:najeeb_academy/app/di.dart';
import 'package:najeeb_academy/app/router/app_router.dart';
import 'package:najeeb_academy/app/widgets/fixed_scale_text_widget.dart';
import 'package:najeeb_academy/features/courses/presentation/cubit/courses_cubit.dart';
import 'package:najeeb_academy/features/video_player/presentation/cubit/video_cubit.dart';
import 'package:najeeb_academy/features/welcome/services/welcome_service.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'constants/colors.dart';

part 'app_localization.dart';
part 'app_theme.dart';

class NajeebAcademyApp extends StatelessWidget {
  static Future<void> init() async {
    FlutterNativeSplash.preserve(
        widgetsBinding: WidgetsFlutterBinding.ensureInitialized());

    _Localization.initLocalization();
    await DI.init();
    await SystemChrome.setPreferredOrientations(
        AppOrientation.defaultOrientation);
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual);
    Future.delayed(
      const Duration(milliseconds: 500),
      () => FlutterNativeSplash.remove(),
    );
  }

  const NajeebAcademyApp({Key? key}) : super(key: key);

  List<PageRouteInfo<dynamic>> _getInitialRoutes(
      WelcomeService welcomeService) {
    switch (welcomeService.userState) {
      case UserState.firstTime:
        return [WelcomeRoute(service: welcomeService)];

      case UserState.authenticated:
        return [const MainRoute()];
      case UserState.guest:
        return [WelcomeRoute(lastPage: true, service: welcomeService)];
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => DI.di<CoursesCubit>(),
          ),
          BlocProvider(
            create: (_) => DI.di<VideoCubit>(),
          ),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: _Theme.theme,
          locale: _Localization.locale,
          localizationsDelegates: _Localization.localizationsDelegates,
          supportedLocales: _Localization.supportedLocales,
          scrollBehavior: _Theme.scrollBehavior,
          routerDelegate: DI.router.delegate(
              initialRoutes: _getInitialRoutes(DI.welcomeServiceFactory())),
          routeInformationParser: DI.router.defaultRouteParser(),
          //make text size independent from user text scale settings
          builder: (context, child) => child == null
              ? const SizedBox.shrink()
              : FixedScaleTextWidget(child: child),
        ),
      ),
    );
  }
}
