import '../src.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Aeonik',
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryButton)
        .copyWith(
          brightness: Brightness.light,
          primary: AppColors.primaryButton,
          onPrimary: AppColors.background,
          secondary: AppColors.secondaryButton,
          onSecondary: AppColors.background,
          surface: AppColors.background,
          onSurface: AppColors.textPrimary,
          onTertiary: AppColors.textPurple,
          error: Color(0xFFE53E3E),
          onError: AppColors.background,
          outline: AppColors.borderColor,
          inversePrimary: AppColors.iconPurple,
        ),
  );
}
