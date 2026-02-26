import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color primary = Color(0xFF13EC25);
  static const Color primaryDark = Color(0xFF0C9D19);
  static const Color background = Color(0xFFF8FBF8);
  static const Color surface = Colors.white;
  static const Color textMain = Color(0xFF1A1A1A);
  static const Color textSecondary = Color(0xFF757575);
  static const Color accent = Color(0xFFE8F5E9);
  static const Color error = Color(0xFFE53935);
  static const Color warning = Color(0xFFFFA000);
}

class AppTextStyles {
  static TextStyle get h1 => GoogleFonts.lexend(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textMain,
  );

  static TextStyle get h2 => GoogleFonts.lexend(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.textMain,
  );

  static TextStyle get bodyLarge => GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.textMain,
  );

  static TextStyle get bodyMedium =>
      GoogleFonts.inter(fontSize: 14, color: AppColors.textMain);

  static TextStyle get caption =>
      GoogleFonts.inter(fontSize: 12, color: AppColors.textSecondary);
}

ThemeData appTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.primary,
    primary: AppColors.primary,
    onPrimary: Colors.white,
    surface: AppColors.surface,
    onSurface: AppColors.textMain,
  ),
  scaffoldBackgroundColor: AppColors.background,
  textTheme: GoogleFonts.interTextTheme().copyWith(
    displayLarge: AppTextStyles.h1,
    headlineMedium: AppTextStyles.h2,
    bodyLarge: AppTextStyles.bodyLarge,
    bodyMedium: AppTextStyles.bodyMedium,
  ),
  cardTheme: CardThemeData(
    color: AppColors.surface,
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  ),
);
