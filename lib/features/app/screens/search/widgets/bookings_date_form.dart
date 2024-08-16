import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sejourne/data/services/exporter.dart';
import 'package:sejourne/features/app/controllers/search/search_controller.dart';

import '../../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../../common/widgets/texts/dotted_center_title.dart';
import '../../../../../common/widgets/texts/horizontal_check_box_text.dart';
import '../../../../../common/widgets/texts/horizontal_icon_text.dart';
import '../../../../../utils/popups/general_popups/calender_popup.dart';
import '../../../../../utils/popups/general_popups/guest_counter_popup.dart';
import '../../../../../utils/validators/validation.dart';
import '../../../controllers/drawers/drawer_controller.dart';
import '../../../controllers/product_details/product_details_controller.dart';

class BookingsDateForm extends StatelessWidget {
  const BookingsDateForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controllerFilter = MyDrawerController.instance;
    final controller = SSearchController.instance;
    List<String> items = [
      TTexts.apartmentLabel.tr,
      TTexts.villaLabel.tr,
      TTexts.cabinLabel.tr,
      TTexts.houseLabel.tr
    ];
    List<Rx<bool>> itemsCheckBoxValue = [
      controllerFilter.apartmentCheckBox,
      controllerFilter.villaCheckBox,
      controllerFilter.cabinCheckBox,
      controllerFilter.houseCheckBox
    ];
    List<String> items2 = [
      TTexts.studioLabel.tr,
      "1 ${TTexts.bedRoomLabel.tr}",
      "2 ${TTexts.bedRoomLabel.tr}",
      "3 ${TTexts.bedRoomLabel.tr}",
      "4 ${TTexts.bedRoomLabel.tr}",
      "5 ${TTexts.bedRoomLabel.tr}"
    ];
    List<Rx<bool>> items2CheckBoxValue = [
      controllerFilter.studioCheckBox,
      controllerFilter.bR1CheckBox,
      controllerFilter.bR2CheckBox,
      controllerFilter.bR3CheckBox,
      controllerFilter.bR4CheckBox,
      controllerFilter.bR5CheckBox,
    ];

    List<String> items3 = [
      TTexts.swimmingPoolLabel.tr,
      TTexts.parkingLabel.tr,
      TTexts.petFriendlyLabel.tr,
      TTexts.gymLabel.tr
    ];
    List<Rx<bool>> items3CheckBoxValue = [
      controllerFilter.swimmingPoolCheckBox,
      controllerFilter.parkingPoolCheckBox,
      controllerFilter.petCheckBox,
      controllerFilter.gymCheckBox
    ];

    return Form(
      key: controller.bookingsFormKey,
      child: Column(
        children: [
          Row(
            children: [
              /// =========================================== check in text field ========================================= ///
              Expanded(
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
                            minDate: controller.checkInDate.value,
                            initialSelectedDate: controller.checkInDate.value,
                            onPressed: () {
                              controller.arriveDate.text =
                                  controller.selectedDate;
                              controller.enableDepartDate.value = true;
                              Get.back();
                            },
                            onSelectedDate: (arg) {
                              controller.departDate.text = "";
                              controller.checkOutDate.value = arg.value;
                              dynamic date =
                                  THelperFunctions.dateSelection(arg);
                              debugPrint("********************** Date $date");
                              controller.selectedDate =
                                  date.toString().split(" ")[0];
                            },
                          );
                        });
                  },
                  controller: controller.arriveDate,
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: TSizes.sm + 4, horizontal: TSizes.sm + 4),
                      child: SvgPicture.asset(
                        TImage.searchBookingIcon,
                        colorFilter: ColorFilter.mode(
                            THelperFunctions.isDarkMode(context)
                                ? TColors.darkIconColor
                                : TColors.primary,
                            BlendMode.srcIn),
                        width: 8,
                        height: 8,
                      ),
                    ),
                    contentPadding: const EdgeInsets.all(TSizes.md),
                    hintText: TTexts.checkInTitle.tr,
                  ),
                  validator: (value) => TValidator.validateEmptyText(
                      TTexts.checkInTitle.tr, value!),
                ),
              ),
              const SizedBox(
                width: TSizes.spaceBtwInputField,
              ),

              /// ======================================================= check Out text field ======================================= ///
              Expanded(
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
                                initialSelectedDate:
                                    controller.checkOutDate.value,
                                onPressed: () {
                                  controller.departDate.text =
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
                  controller: controller.departDate,
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: TSizes.sm + 4, horizontal: TSizes.sm + 4),
                      child: SvgPicture.asset(
                        TImage.searchBookingIcon,
                        colorFilter: ColorFilter.mode(
                            THelperFunctions.isDarkMode(context)
                                ? TColors.darkIconColor
                                : TColors.primary,
                            BlendMode.srcIn),
                        width: 8,
                        height: 8,
                      ),
                    ),
                    contentPadding: const EdgeInsets.all(TSizes.md),
                    hintText: TTexts.checkOutTitle.tr,
                  ),
                  validator: (value) => TValidator.validateEmptyText(
                      TTexts.checkOutTitle.tr, value!),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputField,
          ),

          /// ===================================================== Guest Text  ================================================= ///
          TextFormField(
            readOnly: true,

            /// Guest popup dialog
            onTap: () => showDialog(
              context: context,
              builder: (context) => GuestCounterPopUpForm(
                onPressed: () {
                  controller.guests.text =
                      "${TTexts.adultsLabel.tr} ${ProductDetailsController.instance.adultsCounter.value.toString()}, ${TTexts.childrenLabel.tr} ${ProductDetailsController.instance.childrenCounter.value.toString()}, ${TTexts.petsLabel.tr} ${ProductDetailsController.instance.selectedPetOption.value}";
                  Get.back();
                },
              ),
            ),
            controller: controller.guests,
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: TSizes.sm + 4, horizontal: TSizes.sm + 4),
                child: SvgPicture.asset(
                  TImage.guests,
                  colorFilter: ColorFilter.mode(
                      THelperFunctions.isDarkMode(context)
                          ? TColors.darkIconColor
                          : TColors.primary,
                      BlendMode.srcIn),
                  width: 8,
                  height: 8,
                ),
              ),
              hintText: TTexts.guestTitle.tr,
            ),
            validator: (value) => TValidator.validateEmail(value),
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),

          // this is the body which expands and collapses by height change
          Obx(() => AnimatedContainer(
                height: controller.currentHeight.value,
                width: double.infinity,
                curve: Curves.easeInOut,
                duration: const Duration(milliseconds: 500),
                color: Colors.transparent,
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  reverse: true,
                  physics: const NeverScrollableScrollPhysics(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      DottedCenterTitle(
                        dottedRoundedBorderTitle: true,
                        title: TTexts.propertyTypeLabel.tr,
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.symmetric(
                            horizontal: TSizes.sm),
                        child: TGridLayout(
                          crossAxisCount: 2,
                          mainAxisExtent: TSizes.lg,
                          itemCount: items.length,
                          itemBuilder: (_, index) => Obx(
                            () => GestureDetector(
                              onTap: () => itemsCheckBoxValue[index].value =
                                  !itemsCheckBoxValue[index].value,
                              child: HorizontalCheckBoxText(
                                  value: itemsCheckBoxValue[index].value,
                                  title: items[index],
                                  onChanged: (value) =>
                                      itemsCheckBoxValue[index].value =
                                          !itemsCheckBoxValue[index].value),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      DottedCenterTitle(
                        dottedRoundedBorderTitle: true,
                        title: TTexts.propertyTypeLabel.tr,
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.symmetric(
                            horizontal: TSizes.sm),
                        child: TGridLayout(
                          crossAxisCount: 2,
                          mainAxisExtent: TSizes.lg,
                          itemCount: items2.length,
                          itemBuilder: (_, index) => Obx(
                            () => GestureDetector(
                              onTap: () => items2CheckBoxValue[index].value =
                                  !items2CheckBoxValue[index].value,
                              child: HorizontalCheckBoxText(
                                value: items2CheckBoxValue[index].value,
                                title: items2[index],
                                onChanged: (value) => items2CheckBoxValue[index]
                                    .value = !items2CheckBoxValue[index].value,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      DottedCenterTitle(
                        dottedRoundedBorderTitle: true,
                        title: TTexts.priceRangeLabel.tr,
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: controllerFilter.minPriceController,
                              onChanged: (value) {
                                if (double.parse(value) > 10 &&
                                    controllerFilter.priceRangeEnd.value >
                                        double.parse(value)) {
                                  controllerFilter.priceRangeStart.value =
                                      double.parse(value);
                                }
                              },
                              decoration: InputDecoration(
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: TSizes.sm + 4,
                                      horizontal: TSizes.sm + 4),
                                  child: SvgPicture.asset(
                                    TImage.moneyIcon2,
                                    colorFilter: ColorFilter.mode(
                                        THelperFunctions.isDarkMode(context)
                                            ? TColors.darkIconColor
                                            : TColors.primary,
                                        BlendMode.srcIn),
                                    width: 8,
                                    height: 8,
                                  ),
                                ),
                                contentPadding: const EdgeInsets.all(TSizes.md),
                                hintText:
                                    controllerFilter.minPriceController.text,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: TSizes.md,
                          ),
                          Expanded(
                            child: TextFormField(
                                controller: controllerFilter.maxPriceController,
                                onChanged: (value) {
                                  if (double.parse(value) < 100000 &&
                                      controllerFilter.priceRangeStart.value <
                                          double.parse(value)) {
                                    controllerFilter.priceRangeEnd.value =
                                        double.parse(value);
                                  }
                                },
                                decoration: InputDecoration(
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: TSizes.sm + 4,
                                        horizontal: TSizes.sm + 4),
                                    child: SvgPicture.asset(
                                      TImage.moneyIcon2,
                                      colorFilter: ColorFilter.mode(
                                          THelperFunctions.isDarkMode(context)
                                              ? TColors.darkIconColor
                                              : TColors.primary,
                                          BlendMode.srcIn),
                                      width: 8,
                                      height: 8,
                                    ),
                                  ),
                                  contentPadding:
                                      const EdgeInsets.all(TSizes.md),
                                  hintText:
                                      controllerFilter.maxPriceController.text,
                                )),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      Obx(
                        () => RangeSlider(
                          activeColor: TColors.primary,
                          inactiveColor: TColors.grey2,
                          values: RangeValues(
                              controllerFilter.priceRangeStart.value,
                              controllerFilter.priceRangeEnd.value),
                          labels: RangeLabels(
                              controllerFilter.priceRangeStart.value.toString(),
                              controllerFilter.priceRangeEnd.value.toString()),
                          onChanged: (value) {
                            controllerFilter.priceRangeStart.value =
                                value.start;
                            controllerFilter.minPriceController.text =
                                value.start.toInt().toString();
                            controllerFilter.priceRangeEnd.value = value.end;
                            controllerFilter.maxPriceController.text =
                                value.end.toInt().toString();
                          },
                          min: 10.0,
                          max: 10000.0,
                        ),
                      ),
                      DottedCenterTitle(
                        dottedRoundedBorderTitle: true,
                        title: TTexts.ratingLabel.tr,
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      Obx(() => Text(
                            "${TTexts.minimumLabel.tr} ${controllerFilter.rating.value} ${TTexts.startsLabel.tr}",
                            style:
                                Theme.of(context).textTheme.bodyMedium!.apply(),
                          ),),
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      Obx(
                        () => RatingBar.builder(
                          initialRating: controllerFilter.rating.value,
                          minRating: 3,
                          itemSize: TSizes.iconMd,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: TSizes.xs),
                          itemBuilder: (context, _) => SvgPicture.asset(
                            TImage.starIcon,
                            colorFilter: const ColorFilter.mode(
                                TColors.green, BlendMode.srcIn),
                          ),
                          onRatingUpdate: (rating) {
                            controllerFilter.rating.value = rating;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      DottedCenterTitle(
                        dottedRoundedBorderTitle: true,
                        title: TTexts.amenitiesLabel.tr,
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.symmetric(
                            horizontal: TSizes.sm),
                        child: TGridLayout(
                          crossAxisCount: 2,
                          mainAxisExtent: TSizes.lg,
                          itemCount: items3.length,
                          itemBuilder: (_, index) => Obx(
                            () => GestureDetector(
                              onTap: () => items3CheckBoxValue[index].value =
                                  !items3CheckBoxValue[index].value,
                              child: HorizontalCheckBoxText(
                                  value: items3CheckBoxValue[index].value,
                                  title: items3[index],
                                  onChanged: (value) =>
                                      items3CheckBoxValue[index].value =
                                          !items3CheckBoxValue[index].value),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )),

          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),

          GestureDetector(
            onTap: () {
              controller.expandOnChanged(700);
            },
            child: FittedBox(
              child: Obx(
                () => HorizontalIconText(
                  title: controller.currentHeight.value > 0
                      ? TTexts.lessOptionsLabel.tr
                      : TTexts.advanceOptionsLabel.tr,
                  titleTextStyle: Theme.of(context).textTheme.bodyMedium,
                  iconSize: TSizes.iconSm,
                  icon: TImage.filterIcon,
                  isSub: false,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
