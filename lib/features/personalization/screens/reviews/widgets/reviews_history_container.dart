import 'package:dotted_border/dotted_border.dart';
import 'package:sejourne/common/widgets/custom_shapes/containers/status_container.dart';
import 'package:sejourne/common/widgets/images/dotted_border_circle_image.dart';
import 'package:sejourne/common/widgets/texts/horizontal_icon_text.dart';
import 'package:sejourne/features/app/screens/property_details/property_details_screen.dart';
import '../../../../../../../data/services/exporter.dart';
import '../../../../../common/widgets/layouts/rating_indicator.dart';

class ReviewsHistoryContainer extends StatelessWidget {
  const ReviewsHistoryContainer({
    super.key,
    required this.userName,
    required this.reviewComment,
    required this.location,
    required this.cleanliness,
    required this.accuracy,
    required this.checkIn,
    required this.communication,
    required this.value,
    required this.apartmentLocation,
    required this.rating,
  });

  final String userName,
      reviewComment,
      cleanliness,
      accuracy,
      checkIn,
      communication,
      location,
      value,
      apartmentLocation;
  final double rating;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() => const PropertyDetailScreen(
        heroTag: "ReviewsHistoryContainerHeroTag",
      )),
      child: Stack(
        children: [
          TRoundedContainer(
            height: 120,
            radius: TSizes.md,
            showBorder: true,
            isGradient: false,
            margin: const EdgeInsetsDirectional.only(top: 8),
            padding: EdgeInsets.zero,
            shadow: TShadowStyle.containerShadow,
            child: Row(
              children: [
                /// icon
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(TSizes.sm),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              const Align(
                                alignment: AlignmentDirectional.center,
                                child: TDottedBorderCircleImage(
                                  image: TImage.user4,
                                  borderWidth: 1,
                                  status: false,
                                  isSvg: false,
                                  imageSize: 72,
                                ),
                              ),
                              Align(
                                  alignment: AlignmentDirectional.bottomEnd,
                                  child: Container(
                                    height: 24,
                                    width: 24,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            const BorderRadiusDirectional.all(
                                                Radius.circular(100)),
                                        color: dark
                                            ? TColors.blackContainer
                                            : TColors.white),
                                    child: DottedBorder(
                                      borderType: BorderType.Circle,
                                      padding: const EdgeInsets.all(TSizes.xs),
                                      color: dark
                                          ? TColors.grey2
                                          : TColors.primary,
                                      child: Center(
                                          child: FittedBox(
                                              child: Text(
                                        rating.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge,
                                      ))),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: TSizes.sm,
                        ),
                        TRatingBarIndicator(
                          rating: rating,
                          itemSize: TDeviceUtils.getScreenWidth(context) * 0.03,
                        )
                      ],
                    ),
                  ),
                ),

                Expanded(
                  flex: 6,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.symmetric(
                      vertical: TSizes.sm,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(userName,
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .apply(
                                    color: dark
                                        ? TColors.darkFontColor
                                        : TColors.primary)),
                        const SizedBox(
                          height: TSizes.xs,
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.only(end: TSizes.md),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset(TImage.commentIcon),
                              const SizedBox(
                                width: TSizes.xs,
                              ),
                              Expanded(
                                  child: Text(
                                reviewComment,
                                style: Theme.of(context).textTheme.labelSmall,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ))
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: TSizes.xs,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.only(
                                end: TSizes.sm),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: HorizontalIconText(
                                    icon: TImage.cleanlinessIcon,
                                    title: TTexts.cleanlinessLabel.tr,
                                    subTitle: cleanliness,
                                    titleTextStyle: Theme.of(context)
                                        .textTheme
                                        .displayLarge!
                                        .apply(color: TColors.darkFontColor),
                                    subTitleTextStyle: Theme.of(context)
                                        .textTheme
                                        .displayLarge,
                                  ),
                                ),
                                FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: HorizontalIconText(
                                    icon: TImage.accuracyIcon,
                                    title: TTexts.accuracyLabel.tr,
                                    subTitle: accuracy,
                                    titleTextStyle: Theme.of(context)
                                        .textTheme
                                        .displayLarge!
                                        .apply(color: TColors.darkFontColor),
                                    subTitleTextStyle: Theme.of(context)
                                        .textTheme
                                        .displayLarge,
                                  ),
                                ),
                                FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: HorizontalIconText(
                                    icon: TImage.checkInIcon,
                                    title: TTexts.checkInTitle.tr,
                                    subTitle: checkIn,
                                    titleTextStyle: Theme.of(context)
                                        .textTheme
                                        .displayLarge!
                                        .apply(color: TColors.darkFontColor),
                                    subTitleTextStyle: Theme.of(context)
                                        .textTheme
                                        .displayLarge,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: TSizes.xs,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.only(
                                end: TSizes.sm),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //mainAxisSize: MainAxisSize.min,
                              children: [
                                FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: HorizontalIconText(
                                    icon: TImage.communicationIcon,
                                    title: TTexts.communicationLabel.tr,
                                    subTitle: communication,
                                    titleTextStyle: Theme.of(context)
                                        .textTheme
                                        .displayLarge!
                                        .apply(color: TColors.darkFontColor),
                                    subTitleTextStyle: Theme.of(context)
                                        .textTheme
                                        .displayLarge,
                                  ),
                                ),
                                FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: HorizontalIconText(
                                    icon: TImage.locationIcon,
                                    title: TTexts.locationLabel.tr,
                                    subTitle: location,
                                    titleTextStyle: Theme.of(context)
                                        .textTheme
                                        .displayLarge!
                                        .apply(color: TColors.darkFontColor),
                                    subTitleTextStyle: Theme.of(context)
                                        .textTheme
                                        .displayLarge,
                                  ),
                                ),
                                FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: HorizontalIconText(
                                    icon: TImage.valueIcon,
                                    title: TTexts.valueLabel.tr,
                                    subTitle: value,
                                    titleTextStyle: Theme.of(context)
                                        .textTheme
                                        .displayLarge!
                                        .apply(color: TColors.darkFontColor),
                                    subTitleTextStyle: Theme.of(context)
                                        .textTheme
                                        .displayLarge,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          PositionedDirectional(
            end: TSizes.md,
            child: StatusContainer(
              backgroundColor: Colors.white,
              child: HorizontalIconText(
                icon: TImage.locationIcon,
                title: apartmentLocation,
                isSub: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
