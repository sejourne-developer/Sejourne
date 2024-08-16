import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../icons/circular_icon.dart';
import 'dotted_rounded_border_title.dart';

class SectionHeadingWithEditIcon extends StatelessWidget {
  const SectionHeadingWithEditIcon({
    super.key,
    required this.onPressed,
    required this.title,
    this.showEditButton = true,
  });

  final String title;
  final VoidCallback? onPressed;
  final bool showEditButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(vertical: TSizes.md),
      child: Row(
        children: [
          DottedRoundedBorderTitle(
            title: title,
          ),
          const SizedBox(
            width: TSizes.md,
          ),
          Expanded(
            child: Row(
              children: List.generate(
                150 ~/ 3,
                (index) => Expanded(
                  child: Container(
                    color: index % 2 == 0
                        ? Colors.transparent
                        : THelperFunctions.isDarkMode(context)
                            ? TColors.grey2
                            : TColors.primary,
                    height: 0.5,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: TSizes.md,
          ),
          showEditButton
              ? TCircularIcon(
                  darkBorderColor: TColors.grey2,
                  icon: TImage.editIcon,
                  onPressed: onPressed,
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
