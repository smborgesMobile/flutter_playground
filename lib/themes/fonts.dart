import 'package:flutter/material.dart';
import 'package:flutter_playground/themes/bank_theme.dart';

class AppTypography {
  AppTypography._();

  /// Primary font family for the app. Adjust if you add a custom font.
  /// If you add custom fonts in assets, remember to configure pubspec.yaml.
  static const String fontFamily = 'Roboto';

  /// Base text theme aligned with our color palette.
  static final TextTheme textTheme = TextTheme(
    displayLarge: _base.copyWith(fontSize: 57, fontWeight: FontWeight.w400),
    displayMedium: _base.copyWith(fontSize: 45, fontWeight: FontWeight.w400),
    displaySmall: _base.copyWith(fontSize: 36, fontWeight: FontWeight.w400),

    headlineLarge: _base.copyWith(fontSize: 32, fontWeight: FontWeight.w600),
    headlineMedium: _base.copyWith(fontSize: 28, fontWeight: FontWeight.w600),
    headlineSmall: _base.copyWith(fontSize: 24, fontWeight: FontWeight.w600),

    titleLarge: _base.copyWith(fontSize: 20, fontWeight: FontWeight.w600),
    titleMedium: _base.copyWith(fontSize: 16, fontWeight: FontWeight.w600),
    titleSmall: _base.copyWith(fontSize: 14, fontWeight: FontWeight.w600),

    bodyLarge: _base.copyWith(fontSize: 16, fontWeight: FontWeight.w400),
    bodyMedium: _base.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.textSecondary,
    ),
    bodySmall: _base.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColors.textHint,
    ),

    labelLarge: _base.copyWith(fontSize: 14, fontWeight: FontWeight.w600),
    labelMedium: _base.copyWith(fontSize: 12, fontWeight: FontWeight.w600),
    labelSmall: _base.copyWith(fontSize: 11, fontWeight: FontWeight.w600),
  );

  static const TextStyle _base = TextStyle(
    color: Color.fromARGB(255, 1, 2, 2),
    height: 1.2,
  );

  static const TextStyle onPrimaryTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const TextStyle buttonTitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const TextStyle regular = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: Colors.white,
  );

  static const TextStyle header = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  // --- Expense item specific styles ---
  static const TextStyle expenseTitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400, // regular
    color: Colors.black,
  );

  static const TextStyle expenseSubtitle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w700, // bold
    color: Color(0xFFA8A8A8),
  );

  static const TextStyle amountCredit = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: Color(0xFF5AE677),
  );

  static const TextStyle amountDebit = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: Color(0xFFF24E30),
  );

  static const TextStyle expenseTime = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400, // regular
    color: AppColors.textSecondary,
  );

  // --- Promotion item specific styles ---
  static const TextStyle promotionTitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400, // regular
    color: Colors.black,
  );

  static const TextStyle promotionButton = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w700, // bold
    color: Colors.black,
  );

  static const TextStyle linkButtonText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold, // bold
    color: AppColors.primary,
  );
}
