import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sejourne/utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class TRatingWidget extends StatelessWidget {
  const TRatingWidget({
    super.key,
    this.iconSize = 24,
    required this.ratingBarWidth,
    this.ratingBarHeight = 56,
    this.ratingTextStyle,
    this.reviewsTextStyle,
  });

  final double iconSize, ratingBarWidth, ratingBarHeight;
  final TextStyle? ratingTextStyle, reviewsTextStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text('4.9',
              style: ratingTextStyle ??
                  Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: TColors.white)),
        ),
        // const SizedBox(
        //   width: TSizes.sm,
        // ),
        SizedBox(
          width: ratingBarWidth,
          height: TSizes.md,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (_, context) => Icon(
              Icons.star_rounded,
              color: TColors.green,
              size: iconSize,
            ),
          ),
        ),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text('3 ${TTexts.reviewsLabel.tr}',
              style: reviewsTextStyle ??
                  Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .apply(color: TColors.white)),
        ),
      ],
    );
  }
}
