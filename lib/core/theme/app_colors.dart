import 'package:flutter/material.dart';

/// Color tokens, taken from the Figma design.
abstract final class AppColors {
  // Light surfaces
  static const background = Color(0xFFF5F4EE);
  static const Color surface = Colors.white;
  static const chip = Color(0xFFF3F2ED);
  static const iconButton = Color(0xFFE8E7DF);
  static const divider = Color(0xFFEEEEEE);

  // Text
  static const ink = Color(0xFF171915);
  static const inkMuted = Color(0xFF777970);
  static const inkSubtle = Color(0xFF92938D);

  // Accents
  static const accent = Color(0xFFD8FF4F);
  static const coral = Color(0xFFF2765D);

  // Dark surfaces
  static const darkBackground = Color(0xFF151714);
  static const darkSurface = Color(0xFF232521);
  static const darkIconButton = Color(0xFF282A26);
  static const darkDivider = Color(0xFF393A36);
  static const onDark = Color(0xFFF6F5EF);
  static const onDarkMuted = Color(0xFF92948C);
  static const positive = Color(0xFFCFFF4C);

  static const _cardPalette = [
    Color(0xFFF7B49E), // peach
    Color(0xFFD5F47C), // lime
    Color(0xFFA9D0F3), // blue
    Color(0xFFEEB8D5), // pink
    Color(0xFFBDB5EF), // violet
    Color(0xFFEAD8B4), // sand
  ];

  /// Each client keeps the same color no matter where it sits in the grid.
  static Color cardFor(int clientId) =>
      _cardPalette[(clientId - 1) % _cardPalette.length];

  static const _transactionPalette = [
    Color(0xFFF4866D), // coral
    Color(0xFFD6FF4F), // acid
    Color(0xFFC1B4F6), // lavender
    Color(0xFF9ACBF2), // sky
  ];

  /// Transaction cards cycle through the palette by list position.
  static Color transactionFor(int index) =>
      _transactionPalette[index % _transactionPalette.length];
}
