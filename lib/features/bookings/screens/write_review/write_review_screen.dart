import 'package:sejourne/data/services/exporter.dart';
import 'package:sejourne/features/bookings/screens/write_review/widgets/property_and_user_image.dart';
import 'package:sejourne/features/bookings/screens/write_review/widgets/review_input.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../controllers/write_review/write_review_controller.dart';

class WriteReviewScreen extends StatelessWidget {
  const WriteReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(WriteReviewController());
    return BackgroundImageContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.sm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// App bar
                TAppBar(
                  leadingOnPressed: () {
                    controller.currentPageIndex.value = 0;
                    Get.back();
                  },
                  leadingIcon:Get.locale==arabic?TImage.rightArrowIcon: TImage.backArrow,
                  title:  Text(TTexts.writeReview.tr),
                ),
                const SizedBox(
                  height: TSizes.sm,
                ),

                /// Property and user image and apartment title
                const PropertyAndUserImage(
                  rating: "4.5",
                  authorImage: TImage.lightAppLogoPNG,
                  propertyImage: TImage.prop1,
                  propertyName: "2BR (608) O2 Residence, JLT",
                  reviews: "298",
                  userImage: TImage.user2,
                ),

                const SizedBox(
                  height: TSizes.sm,
                ),

                /// center title
                Center(
                  child: Text(
                    TTexts.rateApartmentTitle.tr,
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: TSizes.md,
                ),

                ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: TDeviceUtils.getScreenHeight() * 0.25,
                    maxHeight: TDeviceUtils.getScreenHeight() * 0.60,
                  ),
                  child: PageView(
                    controller: controller.pageController,
                    onPageChanged: controller.updatePageIndicator,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      ReviewInput(
                        ratingValue: controller.cleanlinessRating,
                        ratingText: controller.cleanlinessRatingText,
                        formStateKey: controller.cleanlinessReviewFormKey,
                        icon: TImage.cleanlinessIcon,
                        title: TTexts.cleanlinessLabel.tr,
                        showBackButton: false,
                        images: controller.cleanlinessRatingImages,
                        textEditingController:
                            controller.cleanlinessEditingController,
                        onPressed: () {
                          if (!controller.cleanlinessReviewFormKey.currentState!
                              .validate()) {
                            return;
                          } else {
                            controller.nextPage();
                          }
                        },
                      ),
                      ReviewInput(
                        ratingValue: controller.comfortRating,
                        ratingText: controller.comfortRatingText,
                        formStateKey: controller.comfortReviewFormKey,
                        icon: TImage.comfortIcon,
                        title: TTexts.comfortLabel.tr,
                        showBackButton: true,
                        images: controller.comfortRatingImages,
                        textEditingController:
                            controller.comfortEditingController,
                        onPressed: () {
                          if (!controller.comfortReviewFormKey.currentState!
                              .validate()) {
                            return;
                          } else {
                            controller.nextPage();
                          }
                        },
                      ),
                      ReviewInput(
                        ratingValue: controller.checkInRating,
                        ratingText: controller.checkInRatingText,
                        formStateKey: controller.checkInReviewFormKey,
                        icon: TImage.keyIcon,
                        title: TTexts.checkInTitle.tr,
                        showBackButton: true,
                        images: controller.checkInRatingImages,
                        textEditingController:
                            controller.checkInEditingController,
                        onPressed: () {
                          if (!controller.checkInReviewFormKey.currentState!
                              .validate()) {
                            return;
                          } else {
                            controller.nextPage();
                          }
                        },
                      ),
                      ReviewInput(
                        ratingValue: controller.communicationRating,
                        ratingText: controller.communicationRatingText,
                        formStateKey: controller.communicationReviewFormKey,
                        icon: TImage.communicationIcon2,
                        title: TTexts.communicationLabel.tr,
                        showBackButton: true,
                        images: controller.communicationRatingImages,
                        textEditingController:
                            controller.communicationEditingController,
                        onPressed: () {
                          if (!controller
                              .communicationReviewFormKey.currentState!
                              .validate()) {
                            return;
                          } else {
                            controller.nextPage();
                          }
                        },
                      ),
                      ReviewInput(
                        ratingValue: controller.locationRating,
                        ratingText: controller.locationRatingText,
                        formStateKey: controller.locationReviewFormKey,
                        icon: TImage.locationIcon,
                        title: TTexts.locationLabel.tr,
                        showBackButton: true,
                        images: controller.locationRatingImages,
                        textEditingController:
                            controller.locationEditingController,
                        onPressed: () {
                          if (!controller.locationReviewFormKey.currentState!
                              .validate()) {
                            return;
                          } else {
                            controller.nextPage();
                          }
                        },
                      ),
                      ReviewInput(
                        ratingValue: controller.moneyValueRating,
                        ratingText: controller.moneyValueRatingText,
                        formStateKey: controller.moneyValueReviewFormKey,
                        icon: TImage.moneyIcon,
                        title: TTexts.valueForMoneyLabel.tr,
                        showBackButton: true,
                        images: controller.moneyValueRatingImages,
                        textEditingController:
                            controller.moneyValueEditingController,
                        onPressed: () {
                          if (!controller.moneyValueReviewFormKey.currentState!
                              .validate()) {
                            return;
                          } else {
                            controller.nextPage();
                          }
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
