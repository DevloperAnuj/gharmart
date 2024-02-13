import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData myTheme = ThemeData(
  // Specify color scheme based on your chosen colors
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.indigoAccent.shade200, // const Color(0x0053777a),
    brightness: Brightness.light, // Or Brightness.dark if using dark theme
    background: const Color(0x00ffe5c2),
  ),
  // Define text theme with desired fonts and sizes
  textTheme: TextTheme(
    titleLarge: GoogleFonts.montserrat(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: const Color(0x00333333),
    ),
    titleMedium: GoogleFonts.montserrat(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: const Color(0x00333333),
    ),
    bodyLarge: GoogleFonts.roboto(
      fontWeight: FontWeight.normal,
      fontSize: 14.0,
      color: const Color(0x00333333),
    ),
  ),
  // Other theme properties can be set here (e.g., buttonTheme, appBarTheme)
);
