import 'package:flutter/material.dart';
import 'package:sejourne/common/widgets/custom_shapes/containers/rounded_container.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../styles/shadows.dart';

class StatusContainer extends StatelessWidget {
  const StatusContainer({
    super.key,
    this.label,
    this.textStyle,
    this.padding,
    this.isGradient = false,
    this.backgroundColor,
    this.child, this.radius=100,
  });

  final String? label;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  final bool isGradient;
  final Widget? child;
  final double radius;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      isGradient: isGradient,
      shadow: TShadowStyle.containerShadow,
      backgroundColor: THelperFunctions.isDarkMode(context)
          ? TColors.blackContainer
          : backgroundColor ?? const Color(0xFFF1F1F1),
      borderColor: TColors.secondary,
      radius: radius,
      showBorder: isGradient ? false : true,
      padding: padding ??
          const EdgeInsets.symmetric(
            vertical: 2,
            horizontal: TSizes.sm,
          ),
      child: Center(
        child: child ??
            FittedBox(
              child: Text(label!,
                  style: textStyle ?? Theme.of(context).textTheme.labelSmall!),
            ),
      ),
    );
  }
}
