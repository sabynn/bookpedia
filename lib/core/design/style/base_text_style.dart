import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BaseTextStyle {
  // Header
  static TextStyle header1Regular({Color? color}) {
    return GoogleFonts.poppins(
      color: color,
      fontSize: 36,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle header1Semibold({Color? color}) {
    return GoogleFonts.poppins(
      color: color,
      fontSize: 36,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle header3Semibold({Color? color}) {
    return GoogleFonts.poppins(
      color: color,
      fontSize: 24,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle paragraph1Semibold({Color? color}) {
    return GoogleFonts.poppins(
      color: color,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle paragraph1Regular({Color? color}) {
    return GoogleFonts.poppins(
      color: color,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle paragraph2Regular({Color? color}) {
    return GoogleFonts.poppins(
      color: color,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    );
  }
}
