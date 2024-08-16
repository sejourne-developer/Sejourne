import 'package:sejourne/common/widgets/buttons/primary_button.dart';
import 'package:sejourne/common/widgets/custom_shapes/containers/onboarding_background_container.dart';
import 'package:sejourne/data/services/exporter.dart';
import '../../../common/widgets/icons/circular_icon.dart';
import '../../../common/widgets/icons/dotted_circle_border_icon.dart';
import '../../../common/widgets/texts/custom_radio_text_button.dart';
import '../../../common/widgets/texts/horizontal_icon_text.dart';
import '../../../features/app/controllers/product_details/product_details_controller.dart';
import 'loaders.dart';

class GuestCounterPopUpForm extends StatelessWidget {
  const GuestCounterPopUpForm({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = ProductDetailsController.instance;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: TRoundedContainer(
          constraints: BoxConstraints(
              maxHeight: TDeviceUtils.getScreenHeight() * 0.84, minHeight: 56),
          width: double.infinity,
          // height: double.infinity,
          showBorder: false,
          margin: const EdgeInsets.symmetric(
              vertical: TSizes.appBarHeight, horizontal: TSizes.md),
          child: SingleChildScrollView(
            child: Column(
              children: [
                /// upper Circle
                Stack(
                  children: [
                    OnBoardingBackgroundContainer(
                      radius: TSizes.md,
                      height: TDeviceUtils.getScreenHeight() * 0.20,
                      child: const SizedBox(),
                    ),
                    const Align(
                      alignment: AlignmentDirectional.topCenter,
                      child: DottedCircleBorderIcon(
                        iconSize: TSizes.pinSize,
                        icon: TImage.guests,
                        borderColor: TColors.darkPrimaryBorderColor,
                      ),
                    ),
                    PositionedDirectional(
                        start: TDeviceUtils.getScreenWidth(context) * 0.5,
                        bottom: TSizes.md,
                        child: TRoundedContainer(
                          width: TSizes.iconLg,
                          height: TSizes.iconLg,
                          radius: 100,
                          child: Center(
                              child: Obx(() => Text(
                                  controller.totalCounter.value.toString()))),
                        )),
                  ],
                ),
                const SizedBox(
                  height: TSizes.md,
                ),
                Text(
                  TTexts.guestTitle.tr,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  height: TSizes.sm,
                ),
                Text(
                  TTexts.guestSubTitle.tr,
                  style: Theme.of(context).textTheme.labelMedium!.apply(
                      color: dark ? TColors.darkFontColor : TColors.darkGrey),
                ),

                Padding(
                  padding: const EdgeInsets.all(TSizes.md),
                  child: Row(
                    children: [
                      Flexible(
                          flex: 3,
                          child: HorizontalIconText(
                            icon: TImage.adultsIcon,
                            title: TTexts.adultsLabel.tr,
                            isSub: false,
                            iconColor:
                                dark ? TColors.darkIconColor : TColors.primary,
                            iconSize: TSizes.md,
                            titleTextStyle:
                                Theme.of(context).textTheme.labelMedium,
                          )),
                      Flexible(
                        flex: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TCircularIcon(
                              showBorder: false,
                              icon: TImage.minusIcon,
                              size: TSizes.sm,
                              backgroundColor: dark
                                  ? TColors.darkContainer
                                  : TColors.softGrey,
                              padding: TSizes.sm,
                              onPressed: () {
                                if (controller.adultsCounter.value == 0) {
                                  TLoaders.errorSnackBar(
                                    title: TTexts.errorTitle.tr,
                                    message: '${TTexts.minimumLabel.tr} 0',
                                  );
                                } else {
                                  controller.adultsCounter.value--;
                                  controller.total();
                                }
                              },
                            ),
                            Obx(() => Text(
                                controller.adultsCounter.value.toString())),
                            TCircularIcon(
                              showBorder: false,
                              icon: TImage.statusAddIcon,
                              size: TSizes.sm,
                              backgroundColor:
                                  dark ? TColors.black : TColors.grey2,
                              padding: TSizes.sm,
                              onPressed: () {
                                controller.adultsCounter.value++;
                                controller.total();
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(TSizes.md),
                  child: Row(
                    children: [
                      Flexible(
                        flex: 3,
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              TImage.childrenIcon,
                              height: TSizes.md,
                              width: TSizes.md,
                            ),
                            const SizedBox(
                              width: TSizes.xs,
                            ),
                            FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  TTexts.childrenLabel.tr,
                                  style: Theme.of(context).textTheme.bodySmall,
                                )),
                          ],
                        ),
                      ),
                      // Flexible(
                      //     flex: 3,
                      //     child: HorizontalIconText(
                      //       icon: TImage.childrenIcon,
                      //       title: "Children",
                      //       isSub: false,
                      //       iconColor: TColors.primary,
                      //       iconSize: TSizes.md,
                      //       titleTextStyle:
                      //           Theme.of(context).textTheme.labelMedium,
                      //     )),

                      Flexible(
                        flex: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TCircularIcon(
                              showBorder: false,
                              icon: TImage.minusIcon,
                              size: TSizes.sm,
                              padding: TSizes.sm,
                              backgroundColor: dark
                                  ? TColors.darkContainer
                                  : TColors.softGrey,
                              onPressed: () {
                                if (controller.childrenCounter.value == 0) {
                                  TLoaders.errorSnackBar(
                                    title: TTexts.errorTitle.tr,
                                    message: '${TTexts.minimumLabel.tr} 0',
                                  );
                                } else {
                                  controller.childrenCounter.value--;
                                  controller.total();
                                }
                              },
                            ),
                            Obx(() => Text(
                                controller.childrenCounter.value.toString())),
                            TCircularIcon(
                              showBorder: false,
                              icon: TImage.statusAddIcon,
                              size: TSizes.sm,
                              padding: TSizes.sm,
                              backgroundColor:
                                  dark ? TColors.black : TColors.grey2,
                              onPressed: () {
                                controller.childrenCounter.value++;
                                controller.total();
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
                  child: Divider(
                    thickness: 0.5,
                    color: Get.isDarkMode
                        ? TColors.darkPrimaryBorderColor
                        : TColors.lightPrimaryBorderColor,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(TSizes.md),
                  child: Row(
                    children: [
                      Flexible(
                          flex: 3,
                          child: HorizontalIconText(
                            icon: TImage.petsIcon,
                            title: TTexts.petsLabel.tr,
                            isSub: false,
                            iconColor:
                                dark ? TColors.darkIconColor : TColors.primary,
                            iconSize: TSizes.md,
                            titleTextStyle:
                                Theme.of(context).textTheme.labelMedium,
                          )),
                      Flexible(
                        flex: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(
                                  () => CustomRadioButton(
                                      spaceBetweenRadioAndText: TSizes.sm,
                                  text: TTexts.yesLabel.tr,
                                  index: 1,
                                  selectedIndex: controller.selectedPetOption.value,
                                  onPressed: () {
                                    controller.selectedPetOption.value = 1;
                                  }),
                            ),
                            Obx(
                                  () => CustomRadioButton(
                                  spaceBetweenRadioAndText: TSizes.sm,
                                  text: TTexts.noLabel.tr,
                                  index: 0,
                                  selectedIndex: controller.selectedPetOption.value,
                                  onPressed: () {
                                    controller.selectedPetOption.value = 0;
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                    padding: const EdgeInsetsDirectional.all(TSizes.md),
                    child: PrimaryButton(
                      loading: false.obs,
                      title: TTexts.saveLabel.tr,
                      onPressed: onPressed,
                    )),
                Padding(
                  padding: const EdgeInsetsDirectional.all(TSizes.md),
                  child: TextButton(
                    onPressed: () => Get.back(),
                    child: Text(
                      TTexts.cancelLabel.tr,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
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
