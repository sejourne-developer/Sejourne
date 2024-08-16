import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sejourne/common/styles/shadows.dart';
import 'package:sejourne/features/app/controllers/product_details/product_details_controller.dart';
import 'package:sejourne/utils/constants/image_strings.dart';
import 'package:sejourne/utils/helpers/helper_functions.dart';
import 'package:sejourne/utils/local_storage/storage_utility.dart';
import 'package:sejourne/utils/popups/general_popups/login_popup_container.dart';
import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/popups/general_popups/calender_popup.dart';
import '../../../../../utils/popups/general_popups/guest_counter_popup.dart';
import '../../../../../utils/validators/validation.dart';
import '../../../../bookings/screens/booking_wizard_form/booking_wizard_form.dart';

class TBottomAddToCart extends StatelessWidget {
  const TBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final token=TLocalStorage().readData("TOKEN");
    final controller = ProductDetailsController.instance;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.all(TSizes.sm),
          height: 72,
          decoration: BoxDecoration(
              color: THelperFunctions.isDarkMode(context)
                  ? TColors.dark
                  : TColors.light,
              boxShadow: [TShadowStyle.verticalProductShadow],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(TSizes.cardRadiusLg),
                topRight: Radius.circular(TSizes.cardRadiusLg),
              )),
          child: Row(
            children: [
              /// check in text field
              Expanded(
                flex: 2,
                child: TextFormField(
                  readOnly: true,
                  onTap: () {
                    /// Check in popup calender
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CalenderPopUpForm(
                            title: TTexts.checkInTitle.tr,
                            subTitle: TTexts.checkInSubTitle.tr,
                            buttonText: TTexts.saveLabel.tr,
                            initialSelectedDate: controller.checkInDate.value,
                            onPressed: () {
                              controller.checkInDateText.text =
                                  controller.selectedDate;
                              controller.enableDepartDate.value = true;
                              Get.back();
                            },
                            onSelectedDate: (arg) {
                              controller.checkOutDateText.text = "";
                              controller.checkOutDate.value=arg.value;
                              // controller.checkOutDate.value=controller.checkOutDate.value.add(const Duration(days: 3));
                              dynamic date =
                                  THelperFunctions.dateSelection(arg);
                              debugPrint("********************** Date $date ###########${controller.checkInDate.value}");
                              controller.selectedDate =
                                  date.toString().split(" ")[0];
                            },
                          );
                        });
                  },
                  controller: controller.checkInDateText,
                  style: Theme.of(context).textTheme.labelMedium,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(TSizes.md),
                      labelText: TTexts.checkInTitle.tr,
                      labelStyle: Theme.of(context).textTheme.labelSmall),
                  validator: (value) => TValidator.validateEmptyText(
                      TTexts.checkInTitle.tr, value!),
                ),
              ),
              const SizedBox(
                width: TSizes.xs,
              ),

              /// check Out text field
              Expanded(
                flex: 2,
                child: TextFormField(
                  readOnly: true,
                  onTap: () {
                    /// if check in date selected
                    /// show Check out popup calender
                    controller.enableDepartDate.value
                        ? showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return CalenderPopUpForm(
                                title: TTexts.checkOutTitle.tr,
                                subTitle: TTexts.checkOutSubTitle.tr,
                                buttonText: TTexts.saveLabel.tr,
                                minDate: controller.checkOutDate.value,
                                initialSelectedDate: controller.checkOutDate.value,
                                onPressed: () {
                                  controller.checkOutDateText.text =
                                      controller.selectedDate;
                                  Get.back();
                                },
                                onSelectedDate: (arg) {
                                  dynamic date =
                                      THelperFunctions.dateSelection(arg);
                                  debugPrint(
                                      "********************** Date $date");
                                  controller.selectedDate =
                                      date.toString().split(" ")[0];
                                },
                              );
                            })

                        /// else show alert dialog
                        : THelperFunctions.showAlert(
                            TTexts.errorTitle.tr, TTexts.checkInError.tr);
                  },
                  controller: controller.checkOutDateText,
                  style: Theme.of(context).textTheme.labelMedium,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(TSizes.md),
                      labelText: TTexts.checkOutTitle.tr,
                      labelStyle: Theme.of(context).textTheme.labelSmall),
                  validator: (value) => TValidator.validateEmptyText(
                      TTexts.checkOutTitle.tr, value!),
                ),
              ),

              const SizedBox(
                width: TSizes.xs,
              ),

              /// Guest Text field
              Expanded(
                flex: 2,
                child: TextFormField(
                  readOnly: true,

                  /// Guest popup dialog
                  onTap: () => showDialog(
                    context: context,
                    builder: (context) => GuestCounterPopUpForm(
                      onPressed: () {
                        controller.guestText.text =
                            "${TTexts.adultsLabel.tr} ${ProductDetailsController.instance.adultsCounter.value.toString()}, ${TTexts.childrenLabel.tr} ${ProductDetailsController.instance.childrenCounter.value.toString()}, ${TTexts.petsLabel.tr} ${ProductDetailsController.instance.selectedPetOption.value}";
                        Get.back();
                      },
                    ),
                  ),
                  controller: controller.guestText,
                  style: Theme.of(context).textTheme.displayMedium,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(TSizes.sm),
                      labelText: TTexts.guestTitle.tr,
                      labelStyle: Theme.of(context).textTheme.labelSmall,),
                  validator: (value) => TValidator.validateEmail(value),
                ),
              ),

              const SizedBox(
                width: TSizes.xs,
              ),

              Expanded(
                  flex: 1,
                  child: TRoundedContainer(
                    isGradient: true,
                    gradient: TColors.radialGradient,
                    showBorder: false,
                    margin: const EdgeInsets.symmetric(vertical: TSizes.xs ),
                    padding: EdgeInsets.zero,
                    radius: 10,
                    child: ElevatedButton(
                      onPressed: () =>token != null? Get.to(() => const BookingWizardForm()):showDialog(
                        context: context,
                        builder: (context)=>const LoginPopUpContainer()
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          side: const BorderSide(color: Colors.transparent),
                          padding: EdgeInsets.zero),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            TImage.bookNow,
                            height: TSizes.iconMd,
                          ),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: TSizes.sm),
                              child: Text(
                                TTexts.bookNowLabel.tr,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .apply(color: TColors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ],
    );
  }
}

