import 'package:flutter/material.dart';
import 'package:text_scroll/text_scroll.dart';

import '../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class IconTextWidget extends StatelessWidget {
  const IconTextWidget({
    super.key,
    required this.icon,
    required this.title,
    this.textStyle,
    this.isSlide = false,
  });

  final String icon, title;
  final TextStyle? textStyle;
  final bool isSlide;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TCircularIcon(
          icon: icon,
          showBorder: false,
          padding: TSizes.xs - 1,
          backgroundColor: THelperFunctions.isDarkMode(context)
              ? TColors.black
              : const Color(0xFFEAF7F4),
          height: TSizes.md,
          width: TSizes.md,
        ),
        const SizedBox(
          width: 2,
        ),
        Expanded(
          child: isSlide
              ? TextScroll(
                  title,
                  mode: TextScrollMode.bouncing,
                  velocity: const Velocity(pixelsPerSecond: Offset(TSizes.sm, 0)),
                  delayBefore: const Duration(seconds: 1),
                  numberOfReps: 5,
                  pauseBetween: const Duration(milliseconds: 500),
                  selectable: true,
                  style: textStyle ?? Theme.of(context).textTheme.labelMedium,
                )
              : Text(title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: textStyle ?? Theme.of(context).textTheme.labelSmall!
                  //.apply(color: TColors.darkGrey),
                  ),
        ),
      ],
    );
  }
}
