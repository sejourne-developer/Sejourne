import 'package:readmore/readmore.dart';
import '../../../../../../common/widgets/layouts/rating_indicator.dart';
import '../../../../../../common/widgets/texts/horizontal_icon_text.dart';
import '../../../../../../data/services/exporter.dart';

class UserReviewsCard extends StatelessWidget {
  const UserReviewsCard(
      {super.key,
      required this.userName,
      required this.userImage,
      required this.reviewComment,
      required this.cleanliness,
      required this.accuracy,
      required this.checkIn,
      required this.communication,
      required this.location,
      required this.value,
      required this.rating});

  final String userName,
      userImage,
      reviewComment,
      cleanliness,
      accuracy,
      checkIn,
      communication,
      location,
      value;

  final double rating;

  @override
  Widget build(BuildContext context) {
    List<String> icons=[TImage.cleanlinessIcon,TImage.accuracyIcon,TImage.checkInIcon,TImage.communicationIcon,TImage.locationIcon,TImage.valueIcon];
    List<String> title=[TTexts.cleanlinessLabel.tr,TTexts.accuracyLabel.tr,TTexts.checkInTitle.tr,TTexts.communicationLabel.tr,TTexts.locationLabel.tr,TTexts.valueLabel.tr];
    List<String> subTitle=[cleanliness,accuracy,checkIn,communication,location,value];
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                 CircleAvatar(
                  backgroundImage: AssetImage(userImage),
                ),
                const SizedBox(
                  width: TSizes.spaceBtwItems,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userName,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Row(
                      children: [
                        const TRatingBarIndicator(rating: 3.5),
                        const SizedBox(
                          width: TSizes.sm,
                        ),
                        Text(
                          "$rating ${TTexts.startsLabel.tr}",
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Text(
              '01 Nov, 2023',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
         ReadMoreText(
          reviewComment,
          trimLines: 2,
          trimExpandedText: ' ${TTexts.lessLabel.tr}',
          trimCollapsedText: ' ${TTexts.showMoreLabel.tr}',
          trimMode: TrimMode.Line,
          moreStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: TColors.primary,
          ),
          lessStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: TColors.primary,
          ),
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for(int i=0;i<3;i++)
            Expanded(
              child: HorizontalIconText(
                icon: icons[i],
                title: title[i],
                subTitle: subTitle[i],
                titleTextStyle: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .apply(color: TColors.darkFontColor),
                subTitleTextStyle: Theme.of(context).textTheme.displayLarge,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: TSizes.sm,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //mainAxisSize: MainAxisSize.min,
          children: [
            for(int i=3;i<title.length;i++)
              Expanded(
              child: HorizontalIconText(
                icon: icons[i],
                title: title[i],
                subTitle: subTitle[i],
                titleTextStyle: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .apply(color: TColors.darkFontColor),
                subTitleTextStyle: Theme.of(context).textTheme.displayLarge,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwSections,
        ),
      ],
    );
  }
}
