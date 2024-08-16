import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class TTabBarTheme {
  TTabBarTheme._();

  /// Customizable Light AppBar Theme
  static final lightTabBarTheme = TabBarTheme(
    dividerColor: Colors.transparent,
    // indicator: BoxDecoration(
    //     borderRadius: BorderRadius.circular(100),
    //     gradient: TColors.linerGradient2,
    //     //border: Border.all(width: 0.8,)
    // ),
    indicatorColor: TColors.accent,
    indicatorSize: TabBarIndicatorSize.tab,
    labelColor: TColors.fontColor,

    overlayColor: WidgetStateProperty.all(Colors.transparent),
    unselectedLabelStyle: const TextStyle().copyWith(
        fontSize: 8.0, fontWeight: FontWeight.normal, color: TColors.fontColor),
    labelStyle: const TextStyle().copyWith(
        fontSize: 8.0, fontWeight: FontWeight.normal, color: TColors.fontColor),
  );

  /// Customizable Dark AppBar Theme
  static final darkTabBarTheme = TabBarTheme(
    dividerColor: Colors.transparent,
    // indicator:  BoxDecoration(
    //   borderRadius: BorderRadius.circular(100),
    //   gradient: TColors.linerGradient2,
    // ),
    indicatorColor: TColors.accent,

    indicatorSize: TabBarIndicatorSize.label,
    labelColor: TColors.darkFontColor,
    overlayColor: WidgetStateProperty.all(Colors.transparent),
    unselectedLabelStyle: const TextStyle().copyWith(
        fontSize: 8.0,
        fontWeight: FontWeight.normal,
        color: TColors.darkFontColor),
    labelStyle: const TextStyle().copyWith(
        fontSize: 8.0,
        fontWeight: FontWeight.normal,
        color: TColors.darkFontColor),
  );
}
