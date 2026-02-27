import 'package:flutter/material.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    cardTheme: const CardThemeData(
      surfaceTintColor: Colors.transparent,
      color: Colors.white,
      elevation: 2,
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue,
      primary: const Color.fromARGB(255, 232, 232, 236),
      surface: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 188, 192, 195),
      foregroundColor: Colors.white,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black, fontSize: 18),
      bodyMedium: TextStyle(color: Colors.black87),
    ),
  );

  static final darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: Colors.blueAccent,
      surface: Color(0xFF121212),
      onSurface: Colors.white,
    ),
    cardTheme: const CardThemeData(
      surfaceTintColor: Colors.transparent,
      color: Color(0xFF1E1E1E),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1E1E1E),
      foregroundColor: Colors.white,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white, fontSize: 18),
      bodyMedium: TextStyle(color: Colors.white70),
    ),
  );
}