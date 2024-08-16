import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../data/services/exporter.dart';

class IconAndRatingBar extends StatelessWidget {
  const IconAndRatingBar(
      {super.key,
      required this.icon,
      required this.title,
      required this.ratingText,
      required this.ratingValue});

  final String icon, title;
  final Rx<String> ratingText;
  final Rx<double> ratingValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Icon
        TCircularIcon(
          icon: icon,
          height: 72,
          width: 72,
          padding: TSizes.md,
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
          children: [
            Row(
              children: [
                /// rating star bar
                Obx(
                  () => RatingBar.builder(
                    initialRating: ratingValue.value,
                    minRating: 1,
                    itemSize: TSizes.iconMd,
                    glow: false,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    unratedColor: TColors.grey,
                    itemPadding:
                        const EdgeInsetsDirectional.only(end: TSizes.xs),
                    itemBuilder: (context, _) => SvgPicture.asset(
                      TImage.starIcon,
                      colorFilter: const ColorFilter.mode(
                          TColors.green, BlendMode.srcIn),
                    ),
                    onRatingUpdate: (rating) {
                      ratingValue.value = rating;
                      switch (rating) {
                        case <= 1:
                          ratingText.value = TTexts.terribleLabel.tr;
                          break;
                        case <= 2:
                          ratingText.value = TTexts.badLabel.tr;
                          break;
                        case <= 3:
                          ratingText.value = TTexts.goodLabel.tr;
                          break;
                        case <= 4:
                          ratingText.value = TTexts.veryGoodLabel.tr;
                          break;
                        case <= 5:
                          ratingText.value = TTexts.awesomeLabel.tr;
                          break;
                      }
                    },
                  ),
                ),
                const SizedBox(
                  width: TSizes.sm,
                ),

                /// Rating text
                Obx(
                  () => Text(
                    ratingText.value,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .apply(color: TColors.green),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: TSizes.sm,
            ),

            /// rating features
            Padding(
              padding: const EdgeInsetsDirectional.only(start: TSizes.xs),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
