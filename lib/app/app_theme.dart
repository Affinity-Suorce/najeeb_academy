part of 'app.dart';

abstract class _Theme {
  static const _buttonPadding =
      EdgeInsets.symmetric(vertical: 12, horizontal: 32);
  static final _buttonShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16),
  );

  static const _inputPadding =
      EdgeInsets.symmetric(vertical: 12, horizontal: 16);
  static final _inputBorderRadius = BorderRadius.circular(16);
  static final _cardTheme = CardTheme(
    clipBehavior: Clip.antiAliasWithSaveLayer,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
  );
  static const _bottomSheetTheme = BottomSheetThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(16),
      ),
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
  );
  static ThemeData get theme {
    return ThemeData(
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
      cardTheme: _cardTheme,
      bottomSheetTheme: _bottomSheetTheme,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      backgroundColor: AppColors.purple900,
      scaffoldBackgroundColor: AppColors.purple900,
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: AppColors.indigo,
        onPrimary: AppColors.white,
        secondary: AppColors.indigo,
        onSecondary: AppColors.white,
        error: AppColors.red600,
        onError: AppColors.white,
        background: AppColors.purple900,
        onBackground: AppColors.white,
        surface: AppColors.purple800,
        onSurface: AppColors.white,
      ),
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.purple900,
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
          primary: AppColors.white,
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
        fillColor: AppColors.purple400,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: _inputBorderRadius,
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: _inputBorderRadius,
          borderSide: const BorderSide(
            width: 0.5,
            color: AppColors.indigo,
          ),
        ),
        contentPadding: _inputPadding,
      ),
      cardTheme: _cardTheme,
      bottomSheetTheme: _bottomSheetTheme,
      brightness: Brightness.dark,
    );
  }

  static const scrollBehavior = CupertinoScrollBehavior();
}
