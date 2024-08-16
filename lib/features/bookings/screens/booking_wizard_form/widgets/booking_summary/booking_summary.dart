import 'package:sejourne/common/widgets/buttons/primary_button.dart';
import 'package:sejourne/common/widgets/custom_shapes/containers/property_container.dart';
import 'package:sejourne/common/widgets/texts/horizontal_title_sub_title_widget.dart';
import 'package:sejourne/features/bookings/screens/booking_wizard_form/widgets/booking_summary/widgets/property_details.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../../../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../../../common/widgets/icons/dotted_circle_border_icon.dart';
import '../../../../../../common/widgets/texts/section_heading_with_edit_icon.dart';
import '../../../../../../data/services/exporter.dart';
import '../../../../../../utils/popups/general_popups/calender_popup.dart';
import '../../../../../../utils/popups/general_popups/guest_counter_popup.dart';
import '../../../../controllers/booking_controller/booking_wizard_form_controller.dart';
import '../../../../../app/controllers/product_details/product_details_controller.dart';


class BookingSummary extends StatelessWidget {
  const BookingSummary({
    super.key,
    this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Column(
          children: [
            Text(
              TTexts.bookingDetailsLabel.tr,
              style: Theme.of(context).textTheme.titleMedium,
            ),

            /// ====================================== Property Details section ==============================/////
            SectionHeadingWithEditIcon(
              title: TTexts.propertyDetailsLabel.tr,
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
                          constraints: const BoxConstraints(minHeight: 56,maxHeight: double.infinity),
                          child: ListView.separated(
                            shrinkWrap: true,
                              padding: const EdgeInsetsDirectional.only(end: TSizes.sm),
                              physics: const NeverScrollableScrollPhysics(),
                              separatorBuilder: (_,index)=>const SizedBox(height: TSizes.sm,),
                              itemBuilder: (_, index) => PropertyWidget(
                                onPressed: ()=>Get.back(),
                                    propertyImage: TImage.prop1,
                                    index: index,
                                    isFav: false.obs,
                                    com: false.obs,
                                heroTag: "BookingSummaryHeroTag$index",
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
              onPressed: () => showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CalenderPopUpForm(
                      title: TTexts.checkInTitle.tr,
                      subTitle: TTexts.checkInSubTitle.tr,
                      buttonText: TTexts.saveLabel.tr,
                      dateRangePickerSelectionMode:
                          DateRangePickerSelectionMode.range,
                      endSelectedDate: BookingWizardFormController
                          .instance.checkOutDate.value,
                      initialSelectedDate: BookingWizardFormController
                          .instance.checkInDate.value,
                      onPressed: () => Get.back(),
                      onSelectedDate: (arg) {
                        dynamic date = THelperFunctions.dateSelection(arg);
                        debugPrint("********************** Date $date");
                        BookingWizardFormController.instance.checkInDateString
                            .value = date.toString().split(" ")[0];
                        BookingWizardFormController.instance.checkOutDateString
                            .value = date.toString().split(" ")[2];
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
                          subTitle: BookingWizardFormController
                              .instance.checkInDateString.value,
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
                        subTitle: BookingWizardFormController
                            .instance.checkOutDateString.value,
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
              onPressed: () => showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return GuestCounterPopUpForm(
                      onPressed: () {
                        BookingWizardFormController
                                .instance.adultsString.value =
                            ProductDetailsController
                                .instance.adultsCounter.value
                                .toString();
                        BookingWizardFormController
                                .instance.childrenString.value =
                            ProductDetailsController
                                .instance.childrenCounter.value
                                .toString();
                        BookingWizardFormController.instance.totalString.value =
                            ProductDetailsController.instance.totalCounter.value
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
                          subTitle: BookingWizardFormController
                              .instance.adultsString.value,
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
                        subTitle: BookingWizardFormController
                            .instance.childrenString.value,
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
                        subTitle: BookingWizardFormController
                            .instance.totalString.value,
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
                itemCount: 3,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (_, index) => const SizedBox(
                  height: TSizes.xs,
                ),
                itemBuilder: (_, index) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      index == 1
                          ? "${TTexts.cleaningFeeLabel.tr} 150 AED / ${TTexts.nightLabel.tr}"
                          : index == 2
                              ? TTexts.taxLabel.tr
                              : "1300 AED x 3 ${TTexts.nightLabel.tr}",
                      style: Theme.of(context).textTheme.labelMedium!.apply(
                          color: darkMode
                              ? TColors.darkFontColor
                              : TColors.lightIconColor),
                    ),
                    Text(
                      index == 1
                          ? "450"
                          : index == 2
                              ? "30"
                              : "3,900 AED",
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
              height: TSizes.spaceBtwSections,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  TTexts.totalLabel.tr,
                  style: Theme.of(context).textTheme.labelLarge!.apply(
                      color: darkMode
                          ? TColors.darkFontColor
                          : TColors.lightIconColor),
                ),
                Text(
                  "4380 AED",
                  style: Theme.of(context).textTheme.labelLarge!.apply(
                      color: darkMode
                          ? TColors.darkFontColor
                          : TColors.darkerGrey),
                ),
              ],
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            PrimaryButton(
              loading: false.obs,
              title: TTexts.sContinue.tr,
              onPressed: onPressed,
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
          ],
        ),
      ),
    );
  }
}
