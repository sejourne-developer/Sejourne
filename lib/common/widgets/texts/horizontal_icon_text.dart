import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sejourne/utils/constants/colors.dart';
import 'package:sejourne/utils/constants/sizes.dart';
import 'package:sejourne/utils/helpers/helper_functions.dart';

class HorizontalIconText extends StatelessWidget {
  const HorizontalIconText(
      {super.key,
      required this.icon,
      required this.title,
      this.subTitle,
      this.isSub = true,
      this.titleTextStyle,
      this.subTitleTextStyle,
      this.iconSize = TSizes.iconXs,
      this.maxLine = 2,
      this.iconColor = TColors.secondaryIconColor,
      this.mainAxisAlignment = MainAxisAlignment.start,
      this.spaceBetween = TSizes.xs});

  final String icon, title;
  final String? subTitle;
  final bool isSub;
  final TextStyle? titleTextStyle, subTitleTextStyle;
  final double iconSize, spaceBetween;
  final int maxLine;
  final Color? iconColor;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: mainAxisAlignment,
      children: [
        SizedBox(
          height: iconSize,
          width: iconSize,
          child: SvgPicture.asset(
            icon,
            fit: BoxFit.contain,
            // height: iconSize,
            // width: iconSize,
            colorFilter: ColorFilter.mode(
                THelperFunctions.isDarkMode(context)
                    ? TColors.darkIconColor
                    : iconColor ?? TColors.lightIconColor,
                BlendMode.srcIn),
          ),
        ),
        SizedBox(
          width: spaceBetween,
        ),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: isSub
              ? RichText(
                  maxLines: maxLine,
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    text: "$title : ",
                    style: titleTextStyle ??
                        Theme.of(context).textTheme.labelLarge!,
                    //.apply(color: TColors.darkerGrey),
                    children: <TextSpan>[
                      TextSpan(
                        text: subTitle,
                        style: subTitleTextStyle ??
                            Theme.of(context).textTheme.labelMedium!,
                        //.apply(color: TColors.darkerGrey),
                      ),
                    ],
                  ),
                )
              : Text(
                  title,
                  style:
                      titleTextStyle ?? Theme.of(context).textTheme.labelSmall!,
                  maxLines: maxLine,
                  //.apply(color: TColors.darkerGrey),),
                ),
        ),
      ],
    );
  }
}
