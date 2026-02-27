import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  // Slate Color Scale (shadcn/ui exact colors)
  static const _slate50 = Color(0xFFF8FAFC);
  static const _slate100 = Color(0xFFF1F5F9);
  static const _slate200 = Color(0xFFE2E8F0);
  static const _slate400 = Color(0xFF94A3B8);
  static const _slate500 = Color(0xFF64748B);
  static const _slate700 = Color(0xFF334155);
  static const _slate800 = Color(0xFF1E293B);
  static const _slate900 = Color(0xFF0F172A);
  static const _slate950 = Color(0xFF020817);

  // Light Theme
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.light(
        primary: _slate900,
        onPrimary: _slate50,
        primaryContainer: _slate100,
        onPrimaryContainer: _slate900,
        secondary: _slate100,
        onSecondary: _slate900,
        surface: Colors.white,
        onSurface: _slate950,
        surfaceContainerHighest: _slate100,
        onSurfaceVariant: _slate500,
        outline: _slate200,
      ),
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: _slate950,
        surfaceTintColor: Colors.transparent,
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: _slate200, width: 1),
        ),
        color: Colors.white,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: _slate200),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: _slate200),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: _slate900, width: 1),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _slate900,
          foregroundColor: _slate50,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: _slate900,
        ),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: _slate900,
        circularTrackColor: _slate200,
        linearTrackColor: _slate200,
      ),
    );
  }

  // Dark Theme
  static ThemeData get dark {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(
        primary: _slate50,
        onPrimary: _slate950,
        primaryContainer: _slate800,
        onPrimaryContainer: _slate50,
        secondary: _slate800,
        onSecondary: _slate50,
        surface: _slate950,
        onSurface: _slate50,
        surfaceContainerHighest: _slate800,
        onSurfaceVariant: _slate400,
        outline: _slate800,
      ),
      scaffoldBackgroundColor: _slate950,
      appBarTheme: const AppBarTheme(
        centerTitle: false,
        elevation: 0,
        backgroundColor: _slate950,
        foregroundColor: _slate50,
        surfaceTintColor: Colors.transparent,
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: _slate800, width: 1),
        ),
        color: _slate950,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: _slate950,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: _slate800),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: _slate800),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: _slate50, width: 1),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _slate50,
          foregroundColor: _slate950,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: _slate50,
        ),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: _slate50,
        circularTrackColor: _slate700,
        linearTrackColor: _slate700,
      ),
    );
  }
}
