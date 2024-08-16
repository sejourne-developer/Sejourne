import 'package:flutter/material.dart';
import 'package:sejourne/utils/helpers/helper_functions.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class TRoundedContainer extends StatelessWidget {
  const TRoundedContainer({
    super.key,
    this.width,
    this.height,
    this.radius = TSizes.cardRadiusLg,
    this.padding,
    this.child,
    this.backgroundColor,
    this.margin,
    this.showBorder = true,
    this.borderColor = TColors.lightPrimaryBorderColor,
    this.shadow = const BoxShadow(),
    this.gradient,
    this.isGradient = false,
    this.onPressed,
    this.constraints,
  });

  final double? width;
  final double? height;
  final double radius;
  final Widget? child;
  final bool showBorder;
  final Color borderColor;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BoxShadow shadow;
  final Gradient? gradient;
  final bool isGradient;
  final VoidCallback? onPressed;
  final BoxConstraints? constraints;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        constraints: constraints,
        width: width,
        height: height,
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          boxShadow: [shadow],
          color: THelperFunctions.isDarkMode(context)
              ? backgroundColor ?? TColors.dark
              : backgroundColor ?? TColors.white,
          gradient: isGradient ? gradient ?? TColors.linerGradient : null,
          border: showBorder
              ? Border.all(
                  color: THelperFunctions.isDarkMode(context)
                      ? TColors.darkPrimaryBorderColor
                      : borderColor,
                  width: 0.8)
              : null,
        ),
        child: child,
      ),
    );
  }
}
