import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light => ThemeData(
        brightness: Brightness.light,
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF1A237E),
          secondary: Color(0xFFBF360C),
          background: Color(0xFFF5F5F5),
          surface: Color(0xFFFFFFFF),
          tertiary: Color(0xFFFFD700),
        ),
        useMaterial3: true,
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontFamily: 'Kanit',
            fontWeight: FontWeight.bold,
          ),
          bodyLarge: TextStyle(fontFamily: 'Sarabun'),
        ),
      );

  static ThemeData get dark => ThemeData(
        brightness: Brightness.dark,
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF3949AB),
          secondary: Color(0xFFFF6E40),
          background: Color(0xFF1A1A2F),
          surface: Color(0xFF2C2C44),
          tertiary: Color(0xFFFFD700),
        ),
        useMaterial3: true,
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontFamily: 'Kanit',
            fontWeight: FontWeight.bold,
          ),
          bodyLarge: TextStyle(fontFamily: 'Sarabun'),
        ),
      );
}
