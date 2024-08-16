import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/rounded_container.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {super.key,
      this.onPressed,
      required this.loading,
      required this.title,
      this.radius = TSizes.buttonRadius,
      this.height = TSizes.buttonHeight,
      this.width = double.infinity,
      this.buttonBackgroundColor,
      this.textStyle,
      this.padding =
          const EdgeInsetsDirectional.all(0)});

  final VoidCallback? onPressed;
  final Rx<bool> loading;
  final String title;
  final double radius, height, width;
  final Color? buttonBackgroundColor;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      gradient: TColors.linerGradient2,
      radius: radius,
      showBorder: false,
      isGradient: buttonBackgroundColor != null ? false : true,
      backgroundColor: buttonBackgroundColor,
      constraints: BoxConstraints(
          minWidth: width,
          maxWidth: double.infinity,
          minHeight: height,
          maxHeight: height),
      padding: padding,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Obx(
          () => loading.value
              ? const SizedBox(
                  height: 19,
                  width: 19,
                  child: CircularProgressIndicator(
                    color: TColors.white,
                  ),
                )
              : Text(
                  title,
                  style: textStyle ??
                      Theme.of(context).textTheme.bodyLarge!.apply(
                          color: THelperFunctions.isDarkMode(context)
                              ? TColors.darkFontColor
                              : TColors.white),
                ),
        ),
      ),
    );
  }
}
