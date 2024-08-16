import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class TCircularIcon extends StatelessWidget {
  const TCircularIcon({
    super.key,
    this.width,
    this.height,
    this.size = TSizes.lg,
    required this.icon,
    this.color,
    this.backgroundColor,
    this.onPressed,
    this.showBorder = true,
    this.padding = TSizes.sm,
    this.isAnimated = false,
    this.removeColor = false,
    this.darkBorderColor,  this.animatedIcon=TImage.animatedHeart,
  });

  final double? width, height, size;
  final String icon,animatedIcon;
  final double padding;
  final bool showBorder, isAnimated;
  final Color? color, backgroundColor, darkBorderColor;
  final VoidCallback? onPressed;
  final bool removeColor;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    //final locale=Get.locale;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: showBorder
              ? Border.all(
                  color: dark
                      ? darkBorderColor ?? TColors.darkPrimaryBorderColor
                      : TColors.secondary,
                  width: 1.0)
              : null,
          color: backgroundColor != null
              ? backgroundColor!
              : dark
                  ? TColors.blackContainer
                  : TColors.white,
        ),
        child: SizedBox(
          width: TSizes.md,
          height: TSizes.md,
          child: isAnimated
              ? Lottie.asset(animatedIcon,
                  fit: BoxFit.contain, repeat: false,)
              : SvgPicture.asset(
                  icon,
                  colorFilter: removeColor
                      ? null
                      : ColorFilter.mode(
                        color?? (dark ? TColors.darkIconColor : TColors.lightIconColor),
                          BlendMode.srcIn),
                ),
        ),
      ),
    );
  }
}
