import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sejourne/common/widgets/appbar/appbar.dart';
import 'package:sejourne/common/widgets/layouts/stepper_layout.dart';
import 'package:sejourne/features/bookings/screens/booking_wizard_form/widgets/billing_address/billing_address.dart';
import 'package:sejourne/features/bookings/screens/booking_wizard_form/widgets/booking_summary/booking_summary.dart';
import 'package:sejourne/features/bookings/screens/booking_wizard_form/widgets/payments/payment_information.dart';
import 'package:sejourne/features/bookings/screens/booking_wizard_form/widgets/thanks/thanks.dart';

import '../../../../common/widgets/custom_shapes/containers/background_image_container.dart';
import '../../../../data/services/app_variables.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../controllers/booking_controller/booking_wizard_form_controller.dart';

class BookingWizardForm extends StatelessWidget {
  const BookingWizardForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BookingWizardFormController());

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
                title: Text(TTexts.myBookingsLabel.tr),
              ),

              /// Stepper
              StepperLayout(
                currentIndex: controller.currentPageIndex,
                titles: [
                  TTexts.summaryLabel.tr,
                  TTexts.addressLabel.tr,
                  TTexts.addressLabel.tr,
                  TTexts.thanksLabel.tr
                ],
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
                      /// Page 1 Booking Summary
                      BookingSummary(
                        onPressed: () {
                          controller.nextPage();
                        },
                      ),

                      PaymentInformation(
                        onContinuePressed: () => controller.nextPage(),
                        onBackPressed: () => controller.back(),
                      ),
                      BillingAddress(
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
