import 'package:flutter/material.dart';
import 'package:sejourne/common/widgets/images/rounded_image.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class TVerticalImageText extends StatelessWidget {
  const TVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = TColors.black,
    this.backgroundColor,
    this.onTap,
    this.imageSize = 72,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;
  final double imageSize;

  @override
  Widget build(BuildContext context) {
    THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          /// Circular icon
          TRoundedImage(
            width: imageSize,
            height: imageSize,
            padding: EdgeInsets.zero,
            borderRadius: TSizes.sm,
            imageUrl: image,
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems / 2,
          ),

          /// Text
          SizedBox(
            child: Text(
              title,
              style: Theme.of(context).textTheme.labelMedium!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
