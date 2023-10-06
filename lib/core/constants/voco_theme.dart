import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voco/core/constants/voco_colors.dart';
import 'package:voco/core/constants/voco_dimensions.dart';

ThemeData vocoTheme = ThemeData(
  scaffoldBackgroundColor: VocoColors.linkWater,
  textTheme: GoogleFonts.poppinsTextTheme(),
  primaryColor: VocoColors.congressBlue,
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: VocoColors.congressBlue,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    hintStyle: TextStyle(fontSize: 14),
    contentPadding: EdgeInsets.symmetric(
      horizontal: 16.0,
      vertical: 8.0,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: VocoDimensions.circularRadius,
      borderSide: BorderSide(
        color: VocoColors.codGray,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: VocoDimensions.circularRadius,
      borderSide: BorderSide(
        color: VocoColors.congressBlue,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: VocoDimensions.circularRadius,
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: VocoDimensions.circularRadius,
    ),
  ),
  textButtonTheme: const TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStatePropertyAll<Color>(
        VocoColors.congressBlue,
      ),
    ),
  ),
);
