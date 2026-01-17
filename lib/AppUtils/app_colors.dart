import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  /// ───────── NEUTRALS ─────────
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF0A0A0A);

  static const Color grey = Color(0xFF9CA3AF);
  static const Color lightGrey = Color(0xFFE5E7EB);
  static const Color darkGrey = Color(0xFF374151);

  /// ───────── PRIMARY (NEON BLUE) ─────────
  static const Color primary = Color(0xFF3B82F6);
  static const Color primaryDark = Color(0xFF1D4ED8);
  static const Color primaryGlow = Color(0xFF60A5FA);

  /// ───────── ACCENT (NEON PURPLE) ─────────
  static const Color accent = Color(0xFFA855F7);
  static const Color accentGlow = Color(0xFFD8B4FE);

  /// ───────── STATUS COLORS ─────────
  static const Color success = Color(0xFF22C55E);
  static const Color warning = Color(0xFFFACC15);
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF38BDF8);

  /// ───────── BACKGROUNDS ─────────
  static const Color background = Color(0xFF020617);
  static const Color surface = Color(0xFF020617);

  static const Color card = Color(0xFF0F172A);
  static const Color glass = Color(0xFF1E293B);

  /// ───────── GAME COLORS ─────────
  static const Color playerX = Color(0xFF22D3EE); // Neon Cyan
  static const Color playerO = Color(0xFFF97316); // Neon Orange

  static const Color winGlow = Color(0xFF4ADE80);

  /// ───────── GRADIENTS ─────────
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [
      Color(0xFF3B82F6),
      Color(0xFFA855F7),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient darkGradient = LinearGradient(
    colors: [
      Color(0xFF020617),
      Color(0xFF0F172A),
      Color(0xFF1E293B),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  /// ───────── GLOW SHADOWS ─────────
  static List<BoxShadow> glow(Color color) => [
    BoxShadow(
      color: color.withOpacity(0.45),
      blurRadius: 18,
      spreadRadius: 2,
    ),
  ];
}
