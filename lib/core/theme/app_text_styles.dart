import 'package:clients_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Inter Tight for display text, DM Sans for everything else.
abstract final class AppTextStyles {
  static TextStyle get greeting => GoogleFonts.interTight(
    fontSize: 54,
    fontWeight: FontWeight.w500,
    height: 1,
    letterSpacing: -2.6,
    color: AppColors.ink,
  );

  static TextStyle get sectionTitle => GoogleFonts.interTight(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    letterSpacing: -1.4,
    color: AppColors.ink,
  );

  static TextStyle get overline => GoogleFonts.dmSans(
    fontSize: 13,
    fontWeight: FontWeight.w700,
    letterSpacing: 2.2,
    color: AppColors.inkMuted,
  );

  static TextStyle get statValue => GoogleFonts.dmSans(
    fontSize: 30,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.5,
    color: AppColors.ink,
  );

  static TextStyle get body => GoogleFonts.dmSans(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.inkMuted,
  );

  static TextStyle get cardName => GoogleFonts.dmSans(
    fontSize: 19,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.4,
    color: AppColors.ink,
  );

  static TextStyle get caption => GoogleFonts.dmSans(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: AppColors.inkMuted,
  );
}
