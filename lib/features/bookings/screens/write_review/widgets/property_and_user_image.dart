import 'package:flutter/material.dart';
import '../../../../../utils/constants/text_strings.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../common/widgets/images/circular_image.dart';
import '../../../../../common/widgets/images/rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class PropertyAndUserImage extends StatelessWidget {
  const PropertyAndUserImage(
      {super.key,
      required this.propertyName,
      required this.rating,
      required this.reviews,
      required this.propertyImage,
      required this.userImage,
      required this.authorImage});

  final String propertyName,
      rating,
      reviews,
      propertyImage,
      userImage,
      authorImage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: Stack(
        children: [
          TRoundedImage(
            height: 200,
            margin: EdgeInsets.zero,
            borderRadius: TSizes.md,
            imageUrl: propertyImage,
            child: Padding(
              padding: const EdgeInsets.all(TSizes.sm),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      /// Icon
                      TCircularImage(
                        image: authorImage,
                        height: 56,
                        width: 56,
                        fit: BoxFit.contain,
                        backgroundColor: THelperFunctions.isDarkMode(context)
                            ? TColors.darkContainer
                            : TColors.softGrey,
                      ),
                      const SizedBox(
                        width: TSizes.sm,
                      ),

                      /// Rating stars and text
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FittedBox(
                            child: Text(
                              propertyName,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .apply(color: TColors.white),
                            ),
                          ),
                          const SizedBox(
                            height: TSizes.xs,
                          ),

                          /// rating features
                          Row(
                            children: [
                              TRoundedContainer(
                                height: TSizes.md,
                                width: TSizes.xl + TSizes.sm,
                                showBorder: false,
                                backgroundColor: TColors.green,
                                padding: const EdgeInsetsDirectional.symmetric(
                                    horizontal: TSizes.xs),
                                radius: TSizes.xs,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        rating.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 2,
                                    ),
                                    const Icon(
                                      Icons.star_rounded,
                                      size: 12,
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: TSizes.sm,
                              ),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  "${TTexts.ratingLabel.tr} (${reviews.toString()} ${TTexts.reviewsLabel.tr})",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .apply(color: TColors.white),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: TCircularImage(
              backgroundColor: THelperFunctions.isDarkMode(context)
                  ? TColors.darkContainer
                  : TColors.white,
              padding: TSizes.xs - 2,
              image: userImage,
              isSvg: false,
              height: 120,
              width: 120,
            ),
          ),
        ],
      ),
    );
  }
}
