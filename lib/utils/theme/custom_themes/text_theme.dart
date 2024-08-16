import 'package:flutter/material.dart';
import 'package:sejourne/utils/constants/colors.dart';

class TTextTheme {
  TTextTheme._();

  /// Customizable Light Text Theme
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
        fontSize: 32.0, fontWeight: FontWeight.bold, color: TColors.fontColor),
    headlineMedium: const TextStyle().copyWith(
        fontSize: 24.0, fontWeight: FontWeight.w600, color: TColors.fontColor),
    headlineSmall: const TextStyle().copyWith(
        fontSize: 18.0, fontWeight: FontWeight.w600, color: TColors.fontColor),
    titleLarge: const TextStyle().copyWith(
        fontSize: 16.0, fontWeight: FontWeight.w600, color: TColors.fontColor),
    titleMedium: const TextStyle().copyWith(
        fontSize: 16.0, fontWeight: FontWeight.w500, color: TColors.fontColor),
    titleSmall: const TextStyle().copyWith(
        fontSize: 16.0, fontWeight: FontWeight.w400, color: TColors.fontColor),
    bodyLarge: const TextStyle().copyWith(
        fontSize: 14.0, fontWeight: FontWeight.w600, color: TColors.fontColor),
    bodyMedium: const TextStyle().copyWith(
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
        color: TColors.fontColor),
    bodySmall: const TextStyle().copyWith(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        color: TColors.fontColor),
    labelLarge: const TextStyle().copyWith(
        fontSize: 12.0, fontWeight: FontWeight.bold, color: TColors.fontColor),
    labelMedium: const TextStyle().copyWith(
        fontSize: 10.0,
        fontWeight: FontWeight.normal,
        color: TColors.fontColor),
    labelSmall: const TextStyle().copyWith(
        fontSize: 8.0, fontWeight: FontWeight.normal, color: TColors.fontColor),
    displaySmall: const TextStyle().copyWith(
        fontSize: 4.0, fontWeight: FontWeight.normal, color: TColors.fontColor),
    displayMedium: const TextStyle().copyWith(
        fontSize: 6.0, fontWeight: FontWeight.normal, color: TColors.fontColor),
    displayLarge: const TextStyle().copyWith(
        fontSize: 7.0, fontWeight: FontWeight.bold, color: TColors.fontColor),
  );

  /// Customizable Dark Text Theme
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
        color: TColors.darkFontColor),
    headlineMedium: const TextStyle().copyWith(
        fontSize: 24.0,
        fontWeight: FontWeight.w600,
        color: TColors.darkFontColor),
    headlineSmall: const TextStyle().copyWith(
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: TColors.darkFontColor),
    titleLarge: const TextStyle().copyWith(
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
        color: TColors.darkFontColor),
    titleMedium: const TextStyle().copyWith(
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
        color: TColors.darkFontColor),
    titleSmall: const TextStyle().copyWith(
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        color: TColors.darkFontColor),
    bodyLarge: const TextStyle().copyWith(
        fontSize: 14.0,
        fontWeight: FontWeight.w600,
        color: TColors.darkFontColor),
    bodyMedium: const TextStyle().copyWith(
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
        color: TColors.darkFontColor),
    bodySmall: const TextStyle().copyWith(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        color: TColors.darkFontColor),
    labelLarge: const TextStyle().copyWith(
        fontSize: 12.0,
        fontWeight: FontWeight.bold,
        color: TColors.darkFontColor),
    labelMedium: const TextStyle().copyWith(
        fontSize: 10.0,
        fontWeight: FontWeight.normal,
        color: TColors.darkFontColor),
    labelSmall: const TextStyle().copyWith(
        fontSize: 8.0,
        fontWeight: FontWeight.normal,
        color: TColors.darkFontColor),
    displaySmall: const TextStyle().copyWith(
        fontSize: 4.0,
        fontWeight: FontWeight.normal,
        color: TColors.darkFontColor),
    displayMedium: const TextStyle().copyWith(
        fontSize: 6.0,
        fontWeight: FontWeight.normal,
        color: TColors.darkFontColor),
    displayLarge: const TextStyle().copyWith(
        fontSize: 7.0,
        fontWeight: FontWeight.bold,
        color: TColors.darkFontColor),
  );
}
