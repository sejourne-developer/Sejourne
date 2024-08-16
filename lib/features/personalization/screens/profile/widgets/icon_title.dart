import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sejourne/utils/helpers/helper_functions.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class IconTitle extends StatelessWidget {
  const IconTitle({
    super.key,
    required this.icon,
    required this.title,
    this.showBorder = true,
    this.iconColor,
    this.iconSize,
  });

  final String icon, title;
  final ColorFilter? iconColor;
  final double? iconSize;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(TSizes.sm),
      decoration: BoxDecoration(
          border: showBorder
              ? const Border(right: BorderSide(color: TColors.grey, width: 1))
              : null),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            height: iconSize ?? TSizes.iconLg + 4,
            width: iconSize ?? TSizes.iconLg + 4,
            colorFilter: iconColor ??
                ColorFilter.mode(
                    THelperFunctions.isDarkMode(context)
                        ? TColors.darkIconColor
                        : TColors.primary,
                    BlendMode.srcIn),
          ),
          const SizedBox(
            height: TSizes.xs,
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              title,
              maxLines: 1,
              style: Theme.of(context).textTheme.labelMedium,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
