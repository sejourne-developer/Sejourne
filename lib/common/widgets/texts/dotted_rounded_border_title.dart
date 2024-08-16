import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class DottedRoundedBorderTitle extends StatelessWidget {
  const DottedRoundedBorderTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      padding: EdgeInsets.zero,
      color: THelperFunctions.isDarkMode(context)
          ? TColors.lightPrimaryBorderColor
          : TColors.primary,
      radius: const Radius.circular(100),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 2,
          horizontal: TSizes.sm,
        ),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(100)),
            color: THelperFunctions.isDarkMode(context)
                ? TColors.blackContainer
                : TColors.white),
        child: Text(title, style: Theme.of(context).textTheme.labelMedium!),
      ),
    );
  }
}
