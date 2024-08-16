import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class HorizontalTitleSubtitleWithDottedDivider extends StatelessWidget {
  const HorizontalTitleSubtitleWithDottedDivider(
      {super.key, required this.title, required this.subTitle});

  final String title, subTitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: TSizes.lg,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              flex: 3,
              child: Text(
                title,
                style: Theme.of(context).textTheme.labelSmall!.apply(
                    color: THelperFunctions.isDarkMode(context)
                        ? TColors.darkFontColor
                        : TColors.grey2),
              )),
          Column(
            children: List.generate(
              36 ~/ 3,
              (index) => Expanded(
                child: Container(
                  color: index % 2 == 0 ? Colors.transparent : Colors.grey,
                  //height:10,
                  width: 0.8,
                ),
              ),
            ),
          ),
          Expanded(
              flex: 8,
              child: Padding(
                padding: const EdgeInsetsDirectional.only(start: TSizes.sm),
                child: Text(
                  subTitle,
                  style: Theme.of(context).textTheme.labelMedium!.apply(
                      color: THelperFunctions.isDarkMode(context)
                          ? TColors.darkFontColor
                          : TColors.primary),
                ),
              )),
        ],
      ),
    );
  }
}
