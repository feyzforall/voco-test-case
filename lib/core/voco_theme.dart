import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:voco/core/voco_colors.dart';
import 'package:voco/core/voco_dimensions.dart';

ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: VocoColors.linkWater,
  textTheme: GoogleFonts.poppinsTextTheme(),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: VocoColors.codGray,
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
        color: VocoColors.dustyGray,
      ),
    ),
    focusedBorder: OutlineInputBorder(borderRadius: VocoDimensions.circularRadius),
    errorBorder: OutlineInputBorder(borderRadius: VocoDimensions.circularRadius),
    disabledBorder: OutlineInputBorder(borderRadius: VocoDimensions.circularRadius),
  ),
  textButtonTheme: const TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStatePropertyAll<Color>(
        VocoColors.codGray,
      ),
    ),
  ),
);
