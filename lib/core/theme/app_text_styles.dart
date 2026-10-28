import 'package:clients_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Manrope for headings and numbers, DM Sans for everything else.
///
/// Sizes follow the Figma design, except that labels the design sets at
/// 9–10px are raised to 11px for legibility on real devices.
abstract final class AppTextStyles {
  static TextStyle get display => GoogleFonts.manrope(
    fontSize: 47,
    fontWeight: FontWeight.w700,
    height: 0.98,
    letterSpacing: -2.6,
    color: AppColors.ink,
  );

  static TextStyle get headline => GoogleFonts.manrope(
    fontSize: 35,
    fontWeight: FontWeight.w700,
    height: 1.05,
    letterSpacing: -1.9,
    color: AppColors.ink,
  );

  static TextStyle get title => GoogleFonts.manrope(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.9,
    color: AppColors.ink,
  );

  static TextStyle get statValue => GoogleFonts.manrope(
    fontSize: 21,
    fontWeight: FontWeight.w700,
    color: AppColors.ink,
  );

  static TextStyle get statValueSmall => GoogleFonts.manrope(
    fontSize: 17,
    fontWeight: FontWeight.w700,
    color: AppColors.ink,
  );

  static TextStyle get cardTitle => GoogleFonts.manrope(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.ink,
  );

  static TextStyle get cardName => GoogleFonts.manrope(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColors.ink,
  );

  static TextStyle get note => GoogleFonts.manrope(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.4,
    color: AppColors.ink,
  );

  static TextStyle get brand => GoogleFonts.manrope(
    fontSize: 15,
    fontWeight: FontWeight.w800,
    letterSpacing: -1.2,
    color: AppColors.surface,
    // Manrope would otherwise join "fl" into a single ligature glyph.
    fontFeatures: const [FontFeature.disable('liga')],
  );

  /// Uppercase section labels ("FRIDAY, MAY 24", "NEXT SESSION").
  static TextStyle get eyebrow => GoogleFonts.dmSans(
    fontSize: 11,
    fontWeight: FontWeight.w700,
    letterSpacing: 1.6,
    color: AppColors.inkMuted,
  );

  static TextStyle get pageLabel => GoogleFonts.dmSans(
    fontSize: 13,
    fontWeight: FontWeight.w700,
    color: AppColors.ink,
  );

  static TextStyle get chip => GoogleFonts.dmSans(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.inkMuted,
  );

  static TextStyle get body => GoogleFonts.dmSans(
    fontSize: 13,
    color: AppColors.inkMuted,
  );

  static TextStyle get caption => GoogleFonts.dmSans(
    fontSize: 11,
    color: AppColors.inkMuted,
  );

  static TextStyle get badge => GoogleFonts.dmSans(
    fontSize: 10,
    fontWeight: FontWeight.w700,
    color: AppColors.ink,
  );
}
