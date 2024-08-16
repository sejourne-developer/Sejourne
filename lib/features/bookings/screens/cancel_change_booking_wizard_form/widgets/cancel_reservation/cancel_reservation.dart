import 'package:sejourne/common/widgets/buttons/primary_button.dart';
import 'package:sejourne/common/widgets/custom_shapes/containers/property_container.dart';
import 'package:sejourne/common/widgets/texts/horizontal_title_sub_title_widget.dart';
import 'package:sejourne/features/bookings/controllers/booking_controller/cancel_change_booking_wizard_form_controller.dart';
import 'package:sejourne/features/bookings/screens/booking_wizard_form/widgets/booking_summary/widgets/property_details.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../../../common/widgets/icons/dotted_circle_border_icon.dart';
import '../../../../../../common/widgets/texts/section_heading_with_edit_icon.dart';
import '../../../../../../data/services/exporter.dart';
import '../../../../../../utils/popups/general_popups/calender_popup.dart';
import '../../../../../../utils/popups/general_popups/guest_counter_popup.dart';
import '../../../../../app/controllers/product_details/product_details_controller.dart';

class CancelReservation extends StatelessWidget {
  const CancelReservation({
    super.key,
    this.onContinuePressed,
    this.onBackPressed,
  });

  final VoidCallback? onContinuePressed, onBackPressed;

  @override
  Widget build(BuildContext context) {
    final controller = CancelChangeBookingWizardFormController.instance;
    final darkMode = THelperFunctions.isDarkMode(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Column(
          children: [
            Text(
             controller.selectOption.value==0? TTexts.changeReservationTitle.tr:TTexts.cancelReservationTitle.tr,
              style: Theme.of(context).textTheme.titleMedium,
            ),

            /// ====================================== Property Details section ==============================/////
            SectionHeadingWithEditIcon(
              title: TTexts.propertyDetailsLabel.tr,
              showEditButton: controller.selectOption.value==0?true:false,
              onPressed: () => Get.bottomSheet(
                backgroundColor:
                    darkMode ? TColors.darkContainer : TColors.white,
                isScrollControlled: true,
                ignoreSafeArea: false,
                SizedBox(
                  height: TDeviceUtils.getScreenHeight() * 0.85,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(TSizes.sm),
                          child: TSearchContainer(
                            text: TTexts.searchLabel.tr,
                            isTextField: true,
                          ),
                        ),
                        const SizedBox(
                          height: TSizes.md,
                        ),
                        ConstrainedBox(
                          constraints: const BoxConstraints(
                              minHeight: 56, maxHeight: double.infinity),
                          child: ListView.separated(
                              shrinkWrap: true,
                              padding: const EdgeInsetsDirectional.only(
                                  end: TSizes.sm),
                              physics: const NeverScrollableScrollPhysics(),
                              separatorBuilder: (_, index) => const SizedBox(
                                    height: TSizes.sm,
                                  ),
                              itemBuilder: (_, index) => PropertyWidget(
                                    onPressed: () => Get.back(),
                                    propertyImage: TImage.prop1,
                                    index: index,
                                    isFav: false.obs,
                                    com: false.obs,
                                heroTag: "CancelReservationHeroTag",
                                  ),
                              itemCount: 5),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const PropertyDetails(
              propertyImage: TImage.property,
            ),
            SectionHeadingWithEditIcon(
              title: TTexts.bookingDetailsLabel.tr,
              showEditButton: controller.selectOption.value==0?true:false,
              onPressed: () => showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CalenderPopUpForm(
                      title: TTexts.checkInTitle.tr,
                      subTitle: TTexts.checkInSubTitle.tr,
                      buttonText: TTexts.saveLabel.tr,
                      dateRangePickerSelectionMode:
                          DateRangePickerSelectionMode.range,
                      endSelectedDate: controller.checkOutDate.value,
                      initialSelectedDate: controller.checkInDate.value,
                      onPressed: () => Get.back(),
                      onSelectedDate: (arg) {
                        dynamic date = THelperFunctions.dateSelection(arg);
                        debugPrint("********************** Date $date");
                        controller.checkInDateString.value =
                            date.toString().split(" ")[0];
                        controller.checkOutDateString.value =
                            date.toString().split(" ")[2];
                      },
                    );
                  }),
            ),
            SizedBox(
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(
                    flex: 2,
                    child: SizedBox(
                      height: TSizes.pinSize,
                      width: TSizes.pinSize,
                      child: DottedCircleBorderIcon(
                        padding: 0,
                        icon: TImage.searchBookingIcon,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.only(start: TSizes.md),
                      child: Obx(
                        () => HorizontalTitleSubTitleWidget(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          title: TTexts.checkInTitle.tr,
                          titleStyle: Theme.of(context).textTheme.labelLarge,
                          subTitle: controller.checkInDateString.value,
                          subTitleStyle: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .apply(
                                  color: darkMode
                                      ? TColors.darkFontColor
                                      : TColors.lightIconColor),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    //flex: 1,
                    child: Column(
                      children: List.generate(
                        150 ~/ 5,
                        (index) => Expanded(
                          child: Container(
                            color: index % 2 == 0
                                ? Colors.transparent
                                : darkMode
                                    ? TColors.grey2
                                    : TColors.primary,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Obx(
                      () => HorizontalTitleSubTitleWidget(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        title: TTexts.checkOutTitle.tr,
                        titleStyle: Theme.of(context).textTheme.labelLarge,
                        subTitle: controller.checkOutDateString.value,
                        subTitleStyle: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .apply(
                                color: darkMode
                                    ? TColors.darkFontColor
                                    : TColors.lightIconColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SectionHeadingWithEditIcon(
              title: TTexts.guestsDetailsLabel.tr,
              showEditButton: controller.selectOption.value==0?true:false,
              onPressed: () => showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return GuestCounterPopUpForm(
                      onPressed: () {
                        controller.adultsString.value = ProductDetailsController
                            .instance.adultsCounter.value
                            .toString();
                        controller.childrenString.value =
                            ProductDetailsController
                                .instance.childrenCounter.value
                                .toString();
                        controller.totalString.value = ProductDetailsController
                            .instance.totalCounter.value
                            .toString();
                        Get.back();
                      },
                    );
                  }),
            ),
            SizedBox(
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(
                    flex: 3,
                    child: SizedBox(
                      height: TSizes.pinSize,
                      width: TSizes.pinSize,
                      child: DottedCircleBorderIcon(
                        padding: 0,
                        icon: TImage.guests,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.only(start: TSizes.md),
                      child: Obx(
                        () => HorizontalTitleSubTitleWidget(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          title: TTexts.adultsLabel.tr,
                          titleStyle: Theme.of(context).textTheme.labelLarge,
                          subTitle: controller.adultsString.value,
                          subTitleStyle: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .apply(
                                  color: darkMode
                                      ? TColors.darkFontColor
                                      : TColors.lightIconColor),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    //flex: 1,
                    child: Column(
                      children: List.generate(
                        150 ~/ 5,
                        (index) => Expanded(
                          child: Container(
                            color: index % 2 == 0
                                ? Colors.transparent
                                : darkMode
                                    ? TColors.grey2
                                    : TColors.primary,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Obx(
                      () => HorizontalTitleSubTitleWidget(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        title: TTexts.childrenLabel.tr,
                        titleStyle: Theme.of(context).textTheme.labelLarge,
                        subTitle: controller.childrenString.value,
                        subTitleStyle: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .apply(
                                color: darkMode
                                    ? TColors.darkFontColor
                                    : TColors.lightIconColor),
                      ),
                    ),
                  ),
                  Expanded(
                    //flex: 1,
                    child: Column(
                      children: List.generate(
                        150 ~/ 5,
                        (index) => Expanded(
                          child: Container(
                            color: index % 2 == 0
                                ? Colors.transparent
                                : darkMode
                                    ? TColors.grey2
                                    : TColors.primary,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Obx(
                      () => HorizontalTitleSubTitleWidget(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        title: TTexts.totalLabel.tr,
                        titleStyle: Theme.of(context).textTheme.labelLarge,
                        subTitle: controller.totalString.value,
                        subTitleStyle: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .apply(
                                color: darkMode
                                    ? TColors.darkFontColor
                                    : TColors.lightIconColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SectionHeadingWithEditIcon(
                title: TTexts.priceDetailsLabel.tr,
                showEditButton: false,
                onPressed: () {}),
            ConstrainedBox(
              constraints: const BoxConstraints(
                  maxHeight: double.infinity, minHeight: 56),
              child: ListView.separated(
                itemCount: 2,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (_, index) => const SizedBox(
                  height: TSizes.xs,
                ),
                itemBuilder: (_, index) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      index == 0
                          ? TTexts.cancellationFee.tr
                          : TTexts.refundAmount.tr,
                      style: Theme.of(context).textTheme.bodyMedium!.apply(
                          color: darkMode
                              ? TColors.darkFontColor
                              : TColors.lightIconColor),
                    ),
                    Text(
                      index == 0
                          ? "0.0 AED"
                          : "500.0 AED",
                      style: Theme.of(context).textTheme.labelLarge!.apply(
                          color: darkMode
                              ? TColors.darkFontColor
                              : TColors.darkerGrey),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems*2,
            ),
            PrimaryButton(
              loading: false.obs,
              title: TTexts.sContinue.tr,
              onPressed: onContinuePressed,
            ),


            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),

            TextButton(
                onPressed: onBackPressed,
                child: Text(
                  TTexts.keepReservation.tr,
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color:
                          darkMode ? TColors.darkFontColor : TColors.darkGrey),
                )),

            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
          ],
        ),
      ),
    );
  }
}
