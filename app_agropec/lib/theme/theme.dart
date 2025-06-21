import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryGreen = Color(0xFF1A7335);
  static const Color lightGreen = Color(0xFFB9E4C9);
  static const Color yellow = Color(0xFFFFD700);
  static const Color brown = Color(0xFF8B4513);
  static const Color white = Color(0xFFFFFFFF);
  static const Color gray = Color(0xFFCCCCCC);
  static const Color but = Color.fromRGBO(0, 77, 30, 1);
  static const Color grand = Color.fromRGBO(30, 72, 68, 1);

  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color.fromRGBO(30, 72, 68, 1), Color.fromRGBO(125, 165, 72, 1)],
  );
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.primaryGreen,
      scaffoldBackgroundColor: AppColors.but, // Aqui é só uma cor base
      appBarTheme: const AppBarTheme(centerTitle: true, elevation: 2),
      textTheme: const TextTheme(
        titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(fontSize: 16),
        bodyMedium: TextStyle(fontSize: 14),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.yellow,
          foregroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.white,
        selectedItemColor: AppColors.primaryGreen,
        unselectedItemColor: AppColors.gray,
        showUnselectedLabels: true,
      ),
    );
  }
}
