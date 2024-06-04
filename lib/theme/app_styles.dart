
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:storyville_clone/theme/app_colors.dart';

const _light = FontWeight.w300;
const _regular = FontWeight.w400;
const _medium = FontWeight.w500;
const _semiBold = FontWeight.w600;
const _bold = FontWeight.w700;
const _extraBold = FontWeight.w800;

class AppStyles {
  static final light = GoogleFonts.inter(
    fontWeight: _light,
    color: AppColors.sFFFFFFFF,
    fontSize: 14,
  );

  static final regular = GoogleFonts.inter(
    fontWeight: _regular,
    color: AppColors.sFFFFFFFF,
    fontSize: 14,
  );

  static final medium = GoogleFonts.inter(
    fontWeight: _medium,
    color: AppColors.sFFFFFFFF,
    fontSize: 14,
  );

  static final semiBold = GoogleFonts.inter(
    fontWeight: _semiBold,
    color: AppColors.sFFFFFFFF,
    fontSize: 14,
  );

  static final bold = GoogleFonts.inter(
    fontWeight: _bold,
    color: AppColors.sFFFFFFFF,
    fontSize: 14,
  );

  static final extraBold = GoogleFonts.inter(
    fontWeight: _extraBold,
    color: AppColors.sFFFFFFFF,
    fontSize: 14,
  );

  static final storyRegular = GoogleFonts.merriweather(
    fontWeight: _regular,
    color: AppColors.sFFFFFFFF,
    fontSize: 14,
  );

  static final storyMedium = GoogleFonts.merriweather(
    fontWeight: _medium,
    color: AppColors.sFFFFFFFF,
    fontSize: 14,
  );

  static final storyBold = GoogleFonts.merriweather(
    fontWeight: _bold,
    color: AppColors.sFFFFFFFF,
    fontSize: 14,
  );
}
