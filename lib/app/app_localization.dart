part of 'app.dart';

abstract class _Localization {
  static const _localeName = 'ar';
  static const locale = Locale(_localeName);
  static const localizationsDelegates = [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];
  static const supportedLocales = [
    locale,
  ];

  static void initLocalization() {
    Intl.defaultLocale = _localeName;
    timeago.setLocaleMessages(_localeName, timeago.ArMessages());
    timeago.setDefaultLocale(_localeName);
  }
}
