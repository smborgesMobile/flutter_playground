import 'package:flutter/material.dart';

class AppColors {
  AppColors._(); // prevent instantiation

  // Primary brand color (use as main color for app bars, buttons)
  static const Color primary = Color(0xFF0055FF); // vivid blue
  static const Color primaryVariant = Color(0xFF0041CC);

  // Accent / secondary color
  static const Color accent = Color(0xFF00C4A7); // teal/greenish
  static const Color accentVariant = Color(0xFF00A187);

  // Backgrounds & surfaces
  static const Color background = Color.fromARGB(255, 255, 255, 255); // light neutral
  static const Color surface = Color(0xFFFFFFFF);

  // Greys / neutrals
  static const Color neutral900 = Color(0xFF0D1B2A);
  static const Color neutral800 = Color(0xFF1B2A3B);
  static const Color neutral700 = Color(0xFF2A3B4C);
  static const Color neutral600 = Color(0xFF3B4C5D);
  static const Color neutral500 = Color(0xFF6B7C8D);
  static const Color neutral400 = Color(0xFF9AA9B8);
  static const Color neutral300 = Color(0xFFCAD6E0);
  static const Color neutral200 = Color(0xFFE9F0F6);
  static const Color neutral100 = Color(0xFFF6F8FB);

  // Text colors
  static const Color textPrimary = neutral900;
  static const Color textSecondary = neutral600;
  static const Color textHint = neutral400;

  // Status colors
  static const Color success = Color(0xFF22C55E);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);

  // Divider / stroke
  static const Color divider = Color(0xFFE6EDF5);

  static MaterialColor createMaterialColor(Color color) {
    final strengths = <double>[.05];
    final swatch = <int, Color>{};
    // New color component accessors: r/g/b are doubles in [0,1].
    // Convert to 8-bit ints when needed.
    final int r = (color.r * 255.0).round() & 0xff;
    final int g = (color.g * 255.0).round() & 0xff;
    final int b = (color.b * 255.0).round() & 0xff;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }

    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }

    // Avoid deprecated `value` getter; use explicit 32-bit ARGB conversion.
    return MaterialColor(color.toARGB32(), swatch);
  }
}
