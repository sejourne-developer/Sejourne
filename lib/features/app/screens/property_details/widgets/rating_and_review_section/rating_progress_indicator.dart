
import '../../../../../../common/widgets/layouts/rating_indicator.dart';
import '../../../../../../common/widgets/texts/horizontal_icon_text.dart';
import '../../../../../../data/services/exporter.dart';
import 'progress_indicator_and_rating.dart';


class OverallPropertyRating extends StatelessWidget {
  const OverallPropertyRating({
    super.key,
    required this.rating,
    required this.reviews,
    required this.cleanliness,
    required this.accuracy,
    required this.checkIn,
    required this.communication,
    required this.location,
    required this.value,
    required this.apartmentLocation,
  });

  final String rating,
      reviews,
      cleanliness,
      accuracy,
      checkIn,
      communication,
      location,
      value,
      apartmentLocation;

  @override
  Widget build(BuildContext context) {
    List<String> icons=[TImage.cleanlinessIcon,TImage.accuracyIcon,TImage.checkInIcon,TImage.communicationIcon,TImage.locationIcon,TImage.valueIcon];
    List<String> title=[TTexts.cleanlinessLabel.tr,TTexts.accuracyLabel.tr,TTexts.checkInTitle.tr,TTexts.communicationLabel.tr,TTexts.locationLabel.tr,TTexts.valueLabel.tr];
    List<String> subTitle=[cleanliness,accuracy,checkIn,communication,location,value];
   List<String> rate=["5","4","3","2","1"];
   List<double> rateValue=[1.0,0.8,0.6,0.4,0.2];
    return TRoundedContainer(
      padding: const EdgeInsetsDirectional.symmetric(vertical:TSizes.md,horizontal: TSizes.sm),
      radius: TSizes.sm,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: rating,
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            TextSpan(
                              text: "/5",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .apply(color: TColors.grey),
                            ),
                          ],
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "${TTexts.basedOn.tr} $reviews ${TTexts.reviewsLabel.tr}",
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .apply(color: TColors.grey),
                        ),
                      ),
                      const TRatingBarIndicator(
                        rating: 3.5,
                      ),
                    ],
                  )),
              Expanded(
                flex: 5,
                child: Column(
                  children: [
                    for(int i=0;i<rate.length;i++)
                    TRatingProgressIndicator(
                      text: '${rate[i]} ${TTexts.startsLabel.tr}',
                      value: rateValue[i],
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: TSizes.md,
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
        ],
      ),
    );
  }
}
