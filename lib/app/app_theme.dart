part of 'app.dart';

abstract class _Theme {
  static final _buttonPadding =
      EdgeInsets.symmetric(vertical: 12.h, horizontal: 32.w);
  static final _buttonShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16.r),
  );

  static final _inputPadding =
      EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w);
  static final _inputBorderRadius = BorderRadius.circular(16);
  static final _cardTheme = CardTheme(
    clipBehavior: Clip.antiAliasWithSaveLayer,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16.r),
    ),
  );
  static final _bottomSheetTheme = BottomSheetThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(16.r),
      ),
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
  );
  static ThemeData get theme {
    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      fontFamily: Assets.fonts.janna,
      backgroundColor: AppColors.white,
      scaffoldBackgroundColor: AppColors.white,
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.indigo,
        onPrimary: AppColors.white,
        secondary: AppColors.indigo,
        onSecondary: AppColors.white,
        error: AppColors.red900,
        onError: AppColors.white,
        background: AppColors.white,
        onBackground: AppColors.purple900,
        surface: AppColors.white,
        onSurface: AppColors.purple900,
      ),
      appBarTheme: const AppBarTheme(
        foregroundColor: AppColors.purple900,
        backgroundColor: AppColors.white,
        elevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: _buttonPadding,
          shape: _buttonShape,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          padding: _buttonPadding,
          shape: _buttonShape,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          padding: _buttonPadding,
          shape: _buttonShape,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: _inputBorderRadius,
          borderSide: const BorderSide(
            width: 1,
            color: AppColors.purple900,
          ),
        ),
        contentPadding: _inputPadding,
      ),
      textTheme: const TextTheme().apply(fontSizeFactor: 1.sp),
      cardTheme: _cardTheme,
      bottomSheetTheme: _bottomSheetTheme,
    );
  }

  static const scrollBehavior = CupertinoScrollBehavior();
}
