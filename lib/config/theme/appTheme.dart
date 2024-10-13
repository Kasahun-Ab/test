// ignore: file_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


ThemeData customTheme() {
  return ThemeData(
    primaryColor: Colors.amber,
    textTheme: TextTheme(
      displayLarge: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
      bodyLarge: GoogleFonts.poppins(fontSize: 14, color: Colors.black54),
      bodyMedium: GoogleFonts.poppins(fontSize: 13, color: Colors.black38),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.amber,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: GoogleFonts.poppins(fontSize: 15, color: Colors.black45),
      contentPadding: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
      border: const OutlineInputBorder(borderSide: BorderSide.none),
    ),
  );
}
