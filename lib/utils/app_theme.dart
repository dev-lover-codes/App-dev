import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Dark minimalist colors (matching the reference design)
  static const Color background = Color(0xFF1A1A1A); // Very dark gray
  static const Color cardBackground = Color(0xFF2A2A2A); // Dark card
  static const Color surface = Color(0xFF242424); // Slightly lighter dark
  static const Color primary = Color(0xFF00D9FF); // Bright cyan
  static const Color secondary = Color(0xFFFF4B6E); // Coral/Pink
  static const Color accent = Color(0xFF7C3AED); // Purple
  static const Color text = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFF8E8E93);
  static const Color success = Color(0xFF34C759);
  static const Color border = Color(0xFF3A3A3C);

  // Subtle gradients for modern look
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF2A2A2A), Color(0xFF1F1F1F)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient secondaryGradient = LinearGradient(
    colors: [Color(0xFF2D2D2D), Color(0xFF242424)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient accentGradient = LinearGradient(
    colors: [Color(0xFF00D9FF), Color(0xFF7C3AED)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Text Styles - Clean and minimal
  static TextStyle get displayLarge => GoogleFonts.inter(
    fontSize: 64,
    fontWeight: FontWeight.w700,
    color: text,
    letterSpacing: -1.5,
  );

  static TextStyle get titleStyle => GoogleFonts.inter(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: text,
    letterSpacing: -0.5,
  );

  static TextStyle get headingStyle => GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: text,
    letterSpacing: -0.3,
  );

  static TextStyle get bodyStyle => GoogleFonts.inter(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: textSecondary,
  );

  static TextStyle get buttonTextStyle => GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    letterSpacing: 0.2,
  );

  static TextStyle get captionStyle => GoogleFonts.inter(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: textSecondary,
  );

  // Card decoration
  static BoxDecoration cardDecoration = BoxDecoration(
    color: cardBackground,
    borderRadius: BorderRadius.circular(24),
    border: Border.all(color: border, width: 1),
  );

  // Shadows - subtle and minimal
  static List<BoxShadow> get cardShadow => [
    BoxShadow(
      color: Colors.black.withOpacity(0.2),
      blurRadius: 20,
      offset: const Offset(0, 4),
    ),
  ];

  static List<BoxShadow> get buttonShadow => [
    BoxShadow(
      color: Colors.black.withOpacity(0.3),
      blurRadius: 12,
      offset: const Offset(0, 4),
    ),
  ];
}
