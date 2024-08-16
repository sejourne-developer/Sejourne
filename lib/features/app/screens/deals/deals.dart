import 'package:sejourne/data/services/exporter.dart';
import 'package:sejourne/features/app/screens/property_details/property_details_screen.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/images/rounded_image.dart';

class DealsScreen extends StatelessWidget {
  const DealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = Get.locale;
    final List<String> deals = [
      TImage.prop1,
      TImage.promoBanner2,
      TImage.prop5,
      TImage.promoBanner1,
      TImage.prop8,
      TImage.promoBanner3,
      TImage.prop15,
      TImage.promoBanner2,
      TImage.prop10,
    ];
    return Scaffold(
      body: BackgroundImageContainer(
        child: Column(
          children: [
            const NetworkCheckerContainer(),

            /// App bar
             TAppBar(
              leadingIcon:Get.locale==arabic?TImage.rightArrowIcon: TImage.backArrow,
              title: Text(TTexts.deals.tr),
            ),

            /// Deals List
            SizedBox(
              height: TDeviceUtils.getScreenHeight() * 0.88,
              width: double.infinity,
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: deals.length,
                padding: const EdgeInsets.all(TSizes.sm),
                separatorBuilder: (_, index) => const SizedBox(
                  height: TSizes.md,
                ),
                itemBuilder: (_, index) => SizedBox(
                  width: double.infinity,
                  height: 160,
                  child: Stack(
                    children: [
                      TRoundedImage(
                          isPromo: true,
                          onPressed: () =>
                              Get.to(() =>  PropertyDetailScreen(
                                heroTag: "dealsHeroTag$index}",
                              )),
                          borderRadius: TSizes.md,
                          imageUrl: deals[index]),

                      PositionedDirectional(
                        start: TSizes.md,
                        top: TSizes.sm,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: locale == arabic
                              ? CrossAxisAlignment.end
                              : CrossAxisAlignment.start,
                          children: [
                            TRoundedContainer(
                              showBorder: false,
                              backgroundColor: TColors.green,
                              padding: const EdgeInsets.symmetric(vertical:TSizes.xs,horizontal: TSizes.sm),
                              child: Text(
                                TTexts.limitedLabel.tr,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .apply(color: TColors.white),
                              ),
                            ),
                            const SizedBox(
                              height: TSizes.defaultSpace,
                            ),
                            Text(
                              TTexts.getSpecialOfferLabel.tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .apply(color: TColors.white),
                            ),
                            RichText(
                              maxLines: 2,
                              text: TextSpan(
                                text: TTexts.upToLabel.tr,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .apply(color: TColors.white),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: " 40% ",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .apply(color: TColors.white),
                                  ),
                                  TextSpan(
                                    text: TTexts.onServicesLabel.tr,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall!
                                        .apply(color: TColors.white),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      PositionedDirectional(
                        start: TSizes.md,
                        bottom: TSizes.md,
                        child: Text(
                          TTexts.allServicesLabel.tr,
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .apply(color: TColors.white),
                        ),
                      ),

                      PositionedDirectional(
                        end: TSizes.md,
                        bottom: TSizes.md,
                        child: TRoundedContainer(
                          isGradient: true,
                          showBorder: false,
                          padding: const EdgeInsets.symmetric(vertical:TSizes.xs,horizontal: TSizes.sm),
                          child: Text(
                            TTexts.claimNowLabel.tr,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .apply(color: TColors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
