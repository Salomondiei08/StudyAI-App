import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class AppTheme {
// App Text Themes

  static TextTheme lightTexTheme = TextTheme(
    bodyLarge: GoogleFonts.openSans(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    displayLarge: GoogleFonts.openSans(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    displayMedium: GoogleFonts.openSans(
      fontSize: 21,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    displaySmall: GoogleFonts.openSans(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  );

// App Colors

  static Color ligthGray = const Color.fromARGB(255, 252, 252, 243);
  static Color mediumGray = const Color(0xff1A1818);

  static Color darkBlue = const Color(0xff27354B);
  static Color mediumBlue = const Color(0xff455A64);

  static Color green = const Color(0xff4ECB71);
  static Color borderColor =  Colors.grey;
}
