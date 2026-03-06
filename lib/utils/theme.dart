import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Dark background #0A0A0F
  static const Color darkBackground = Color(0xFF0A0A0F);
  // Electric teal #00E5CC
  static const Color electricTeal = Color(0xFF00E5CC);
  // Dark surface for cards and bubbles
  static const Color darkSurface = Color(0xFF16161C);
  // Light text
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFA0A0AB);

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: darkBackground,
      primaryColor: electricTeal,
      colorScheme: const ColorScheme.dark(
        primary: electricTeal,
        secondary: electricTeal,
        surface: darkSurface,
      ),
      textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme).copyWith(
        bodyLarge: GoogleFonts.inter(color: textPrimary, fontSize: 16),
        bodyMedium: GoogleFonts.inter(color: textPrimary, fontSize: 14),
        titleLarge: GoogleFonts.inter(color: textPrimary, fontSize: 22, fontWeight: FontWeight.bold),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: darkBackground,
        elevation: 0,
        centerTitle: false,
        iconTheme: IconThemeData(color: textPrimary),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: electricTeal,
        foregroundColor: darkBackground,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: electricTeal,
          foregroundColor: darkBackground,
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: darkSurface,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: electricTeal, width: 2),
        ),
        hintStyle: const TextStyle(color: textSecondary),
      ),
    );
  }
}
