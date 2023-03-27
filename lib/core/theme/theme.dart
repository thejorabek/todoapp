import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainTheme {
  static const Color _whiteColor = Color(0xffFFFFFF);
  static const Color _blackColor = Color(0xff242424);

  static ThemeData light = ThemeData(

    fontFamily: GoogleFonts.rubik().fontFamily,


    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0, backgroundColor: const Color(0xff5DE61A),
        textStyle: const TextStyle(
          color: _whiteColor,
        ),
      ),
    ),


    appBarTheme: AppBarTheme(
      foregroundColor: _blackColor,
      backgroundColor: const Color(0xff81C7F5),
      elevation: 0,
      titleTextStyle: GoogleFonts.rubik(color: _whiteColor),
    ),


    scaffoldBackgroundColor: const Color(0xffF9FCFF),


    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xffF857C3),
      foregroundColor: _whiteColor,
    ),
  );
}
