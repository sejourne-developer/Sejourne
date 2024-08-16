import 'package:carousel_slider/carousel_slider.dart';
import 'package:sejourne/data/services/exporter.dart';
import 'package:sejourne/features/app/screens/property_details/property_details_screen.dart';
import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../common/widgets/images/rounded_image.dart';
import '../../../controllers/home/home_controller.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key,
    required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    final dark = THelperFunctions.isDarkMode(context);
    final locale = Get.locale;
    return Column(
      children: [
        CarouselSlider(
            options: CarouselOptions(
              initialPage: 0,
              autoPlay: true,
              viewportFraction: 0.8,
              height: 180,
              //pageSnapping: true,
              //enlargeCenterPage: true,
              scrollPhysics: const AlwaysScrollableScrollPhysics(),
              //enableInfiniteScroll: true,
              onPageChanged: (index, _) =>
                  controller.updatePageIndicator(index),
              padEnds: false,
            ),
            items: banners
                .map(
                  (url) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: TSizes.sm),
                    child: Stack(
                      children: [
                        /// Offer image
                        TRoundedImage(
                            isPromo: true,
                            onPressed: () =>
                                Get.to(() =>  PropertyDetailScreen(
                                  heroTag: "TPromoSliderHeroTag${controller.carousalCurrentIndex.value}",
                                )),
                            borderRadius: TSizes.md,
                            imageUrl: url),

                        Positioned(
                          left: TSizes.md,
                          top: TSizes.sm,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: locale.toString() == "ar"
                                ? CrossAxisAlignment.end
                                : CrossAxisAlignment.start,
                            children: [
                              TRoundedContainer(
                                showBorder: false,
                                backgroundColor: TColors.success,
                                padding: const EdgeInsets.all(TSizes.xs),
                                child: Text(
                                  'Limited Time!',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall!
                                      .apply(color: TColors.white),
                                ),
                              ),
                              const SizedBox(
                                height: TSizes.defaultSpace,
                              ),

                              Text(
                                "Get Special Offer",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .apply(color: TColors.white),
                              ),

                              RichText(
                                maxLines: 2,
                                text: TextSpan(
                                  text: "Up to",
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
                                      text: "on services",
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

                        Positioned(
                          left: TSizes.md,
                          bottom: TSizes.md,
                          child: Text(
                            "All Services Available | T&C Applied",
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .apply(color: TColors.white),
                          ),
                        ),

                        Positioned(
                          right: TSizes.md,
                          bottom: TSizes.md,
                          child: TRoundedContainer(
                            padding: const EdgeInsets.all(TSizes.xs),
                            isGradient: true,
                            showBorder: false,
                            child: Text(
                              'Claim Now',
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .apply(color: TColors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
                .toList()),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),

        Center(
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < banners.length; i++)
                  TCircularContainer(
                    width: TSizes.sm,
                    height: TSizes.sm,
                    margin: const EdgeInsets.only(right: 10),
                    backgroundColor: controller.carousalCurrentIndex.value == i
                        ? dark
                            ? TColors.darkPrimaryBorderColor
                            : TColors.primary
                        : dark
                            ? TColors.dark
                            : TColors.accent,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
