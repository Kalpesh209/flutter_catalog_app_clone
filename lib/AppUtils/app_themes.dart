import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  static ThemeData lighttheme(BuildContext context) => ThemeData(
        scaffoldBackgroundColor: Color(0xffEEEEEE),
        fontFamily: GoogleFonts.poppins().fontFamily,
        colorScheme: ColorScheme.light(
          onBackground: Color(0xff354259),
          primary: Color(0xff354259),
          primaryContainer: Color(0xffF1F0E8),
          secondary: Colors.black,
          tertiary: Colors.white,
        ),
      );

  static ThemeData darktheme(BuildContext context) => ThemeData(
        scaffoldBackgroundColor: Color(0xff101415), //main backgorund
        fontFamily: GoogleFonts.poppins().fontFamily,
        colorScheme: ColorScheme.dark(
          onBackground: Color(0xffF9F9F9), // color for objects on background
          primary: Colors.white, // color for objects on background
          primaryContainer: Color(0xff20262E), // color behind item
          secondary: Colors.white, //text color
          tertiary: Color(0xff31363F), //card color and description color
        ),
      );
}
