import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppFonts {
  static TextStyle? defaultFont({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    Color? decorationColor,
    TextDecoration? decoration,
    double? height,
  }) {
    return GoogleFonts.inter(
        height: height,
        color: color ?? Colors.cyan,
        fontWeight: fontWeight ?? FontWeight.w400,
        fontSize: fontSize ?? 18,
        decorationColor: decorationColor,
        decoration: decoration);
  }

  static TextStyle? searchField = GoogleFonts.inter(
    decorationThickness: 0,
    color: AppColors.grey5,
    fontWeight: FontWeight.w200,
    fontSize: 12.5,
  );
  static TextStyle? largeTitle = GoogleFonts.inter(
    fontSize: 34,
    color: const Color(0xFF444446),
  );

  static TextStyle? title1 = GoogleFonts.inter(
    fontSize: 28,
    color: AppColors.black,
  );

  static TextStyle? title2 = GoogleFonts.inter(
    fontSize: 22,
    color: AppColors.black,
  );

  static TextStyle? link = GoogleFonts.inter(
    color: AppColors.white,
    fontWeight: FontWeight.w500,
    fontSize: 29,
  );

  static TextStyle? bodyPlaceholder = GoogleFonts.inter(
    color: AppColors.grey5,
    fontWeight: FontWeight.w200,
    fontSize: 12.5,
  );

}