import 'package:flutter/material.dart';

abstract final class AppColors {
  static const background = Color(0xFFF4F3EF);
  static const Color surface = Colors.white;
  static const ink = Color(0xFF151614);
  static const inkMuted = Color(0xFF75756F);
  static const chip = Color(0xFFF1F0EB);
  static const accent = Color(0xFFE7F96B);
  static const coral = Color(0xFFE8704F);

  static const _cardPalette = [
    Color(0xFFF0B59C), // peach
    Color(0xFFDDF283), // lime
    Color(0xFFB5D2F2), // sky
    Color(0xFFE6B9DA), // pink
    Color(0xFFCBC3F3), // lavender
    Color(0xFFBDE5CC), // mint
    Color(0xFFF6DC8C), // butter
    Color(0xFFF3C1B6), // blush
  ];

  /// Each client keeps the same color no matter where it sits in the grid.
  static Color cardFor(int clientId) =>
      _cardPalette[(clientId - 1) % _cardPalette.length];
}
