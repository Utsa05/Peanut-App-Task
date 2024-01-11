import 'package:flutter/material.dart';
import 'package:peanut_app_task/app/theme.dart';

import 'constatns/app_size.dart';
import 'constatns/text_weight.dart';
import 'package:google_fonts/google_fonts.dart';

extension Text on TextStyle {
  TextStyle titleLarge() => GoogleFonts.poppins(
      fontSize: AppSize.s24,
      fontWeight: TextWeight.w700,
      color: AppTheme.blackColor);
  TextStyle titleMid() => GoogleFonts.poppins(
      fontSize: AppSize.s20,
      fontWeight: TextWeight.w600,
      color: AppTheme.blackColor);
  TextStyle titleSmall() => GoogleFonts.poppins(
      fontSize: AppSize.s24,
      fontWeight: TextWeight.w700,
      color: AppTheme.blackColor);

  TextStyle bodyLarge() => GoogleFonts.poppins(
      fontSize: AppSize.s24,
      fontWeight: TextWeight.w500,
      color: AppTheme.blackColor);
  TextStyle bodyMid() => GoogleFonts.poppins(
      fontSize: AppSize.s20,
      fontWeight: TextWeight.w500,
      color: AppTheme.blackColor);
  TextStyle bodySmall() => GoogleFonts.poppins(
      fontSize: AppSize.s16,
      fontWeight: TextWeight.w500,
      color: AppTheme.blackColor);

  TextStyle displayLarge() => GoogleFonts.poppins(
      fontSize: AppSize.s24,
      fontWeight: TextWeight.w500,
      color: AppTheme.primaryColor);
  TextStyle displayMid() => GoogleFonts.poppins(
      fontSize: AppSize.s20,
      fontWeight: TextWeight.w500,
      color: AppTheme.primaryColor);
  TextStyle displaySmall() => GoogleFonts.poppins(
      fontSize: AppSize.s16,
      fontWeight: TextWeight.w500,
      color: AppTheme.primaryColor);
}
