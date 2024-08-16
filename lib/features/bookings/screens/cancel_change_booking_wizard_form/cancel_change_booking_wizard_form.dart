import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/custom_shapes/containers/background_image_container.dart';
import '../../../../data/services/app_variables.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/device/device_utility.dart';
import '../../controllers/booking_controller/cancel_change_booking_wizard_form_controller.dart';
import 'widgets/cancel_reservation/cancel_reservation.dart';
import 'widgets/edit_reservation/edit_reservation.dart';
import 'widgets/stepper_item.dart';
import 'widgets/thanks/thanks.dart';
import 'widgets/why_you_cancel/why_you_cancel.dart';

class CancelChangeBookingWizardForm extends StatelessWidget {
  const CancelChangeBookingWizardForm({
    super.key,
    this.onContinuePressed,
    this.onBackPressed,
  });

  final VoidCallback? onContinuePressed, onBackPressed;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CancelChangeBookingWizardFormController());
    return PopScope(
      onPopInvoked: (value) => controller.currentPageIndex.value = 0,
      child: Scaffold(
         resizeToAvoidBottomInset: false,
        body: BackgroundImageContainer(
          child: Column(
            children: [
              /// Appbar
              TAppBar(
                leadingIcon: Get.locale == arabic
                    ? TImage.rightArrowIcon
                    : TImage.backArrow,
                leadingOnPressed: () {
                  controller.currentPageIndex.value = 0;
                  Get.back();
                },
                title: Text(TTexts.reservationLabel.tr),
              ),

              /// Stepper
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: TDeviceUtils.getScreenWidth(context) * 0.15,
                    vertical: TSizes.md),
                child: Obx(
                  () => Row(
                    children: [
                      StepperItem(
                        title: TTexts.selectOptionLabel.tr,
                        index: 0,
                        currentIndex: controller.currentPageIndex.value,
                        isLast: false,
                      ),
                      StepperItem(
                        title: TTexts.overviewLabel.tr,
                        index: 1,
                        currentIndex: controller.currentPageIndex.value,
                        isLast: false,
                      ),
                      StepperItem(
                        title: TTexts.reasonLabel.tr,
                        index: 2,
                        currentIndex: controller.currentPageIndex.value,
                        isLast: false,
                      ),
                      StepperItem(
                        title: TTexts.confirmationLabel.tr,
                        index: 3,
                        currentIndex: controller.currentPageIndex.value,
                        isLast: true,
                      ),
                    ],
                  ),
                ),
              ),

              /// Page View Widget
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: TSizes.sm),
                  child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: controller.pageController,
                    allowImplicitScrolling: false,
                    onPageChanged: controller.updatePageIndicator,
                    children: [
                      EditReservation(
                        onContinuePressed: () => controller.nextPage(),
                        onBackPressed: () => controller.back(),
                      ),
                      WhyYouCancel(
                        onContinuePressed: () => controller.nextPage(),
                        onBackPressed: () => controller.back(),
                      ),
                      CancelReservation(
                        onContinuePressed: () => controller.nextPage(),
                        onBackPressed: () => controller.back(),
                      ),

                      Thanks(
                        onPressed: () {
                          controller.currentPageIndex.value = 0;
                          Get.back();
                        },
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
