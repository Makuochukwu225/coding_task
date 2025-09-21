import '../src.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Aeonik',
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryButton,
    ).copyWith(secondary: AppColors.secondaryButton),
  );
}
