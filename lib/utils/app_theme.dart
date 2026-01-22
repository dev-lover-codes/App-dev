import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Colors
  static const Color background = Color(0xFF0F172A); // Dark Slate
  static const Color surface = Color(0xFF1E293B);
  static const Color primary = Color(0xFF06B6D4); // Cyan
  static const Color secondary = Color(0xFFD946EF); // Fuchsia
  static const Color accent = Color(0xFF8B5CF6); // Violet
  static const Color text = Color(0xFFF8FAFC);
  static const Color textSecondary = Color(0xFF94A3B8);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF06B6D4), Color(0xFF3B82F6)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient secondaryGradient = LinearGradient(
    colors: [Color(0xFFD946EF), Color(0xFF8B5CF6)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const List<Color> glowColors = [
    Color(0xFF06B6D4),
    Color(0xFFD946EF),
    Color(0xFF8B5CF6),
  ];

  // Text Styles
  static TextStyle get titleStyle => GoogleFonts.outfit(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: text,
    shadows: [
      Shadow(
        color: primary.withOpacity(0.5),
        blurRadius: 10,
        offset: const Offset(0, 2),
      ),
    ],
  );

  static TextStyle get headingStyle => GoogleFonts.outfit(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: text,
  );

  static TextStyle get bodyStyle =>
      GoogleFonts.inter(fontSize: 16, color: textSecondary);

  static TextStyle get buttonTextStyle => GoogleFonts.outfit(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
}
