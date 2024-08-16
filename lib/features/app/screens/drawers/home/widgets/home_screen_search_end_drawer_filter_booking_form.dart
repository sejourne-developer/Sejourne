import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sejourne/common/widgets/layouts/grid_layout.dart';
import 'package:sejourne/data/services/exporter.dart';
import '../../../../../../common/widgets/texts/dotted_center_title.dart';
import '../../../../../../common/widgets/texts/horizontal_check_box_text.dart';
import '../../../../../../utils/popups/general_popups/calender_popup.dart';
import '../../../../../../utils/popups/general_popups/guest_counter_popup.dart';
import '../../../../../../utils/validators/validation.dart';
import '../../../../controllers/drawers/drawer_controller.dart';
import '../../../../controllers/product_details/product_details_controller.dart';

class HomeScreenSearchEndDrawerFilterBookingForm extends StatelessWidget {
  const HomeScreenSearchEndDrawerFilterBookingForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = MyDrawerController.instance;
    final dark = THelperFunctions.isDarkMode(context);

    List<String> items = [TTexts.apartmentLabel.tr, TTexts.villaLabel.tr, TTexts.cabinLabel.tr, TTexts.houseLabel.tr];
    List<Rx<bool>> itemsCheckBoxValue = [
      controller.apartmentCheckBox,
      controller.villaCheckBox,
      controller.cabinCheckBox,
      controller.houseCheckBox
    ];
    List<String> items2 = [TTexts.studioLabel.tr, "1 ${TTexts.bedRoomLabel.tr}", "2 ${TTexts.bedRoomLabel.tr}", "3 ${TTexts.bedRoomLabel.tr}", "4 ${TTexts.bedRoomLabel.tr}", "5 ${TTexts.bedRoomLabel.tr}"];
    List<Rx<bool>> items2CheckBoxValue = [
      controller.studioCheckBox,
      controller.bR1CheckBox,
      controller.bR2CheckBox,
      controller.bR3CheckBox,
      controller.bR4CheckBox,
      controller.bR5CheckBox,
    ];

    List<String> items3 = [TTexts.swimmingPoolLabel.tr, TTexts.parkingLabel.tr, TTexts.petFriendlyLabel.tr, TTexts.gymLabel.tr];
    List<Rx<bool>> items3CheckBoxValue = [
      controller.swimmingPoolCheckBox,
      controller.parkingPoolCheckBox,
      controller.petCheckBox,
      controller.gymCheckBox
    ];

    ///  Date
    return Form(
      key: controller.filterBookingsFormKey,
      child: Column(
        children: [
          ///============================================ Form section =====================================================///
          TextFormField(
            readOnly: true,
            onTap: () {
              /// Show check in popup calender
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CalenderPopUpForm(
                      title: TTexts.checkInTitle.tr,
                      subTitle: TTexts.checkInSubTitle.tr,
                      buttonText: TTexts.saveLabel.tr,
                      initialSelectedDate: controller.checkInDate.value,
                      onPressed: () {
                        controller.checkInDateController.text =
                            controller.selectedDate;
                        controller.enableDepartDate.value = true;
                        Get.back();
                      },
                      onSelectedDate: (arg) {
                        controller.checkOutDateController.text = "";
                        controller.checkOutDate.value=arg.value;
                        dynamic date = THelperFunctions.dateSelection(arg);
                        debugPrint("********************** Date $date");
                        controller.selectedDate = date.toString().split(" ")[0];
                      },
                    );
                  });
            },
            controller: controller.checkInDateController,
            style: Theme.of(context).textTheme.labelMedium,
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: TSizes.sm + 4, vertical: 8),
                child: SvgPicture.asset(
                  TImage.searchBookingIcon,
                  colorFilter: ColorFilter.mode(
                      dark ? TColors.darkIconColor : TColors.primary,
                      BlendMode.srcIn),
                ),
              ),
              fillColor: dark ? TColors.dark : TColors.light,
              filled: true,
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color:
                          dark ? TColors.darkPrimaryBorderColor : TColors.grey),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(TSizes.sm),
                  )),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color:
                          dark ? TColors.darkPrimaryBorderColor : TColors.grey),
                  borderRadius:
                      const BorderRadius.all(Radius.circular(TSizes.sm))),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color:
                          dark ? TColors.darkPrimaryBorderColor : TColors.grey),
                  borderRadius:
                      const BorderRadius.all(Radius.circular(TSizes.sm))),
              contentPadding: EdgeInsets.zero,
              hintText: TTexts.checkInTitle.tr,
            ),
            validator: (value) =>
                TValidator.validateEmptyText(TTexts.checkInTitle.tr, value!),
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputField,
          ),
          TextFormField(
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
                            controller.checkOutDateController.text =
                                controller.selectedDate;
                            Get.back();
                          },
                          onSelectedDate: (arg) {
                            dynamic date = THelperFunctions.dateSelection(arg);
                            debugPrint("********************** Date $date");
                            controller.selectedDate =
                                date.toString().split(" ")[0];
                          },
                        );
                      })

                  /// else show alert dialog
                  : THelperFunctions.showAlert(
                      TTexts.errorTitle.tr, TTexts.checkInError.tr);
            },
            style: Theme.of(context).textTheme.labelMedium,
            controller: controller.checkOutDateController,
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: TSizes.sm + 4, horizontal: TSizes.sm + 4),
                child: SvgPicture.asset(
                  TImage.searchBookingIcon,
                  colorFilter: ColorFilter.mode(
                      dark ? TColors.darkIconColor : TColors.primary,
                      BlendMode.srcIn),
                ),
              ),
              fillColor: dark ? TColors.dark : TColors.light,
              filled: true,
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color:
                          dark ? TColors.darkPrimaryBorderColor : TColors.grey),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(TSizes.sm),
                  )),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color:
                          dark ? TColors.darkPrimaryBorderColor : TColors.grey),
                  borderRadius:
                      const BorderRadius.all(Radius.circular(TSizes.sm))),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color:
                          dark ? TColors.darkPrimaryBorderColor : TColors.grey),
                  borderRadius:
                      const BorderRadius.all(Radius.circular(TSizes.sm))),
              contentPadding: EdgeInsets.zero,
              hintText: TTexts.checkOutTitle.tr,
            ),
            validator: (value) =>
                TValidator.validateEmptyText(TTexts.checkOutTitle.tr, value!),
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputField,
          ),
          TextFormField(
            readOnly: true,
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return GuestCounterPopUpForm(
                      onPressed: () {
                        controller.guests.text = ProductDetailsController
                            .instance.totalCounter.value
                            .toString();
                        Get.back();
                      },
                    );
                  });
            },
            controller: controller.guests,
            style: Theme.of(context).textTheme.labelMedium,
            decoration: InputDecoration(
              fillColor: dark ? TColors.dark : TColors.light,
              filled: true,
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color:
                          dark ? TColors.darkPrimaryBorderColor : TColors.grey),
                  borderRadius:
                      const BorderRadius.all(Radius.circular(TSizes.sm))),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color:
                          dark ? TColors.darkPrimaryBorderColor : TColors.grey),
                  borderRadius:
                      const BorderRadius.all(Radius.circular(TSizes.sm))),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color:
                          dark ? TColors.darkPrimaryBorderColor : TColors.grey),
                  borderRadius:
                      const BorderRadius.all(Radius.circular(TSizes.sm))),
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: TSizes.md, horizontal: TSizes.sm + 4),
                child: SvgPicture.asset(
                  TImage.guests,
                  height: 4,
                  width: 4,
                  colorFilter: ColorFilter.mode(
                      dark ? TColors.darkIconColor : TColors.primary,
                      BlendMode.srcIn),
                ),
              ),
              contentPadding: EdgeInsets.zero,
              hintText: TTexts.guestTitle.tr,
            ),
            validator: (value) => TValidator.validateEmail(value),
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),

          ///============================================ Property Type section1 =====================================================///
           DottedCenterTitle(
            dottedRoundedBorderTitle: true,
            title: TTexts.propertyTypeLabel.tr,
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          TGridLayout(
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
                    onChanged: (value) => itemsCheckBoxValue[index].value =
                        !itemsCheckBoxValue[index].value),
              ),
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),

          ///============================================ Rooms and Beds section =====================================================///
           DottedCenterTitle(
            dottedRoundedBorderTitle: true,
            title: TTexts.roomsAndBeds.tr,
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          TGridLayout(
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
                  onChanged: (value) => items2CheckBoxValue[index].value =
                      !items2CheckBoxValue[index].value,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),

          ///============================================ Price Range section =====================================================///
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
                child: TRoundedContainer(
                  radius: TSizes.xs,
                  padding: const EdgeInsetsDirectional.all(TSizes.xs),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: SvgPicture.asset(
                            TImage.moneyIcon2,
                            height: TSizes.md,
                            width: TSizes.md,
                          )),
                      const SizedBox(
                        width: TSizes.xs,
                      ),
                      Expanded(
                        flex: 9,
                        child: TextField(
                          controller: controller.minPriceController,
                          style: Theme.of(context).textTheme.labelSmall!,
                          onChanged: (value) {
                            if (double.parse(value) > 10 &&
                                controller.priceRangeEnd.value >
                                    double.parse(value)) {
                              controller.priceRangeStart.value =
                                  double.parse(value);
                            }
                          },
                          decoration: InputDecoration(
                              constraints:
                                  const BoxConstraints(maxHeight: TSizes.lg),
                              contentPadding: EdgeInsets.zero,
                              focusedBorder:
                                  const OutlineInputBorder().copyWith(
                                borderSide: BorderSide.none,
                              ),
                              enabledBorder:
                                  const OutlineInputBorder().copyWith(
                                borderSide: BorderSide.none,
                              ),
                              hintText: TTexts.minPriceLabel.tr,
                              hintStyle:
                                  Theme.of(context).textTheme.labelSmall!),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: TSizes.xs,
              ),
              Expanded(
                child: TRoundedContainer(
                  radius: TSizes.xs,
                  padding: const EdgeInsetsDirectional.all(TSizes.xs),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: SvgPicture.asset(
                            TImage.moneyIcon2,
                            height: TSizes.md,
                            width: TSizes.md,
                          )),
                      const SizedBox(
                        width: TSizes.xs,
                      ),
                      Expanded(
                        flex: 9,
                        child: TextFormField(
                          controller: controller.maxPriceController,
                          style: Theme.of(context).textTheme.labelSmall!,
                          onChanged: (value) {
                            if (double.parse(value) < 100000 &&
                                controller.priceRangeStart.value <
                                    double.parse(value)) {
                              controller.priceRangeEnd.value =
                                  double.parse(value);
                            }
                          },
                          decoration: InputDecoration(
                              constraints:
                                  const BoxConstraints(maxHeight: TSizes.lg),
                              contentPadding: EdgeInsets.zero,
                              focusedBorder:
                                  const OutlineInputBorder().copyWith(
                                borderSide: BorderSide.none,
                              ),
                              enabledBorder:
                                  const OutlineInputBorder().copyWith(
                                borderSide: BorderSide.none,
                              ),
                              hintText: TTexts.maxPriceLabel.tr,
                              hintStyle:
                                  Theme.of(context).textTheme.labelSmall!),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          /// Price Range slider
          Obx(
            () => RangeSlider(
              activeColor: TColors.primary,
              inactiveColor: TColors.grey2,
              values: RangeValues(controller.priceRangeStart.value,
                  controller.priceRangeEnd.value),
              labels: RangeLabels(controller.priceRangeStart.value.toString(),
                  controller.priceRangeEnd.value.toString()),
              onChanged: (value) {
                controller.priceRangeStart.value = value.start;
                controller.minPriceController.text =
                    value.start.toInt().toString();
                controller.priceRangeEnd.value = value.end;
                controller.maxPriceController.text =
                    value.end.toInt().toString();
              },
              min: 10.0,
              max: 10000.0,
            ),
          ),

          ///============================================= Rating section ==================================================///
           DottedCenterTitle(
            dottedRoundedBorderTitle: true,
            title: TTexts.ratingLabel.tr,
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          Obx(() => Text(
            "${TTexts.minimumLabel.tr} ${controller.rating.value} ${TTexts.startsLabel.tr}",
            style:
            Theme.of(context).textTheme.bodyMedium!.apply(),
          )),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          Obx(
                () => RatingBar.builder(
              initialRating: controller.rating.value,
              minRating: 1,
              itemSize: TSizes.iconMd,
              direction: Axis.horizontal,
              allowHalfRating: true,
              glow: false,
              itemCount: 5,
              itemPadding:
              const EdgeInsets.symmetric(horizontal: TSizes.xs),
              itemBuilder: (context, _) => SvgPicture.asset(
                TImage.starIcon,
                colorFilter: const ColorFilter.mode(
                    TColors.green, BlendMode.srcIn),
              ),
              onRatingUpdate: (rating) {
                controller.rating.value = rating;
              },
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),

          ///=============================================== Amenities section ==================================================///
           DottedCenterTitle(
            dottedRoundedBorderTitle: true,
            title: TTexts.amenitiesLabel.tr,
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          TGridLayout(
            crossAxisCount: 2,
            mainAxisExtent: TSizes.lg,
            itemCount: items3.length,
            itemBuilder: (_, index) => Obx(
              () => GestureDetector(
                onTap: ()=>items3CheckBoxValue[index].value =
                !items3CheckBoxValue[index].value,
                child: HorizontalCheckBoxText(
                    value: items3CheckBoxValue[index].value,
                    title: items3[index],
                    onChanged: (value) => items3CheckBoxValue[index].value =
                        !items3CheckBoxValue[index].value),
              ),
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          )
        ],
      ),
    );
  }
}
