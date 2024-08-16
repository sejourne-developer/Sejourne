import 'package:readmore/readmore.dart';
import '../../../../common/widgets/custom_shapes/containers/status_container.dart';
import '../../../../common/widgets/texts/section_header.dart';
import '../../../../data/services/exporter.dart';
import '../../../personalization/screens/reviews/reviews_screen.dart';
import '../../controllers/product_details/product_details_controller.dart';
import 'widgets/bottom_add_to_cart_widget.dart';
import 'widgets/details_widget.dart';
import 'widgets/features_widget.dart';
import 'widgets/image_slider_section/property_detail_image_slider.dart';
import 'widgets/property_details_gallery_widget.dart';
import 'widgets/property_details_mini_map.dart';
import 'widgets/property_recommendation_widget.dart';
import 'widgets/rating_and_review_section/property_reviews.dart';
import 'widgets/summary_widget.dart';

class PropertyDetailScreen extends StatelessWidget {
  const PropertyDetailScreen({super.key, required this.heroTag});

  final String heroTag;

  @override
  Widget build(BuildContext context) {
    Get.put(ProductDetailsController());
    List<String> banners = [
      TImage.prop1,
      TImage.prop2,
      TImage.prop3,
      TImage.prop5,
      TImage.prop6,
    ];

    //final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: const TBottomAddToCart(),
      body: BackgroundImageContainer(
        child: InteractiveViewer(
          panEnabled: true,
          maxScale: 4,
          minScale: 0.5,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const NetworkCheckerContainer(),
                SizedBox(
                  height: TDeviceUtils.getAppBarHeight(),
                ),

                /// -- Product Image Slider
                PropertyImageSlider(
                  banners: banners,
                  heroTage: heroTag,
                ),

                /// Product Details
                Padding(
                  padding: const EdgeInsets.only(
                      right: TSizes.sm,
                      left: TSizes.sm,
                      bottom: TSizes.sm,
                      top: TSizes.defaultSpace),
                  child: Column(
                    children: [
                      /// -- Summary Button
                      const Summary(),
                      const SizedBox(
                        height: TSizes.spaceBtwSections,
                      ),

                      /// -- About this Listing
                      TSectionHeading(
                        title: TTexts.aboutThisListing.tr,
                        showActionButton: false,
                      ),
                      const SizedBox(
                        height: TSizes.sm,
                      ),
                      ReadMoreText(
                        TTexts.propertyDescription.tr,
                        trimLines: 5,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .apply(color: TColors.darkGrey,),
                        trimCollapsedText: TTexts.showMoreLabel.tr,
                        trimExpandedText: TTexts.lessLabel.tr,

                        moreStyle: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.primary),
                        lessStyle:Theme.of(context).textTheme.labelLarge!.apply(color: TColors.darkFontColor),
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwSections,
                      ),

                      /// -- Details
                      const DetailsWidget(),
                      const SizedBox(
                        height: TSizes.spaceBtwSections,
                      ),

                      /// -- Gallery
                      PropertyDetailsGalleryWidget(banners: banners,),
                      const SizedBox(
                        height: TSizes.spaceBtwSections,
                      ),

                      /// -- features
                      const FeaturesWidget(),
                      const SizedBox(
                        height: TSizes.spaceBtwSections,
                      ),

                      /// -- Mini Map
                      const PropertyDetailsMiniMap(),
                      const SizedBox(
                        height: TSizes.spaceBtwSections,
                      ),

                      /// --Overall Rating Reviews Section
                      const PropertyReviewsWidget(),

                      GestureDetector(
                        onTap: () => Get.to(() => const ReviewsScreen()),
                        child: StatusContainer(
                          padding: const EdgeInsetsDirectional.all(TSizes.md),
                          child: Center(
                            child: Text(
                              TTexts.viewMoreReviews.tr,
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: TSizes.spaceBtwSections,
                      ),

                      /// -- recommendations
                      PropertyRecommendationWidget(banners: banners,),

                      const SizedBox(
                        height: TSizes.appBarHeight * 2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
