import 'package:flutter/material.dart';

class AppColors {
  AppColors._(); // prevents instantiation

  /// ---------- NEUTRALS ----------
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF0E0E0E);
  static const Color grey = Color(0xFF9E9E9E);
  static const Color lightGrey = Color(0xFFE5E7EB);
  static const Color darkGrey = Color(0xFF4B5563);

  /// ---------- PRIMARY PALETTE ----------
  static const Color primary = Color(0xFF2563EB); // Modern Blue
  static const Color primaryDark = Color(0xFF1E40AF);
  static const Color primaryLight = Color(0xFF93C5FD);

  /// ---------- ACCENT COLORS ----------
  static const Color accent = Color(0xFF9333EA); // Purple
  static const Color accentLight = Color(0xFFD8B4FE);

  /// ---------- STATUS COLORS ----------
  static const Color success = Color(0xFF22C55E);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF0EA5E9);

  /// ---------- BACKGROUNDS ----------
  static const Color background = Color(0xFFF9FAFB);
  static const Color darkBackground = Color(0xFF0F172A);
  static const Color card = Color(0xFFFFFFFF);
  static const Color darkCard = Color(0xFF1E293B);

  /// ---------- GAME / UI SPECIAL ----------
  static const Color playerX = Color(0xFF38BDF8); // Cyan
  static const Color playerO = Color(0xFFF97316); // Orange

  /// ---------- GRADIENTS ----------
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [
      Color(0xFF2563EB),
      Color(0xFF9333EA),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient darkGradient = LinearGradient(
    colors: [
      Color(0xFF0F172A),
      Color(0xFF1E293B),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
