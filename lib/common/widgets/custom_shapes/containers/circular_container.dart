import 'package:flutter/material.dart';
import '../../../../utils/constants/colors.dart';

class TCircularContainer extends StatelessWidget {
  const TCircularContainer({
    super.key,
    this.width = 400,
    this.height = 400,
    this.radius = 400,
    this.padding = 0,
    this.child,
    this.backgroundColor = TColors.white,
    this.margin,
    this.gradient,
    this.isGradient = false,
  });

  final double? width;
  final double? height;
  final double radius;
  final double padding;
  final EdgeInsetsGeometry? margin;
  final Widget? child;
  final Color backgroundColor;
  final Gradient? gradient;
  final bool isGradient;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
        gradient: isGradient ? gradient ?? TColors.radialGradient : null,
      ),
      child: child,
    );
  }
}
