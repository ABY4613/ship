import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class AppTextStyles {
  // Headings (Serif)
  static TextStyle heading1 = GoogleFonts.cormorantGaramond(
    fontSize: 72,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
    height: 1.1,
  );

  static TextStyle heading1Italic = GoogleFonts.cormorantGaramond(
    fontSize: 72,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic,
    color: AppColors.accentGold,
    height: 1.1,
  );

  static TextStyle heading2 = GoogleFonts.cormorantGaramond(
    fontSize: 48,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryNavy,
    height: 1.2,
  );
  
  static TextStyle heading2Italic = GoogleFonts.cormorantGaramond(
    fontSize: 48,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic,
    color: AppColors.accentGold,
    height: 1.2,
  );

  static TextStyle heading3 = GoogleFonts.cormorantGaramond(
    fontSize: 32,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryNavy,
  );

  static TextStyle heading4 = GoogleFonts.cormorantGaramond(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );

  // Body (Sans-Serif)
  static TextStyle bodyLarge = GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
    height: 1.5,
  );

  static TextStyle bodyMedium = GoogleFonts.montserrat(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textDark,
    height: 1.5,
  );

  static TextStyle bodySmall = GoogleFonts.montserrat(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textGrey,
    height: 1.5,
  );

  static TextStyle buttonText = GoogleFonts.montserrat(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.5,
    color: AppColors.primaryNavy,
  );
  
  static TextStyle navLink = GoogleFonts.montserrat(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.5,
    color: AppColors.textDark,
  );
  
  static TextStyle overline = GoogleFonts.montserrat(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    letterSpacing: 2.0,
    color: AppColors.accentGold,
  );
}
