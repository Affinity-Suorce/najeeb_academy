import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:intl/intl.dart';
import 'package:najeeb_academy/app/constants/orientation.dart';
import 'package:najeeb_academy/app/di.dart';
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
    Future.delayed(
      const Duration(milliseconds: 200),
      () => FlutterNativeSplash.remove(),
    );
  }

  const NajeebAcademyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: _Theme.theme,
      darkTheme: _Theme.darkTheme,
      locale: _Localization.locale,
      localizationsDelegates: _Localization.localizationsDelegates,
      supportedLocales: _Localization.supportedLocales,
      scrollBehavior: _Theme.scrollBehavior,
      routerDelegate: DI.router.delegate(),
      routeInformationParser: DI.router.defaultRouteParser(),
    );
  }
}
