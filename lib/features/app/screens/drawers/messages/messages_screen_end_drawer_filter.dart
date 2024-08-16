import 'package:sejourne/common/widgets/custom_shapes/dropDown/custom_drop_down_field.dart';
import 'package:sejourne/data/services/exporter.dart';
import 'package:sejourne/features/app/screens/drawers/messages/widgets/messages_screen_search_end_drawer_filter_form.dart';
import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../common/widgets/texts/dotted_center_title.dart';
import '../../../../../utils/popups/general_popups/calender_popup.dart';
import '../../../../../utils/validators/validation.dart';
import '../../../controllers/drawers/drawer_controller.dart';
import '../../../../../common/widgets/texts/horizontal_icon_text.dart';
import '../../search/widgets/drop_down_location_field.dart';

class MessageScreenEndDrawerFilter extends StatelessWidget {
  const MessageScreenEndDrawerFilter({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = MyDrawerController.instance;
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      height: double.infinity,
      color: dark ? TColors.black : TColors.white,
      child: SingleChildScrollView(
        child: Stack(
          children: [
            /// footer background image
            PositionedDirectional(
              bottom: 10,
              start: 10,
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: TDeviceUtils.getBottomNavigationBarHeight()),
                child: Image.asset(
                  dark
                      ? TImage.drawerDarkBackground
                      : TImage.drawerLightBackground,
                  fit: BoxFit.cover,
                  // height: 800,
                  // width: 100,
                ),
              ),
            ),

            /// upper Circle
            PositionedDirectional(
              top: -300,
              start: -TDeviceUtils.getScreenWidth(context) * 0.29,
              child: TCircularContainer(
                backgroundColor: dark ? TColors.dark : TColors.primary,
                padding: TSizes.defaultSpace,
                child: Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: FittedBox(
                    // height: 56,
                    // width: 72,
                    child: HorizontalIconText(
                        iconColor: THelperFunctions.isDarkMode(context)
                            ? TColors.darkIconColor
                            : TColors.white,
                        titleTextStyle: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .apply(
                                color: THelperFunctions.isDarkMode(context)
                                    ? TColors.darkFontColor
                                    : TColors.white),
                        isSub: false,
                        iconSize: TSizes.iconSm,
                        icon: TImage.filterIcon,
                        title: "Filter"),
                  ),
                ),
              ),
            ),

            /// footer Circle
            PositionedDirectional(
                bottom: -300,
                start: -TDeviceUtils.getScreenWidth(context) * 0.29,
                child: TCircularContainer(
                  backgroundColor: dark ? TColors.dark : TColors.primary,
                  padding: TSizes.spaceBtwSections,
                  child: Align(
                    alignment: AlignmentDirectional.topCenter,
                    child: Text(
                      "Copyright 2024 Sejourne\nwww.sejourne.ae",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall!
                          .apply(color: TColors.white),
                    ),
                  ),
                )),

            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),

            Padding(
              padding: TSpacingStyle.paddingWithAppBarHeight2,
              child: Column(
                children: [
                  const SizedBox(
                    height: TSizes.spaceBtwSections * 2,
                  ),

                  /// Booking Form
                  const MessagesScreenSearchEndDrawerFilterForm(),

                  ///=============================================== Listing section ==================================================///
                  const DottedCenterTitle(
                    dottedRoundedBorderTitle: true,
                    title: "Listing",
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),

                  /// Listing Drop down Field
                  CustomDropDownField(
                    hintText: "Select listing",
                    prefixIcon: TImage.propertiesIcon,
                    height: 40,
                    items: const [
                      "Studio (804) at Dubai Arch (JLT)",
                      "Studio (806) at Dubai Arch (JLT)",
                      "1BR (212C) at Diamond Views 3 (JVC )",
                      "1BR (205) at The Polo Residence (Meydan)",
                    ],
                    iconSize: TSizes.iconXs,
                    hintTextStyle: Theme.of(context).textTheme.labelMedium,
                    onChanged: (val) {},
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwInputField,
                  ),

                  ///=============================================== Area section ==================================================///
                  const DottedCenterTitle(
                    dottedRoundedBorderTitle: true,
                    title: "Area",
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),

                  /// Listing Drop down Field
                  DropDownLocationField(
                    height: 40,
                    iconSize: TSizes.iconXs,
                    hintTextStyle: Theme.of(context).textTheme.labelMedium,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwInputField,
                  ),

                  ///=============================================== Check In section ==================================================///
                  const DottedCenterTitle(
                    dottedRoundedBorderTitle: true,
                    title: "Check In",
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),

                  /// Check In Field
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
                                dynamic date =
                                    THelperFunctions.dateSelection(arg);
                                debugPrint("********************** Date $date");
                                controller.selectedDate =
                                    date.toString().split(" ")[0];
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
                              color: dark
                                  ? TColors.darkPrimaryBorderColor
                                  : TColors.grey),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(TSizes.sm),
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: dark
                                  ? TColors.darkPrimaryBorderColor
                                  : TColors.grey),
                          borderRadius: const BorderRadius.all(
                              Radius.circular(TSizes.sm))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: dark
                                  ? TColors.darkPrimaryBorderColor
                                  : TColors.grey),
                          borderRadius: const BorderRadius.all(
                              Radius.circular(TSizes.sm))),
                      contentPadding: EdgeInsets.zero,
                      hintText: "Arrive",
                    ),
                    validator: (value) =>
                        TValidator.validateEmptyText('Arrive Date', value!),
                  ),

                  const SizedBox(
                    height: TSizes.spaceBtwInputField,
                  ),

                  ///=============================================== Check Out section ==================================================///
                  const DottedCenterTitle(
                    dottedRoundedBorderTitle: true,
                    title: "Check Out",
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),

                  /// Check out Field
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
                                  title: "Check Out",
                                  subTitle: "Please select check out date",
                                  buttonText: "Save",
                                  //initialSelectedDate: ,
                                  onPressed: () {
                                    controller.checkOutDateController.text =
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
                              "Wrong", "Please Select Check In First");
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
                              color: dark
                                  ? TColors.darkPrimaryBorderColor
                                  : TColors.grey),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(TSizes.sm),
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: dark
                                  ? TColors.darkPrimaryBorderColor
                                  : TColors.grey),
                          borderRadius: const BorderRadius.all(
                              Radius.circular(TSizes.sm))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: dark
                                  ? TColors.darkPrimaryBorderColor
                                  : TColors.grey),
                          borderRadius: const BorderRadius.all(
                              Radius.circular(TSizes.sm))),
                      contentPadding: EdgeInsets.zero,
                      hintText: "Depart",
                    ),
                    validator: (value) =>
                        TValidator.validateEmptyText('Depart Date', value!),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwInputField,
                  ),

                  ///=============================================== Team section ==================================================///
                  const DottedCenterTitle(
                    dottedRoundedBorderTitle: true,
                    title: "Team",
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),

                  /// Listing Drop down Field
                  const CustomDropDownField(
                    items: [
                      "John Smith",
                      "Allyah Yattabare",
                      "Catalin Pustai",
                      "Alexander  Maryukov",
                      "Dinkar Notani",
                      "Mansour Zedan",
                      "Aleena Jack",
                    ],
                    height: 40,
                    iconSize: TSizes.iconXs,
                    hintText: "Select user",
                    prefixIcon: TImage.profileIcon,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwInputField,
                  ),

                  /// Filter Button
                  TRoundedContainer(
                    width: double.infinity,
                    height: TSizes.defaultSpace * 1.5,
                    isGradient: true,
                    showBorder: false,
                    radius: TSizes.sm,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(padding: EdgeInsets.zero),
                      onPressed: () => Get.back(),
                      child: Text(
                        "Filter Now",
                        style: Theme.of(context).textTheme.labelLarge!.apply(
                            color:
                                dark ? TColors.darkFontColor : TColors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections * 4,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
