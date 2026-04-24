import 'package:flutter/material.dart';

class AppColors {
  // Light theme colors
  static const Color primary = Color(0xFFE53935);
  static const Color primaryLight = Color(0xFFEF5350);
  static const Color primaryDark = Color(0xFFC62828);
  static const Color accent = Color(0xFFFF7043);
  static const Color star = Color(0xFFFFB300);
  static const Color heart = Color(0xFFE53935);
  static const Color mastercard = Color(0xFFEB001B);
  static const Color visa = Color(0xFF1A1F71);

  // Gradient for splash screen
  static const LinearGradient splashGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFFF48FB1), Color(0xFFEF5350), Color(0xFFE53935)],
  );

  // Category chip colors
  static const Color chipActive = Color(0xFFE53935);

  // ─── Theme-aware getters ───
  static Color background(BuildContext context) =>
    Theme.of(context).brightness == Brightness.dark ? const Color(0xFF121212) : const Color(0xFFF5F5F5);

  static Color surface(BuildContext context) =>
    Theme.of(context).brightness == Brightness.dark ? const Color(0xFF1E1E1E) : Colors.white;

  static Color cardBg(BuildContext context) =>
    Theme.of(context).brightness == Brightness.dark ? const Color(0xFF2A2A2A) : Colors.white;

  static Color textPrimary(BuildContext context) =>
    Theme.of(context).brightness == Brightness.dark ? const Color(0xFFE0E0E0) : const Color(0xFF212121);

  static Color textSecondary(BuildContext context) =>
    Theme.of(context).brightness == Brightness.dark ? const Color(0xFF9E9E9E) : const Color(0xFF757575);

  static Color textHint(BuildContext context) =>
    Theme.of(context).brightness == Brightness.dark ? const Color(0xFF616161) : const Color(0xFFBDBDBD);

  static Color divider(BuildContext context) =>
    Theme.of(context).brightness == Brightness.dark ? const Color(0xFF333333) : const Color(0xFFEEEEEE);

  static Color darkBg(BuildContext context) =>
    Theme.of(context).brightness == Brightness.dark ? const Color(0xFF404040) : const Color(0xFF2C2C2C);

  static Color chipInactive(BuildContext context) =>
    Theme.of(context).brightness == Brightness.dark ? const Color(0xFF2A2A2A) : Colors.white;

  static Color chipBorder(BuildContext context) =>
    Theme.of(context).brightness == Brightness.dark ? const Color(0xFF444444) : const Color(0xFFE0E0E0);

  static Color inputFill(BuildContext context) =>
    Theme.of(context).brightness == Brightness.dark ? const Color(0xFF2A2A2A) : Colors.grey.shade100;

  static Color cardShadowColor(BuildContext context) =>
    Theme.of(context).brightness == Brightness.dark ? Colors.black26 : const Color(0x1A000000);

  static Color shimmerBase(BuildContext context) =>
    Theme.of(context).brightness == Brightness.dark ? const Color(0xFF333333) : Colors.grey[300]!;

  static Color shimmerHighlight(BuildContext context) =>
    Theme.of(context).brightness == Brightness.dark ? const Color(0xFF444444) : Colors.grey[100]!;

  static Color bottomBarBg(BuildContext context) =>
    Theme.of(context).brightness == Brightness.dark ? const Color(0xFF1E1E1E) : Colors.white;

  static Color iconColor(BuildContext context) =>
    Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black;
}

class AppShadows {
  static List<BoxShadow> cardShadow = [
    BoxShadow(color: const Color(0x1A000000), blurRadius: 12, offset: const Offset(0, 4)),
  ];

  static List<BoxShadow> softShadow = [
    BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 8, offset: const Offset(0, 2)),
  ];

  static List<BoxShadow> buttonShadow = [
    BoxShadow(color: AppColors.primary.withOpacity(0.3), blurRadius: 12, offset: const Offset(0, 4)),
  ];

  static List<BoxShadow> cardShadowDark(BuildContext context) => [
    BoxShadow(
      color: Theme.of(context).brightness == Brightness.dark
        ? Colors.black.withOpacity(0.3) : const Color(0x1A000000),
      blurRadius: 12, offset: const Offset(0, 4),
    ),
  ];

  static List<BoxShadow> softShadowDark(BuildContext context) => [
    BoxShadow(
      color: Theme.of(context).brightness == Brightness.dark
        ? Colors.black.withOpacity(0.2) : Colors.black.withOpacity(0.06),
      blurRadius: 8, offset: const Offset(0, 2),
    ),
  ];
}

class AppRadius {
  static const double small = 8;
  static const double medium = 12;
  static const double large = 16;
  static const double xlarge = 24;
  static const double round = 50;
}

// ThemeData builders
class AppThemeData {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary, brightness: Brightness.light),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary, brightness: Brightness.dark),
    scaffoldBackgroundColor: const Color(0xFF121212),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1E1E1E),
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
    ),
  );
}
