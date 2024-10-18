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
        color: color ?? AppColors.secondaryBlue,
        fontWeight: fontWeight ?? FontWeight.w400,
        fontSize: fontSize ?? 18,
        decorationColor: decorationColor,
        decoration: decoration);
  }
}