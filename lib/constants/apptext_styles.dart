import 'package:flutter/widgets.dart';
import 'package:food/constants/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class ApptextStyles {
  static TextStyle main = GoogleFonts.sen(
    fontSize: 24,
    fontWeight: FontWeight.w800,
  );
  static TextStyle medium = GoogleFonts.sen(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static TextStyle mainwhite = GoogleFonts.sen(
    fontSize: 24,
    fontWeight: FontWeight.w800,
    color: Color(0xffffffff),
  );
  static TextStyle mediumwhite = GoogleFonts.sen(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Color(0xffffffff),
  );
  static TextStyle mediumColor = GoogleFonts.sen(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.btn,
  );
}
