import 'package:flutter/material.dart';

class TColors {
  TColors._();

  // App Basic Colors
  static const Color primary = Color(0xFF702953);
  static const Color secondary = Color(0xFFDDDDDD);
  static const Color accent = Color(0xFFF0048D);
  static const Color secondaryAccent = Color(0xFF811E5C);

  // Gradient Colors
  static const Gradient linerGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xff801E5B),
        Color(0xffF0048D),
      ]);

  // Gradient Colors
  static Gradient darkLinerGradient = const LinearGradient(colors: [
    TColors.dark,
    TColors.dark,
  ]);

  static Gradient darkLinerGradient2 = LinearGradient(colors: [
    TColors.white.withOpacity(0.1),
    TColors.white.withOpacity(0.1),
  ]);

  static const Gradient linerGradient2 = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xffF0048D),
        Color(0xff801E5B),
      ]);

  static const Gradient radialGradient = RadialGradient(
      // begin: Alignment.topCenter,
      // end: Alignment.bottomCenter,
      colors: [
        Color(0xffF0048D),
        Color(0xff801E5B),
      ]);

  // Text Colors
  static const Color fontColor = Color(0xFF151528);
  static const Color darkFontColor = Color(0xFFB4B7BD);

  static const Color textBlack = Color(0xFF151528);
  static const Color textGrey = Color(0xFF8F8F8F);
  static const Color textDarkGrey = Color(0xFF767676);
  static const Color textWhite = Colors.white;

  // Background Colors
  static const Color light = Color(0xFFFFFFFF);
  static const Color dark = Color(0xFF242A38);

  //static const Color dark=Color(0xFF303749);

  // Background Container Colors
  static const Color lightContainer = Color(0xFFF6F6F6);
  static Color darkContainer = const Color(0xFF303749);
  static Color blackContainer = const Color(0xFF242937);

  // Border Colors
  static const Color darkPrimaryBorderColor = Color(0xFF801E5B);
  static const Color lightPrimaryBorderColor = Color(0xFFDDDDDD);
  static const Color lightSecondaryBorderColor = Color(0xFFE6E6E6);
  static const Color lightTextFieldBorderColor = Color(0xFF9C9C9C);

  // Icons Color
  static const Color darkIconColor = Color(0xFFB4B7BD);
  static const Color lightIconColor = Color(0xFF1C274C);
  static const Color secondaryIconColor = Color(0xFF042E60);

  // Error and Validation Colors
  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF388E3C);
  static const Color warning = Color(0xFFF57C00);
  static const Color info = Color(0xFF1976D2);

  // Neutral Shades
  static const Color black = Color(0xFF232323);
  static const Color black1 = Color(0xFF343434);
  static const Color black2 = Color(0xFF4D4D4D);
  static const Color darkerGrey = Color(0xFF4F4F4F);
  static const Color darkGrey = Color(0xFF939393);
  static const Color grey = Color(0xFFE0E0E0);
  static const Color grey2 = Color(0xFFB4B7BD);
  static const Color softGrey = Color(0xFFF4F4F4);
  static const Color lightGrey = Color(0xFFF9F9F9);
  static const Color white = Color(0xFFFFFFFF);
  static const Color lightBlue = Color(0xFFEAF7F4);
  static const Color green = Color(0xFF43D827);
  static const Color fontColor2 = Color(0xFF151528);
}
