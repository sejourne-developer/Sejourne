import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';

class TTextFormFieldTheme {
  TTextFormFieldTheme._();

  /// Customizable Light TextFormField Theme
  static InputDecorationTheme lightTextFormFieldTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,
    contentPadding: const EdgeInsets.symmetric(
        horizontal: TSizes.defaultSpace, vertical: TSizes.md + 3),
    filled: true,
    fillColor: TColors.white,
    labelStyle: const TextStyle().copyWith(
        fontSize: 14.0,
        color: TColors.lightPrimaryBorderColor,
        fontWeight: FontWeight.w400),
    hintStyle: const TextStyle().copyWith(
        fontSize: 14.0,
        color: TColors.lightPrimaryBorderColor,
        fontWeight: FontWeight.w400),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(color: TColors.primary),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(
        width: 1,
        color: TColors.lightPrimaryBorderColor,
      ),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(
        width: 1,
        color: TColors.lightPrimaryBorderColor,
      ),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(
        width: 1,
        color: Colors.black12,
      ),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(
        width: 1,
        color: Colors.red,
      ),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(
        width: 1,
        color: Colors.orange,
      ),
    ),
  );

  /// Customizable Dark TextFormField Theme
  static InputDecorationTheme darkTextFormFieldTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: TColors.darkFontColor,
    suffixIconColor: TColors.darkFontColor,
    filled: true,
    fillColor: TColors.dark,
    contentPadding: const EdgeInsets.symmetric(
        horizontal: TSizes.defaultSpace, vertical: TSizes.md + 3),
    labelStyle: const TextStyle().copyWith(
        fontSize: 14.0,
        color: TColors.darkFontColor,
        fontWeight: FontWeight.w400),
    hintStyle: const TextStyle().copyWith(
        fontSize: 14.0,
        color: TColors.darkFontColor,
        fontWeight: FontWeight.w400),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle()
        .copyWith(color: TColors.white, fontWeight: FontWeight.normal),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(
        width: 1,
        color: TColors.darkPrimaryBorderColor,
      ),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(
        width: 1,
        color: TColors.darkPrimaryBorderColor,
      ),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(
        width: 1,
        color: TColors.darkPrimaryBorderColor,
      ),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(
        width: 1,
        color: Colors.red,
      ),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(
        width: 1,
        color: Colors.orange,
      ),
    ),
  );
}
