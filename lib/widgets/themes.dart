import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  static ThemeData  lightTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.lato().fontFamily,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          elevation: 0.0,
          textTheme: Theme.of(context).textTheme,
        ),
      );
  static ThemeData  darkTheme(BuildContext context) => ThemeData(
       brightness: Brightness.dark,
      );
}