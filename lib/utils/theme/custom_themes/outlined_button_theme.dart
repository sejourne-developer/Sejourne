import 'package:flutter/material.dart';
import 'package:sejourne/utils/constants/colors.dart';
import 'package:sejourne/utils/constants/sizes.dart';

class TOutlinedButtonTheme {
  TOutlinedButtonTheme._();

  /// Customizable Light OutlinedButton Theme
  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.black,
      backgroundColor: TColors.white,
      side: const BorderSide(color: TColors.darkGrey),
      textStyle: const TextStyle(
          fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.black),
      padding: const EdgeInsets.symmetric(
          vertical: TSizes.sm + 2, horizontal: TSizes.defaultSpace),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    ),
  );

  /// Customizable Dark OutlinedButton Theme
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: TColors.primary,
      side: BorderSide.none,
      textStyle: const TextStyle(
          fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.white),
      padding: const EdgeInsets.symmetric(
          vertical: TSizes.sm + 2, horizontal: TSizes.defaultSpace),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    ),
  );
}
