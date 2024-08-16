
import 'package:animate_do/animate_do.dart';

import '../../../common/widgets/appbar/appbar.dart';
import '../../../common/widgets/icons/circular_icon.dart';
import '../../../common/widgets/layouts/list_layout.dart';
import '../../../common/widgets/texts/dotted_center_title.dart';
import '../../../common/widgets/texts/horizontal_title_subtitle_with_space.dart';
import '../../../data/services/exporter.dart';
import '../../../features/bookings/screens/myBooking/widgets/charge_details_table_row.dart';

class BookingDetailsPopup extends StatelessWidget {
  const BookingDetailsPopup({super.key,this.margin=const EdgeInsetsDirectional.only(start: TSizes.md),  this.ignoreAppBar=false, this.physics,  this.showBorder=true, this.radius=TSizes.md,});
  final EdgeInsetsGeometry margin;
  final bool ignoreAppBar,showBorder;
  final ScrollPhysics? physics;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    List<String> guestDetailsTitle = [
      "${TTexts.name.tr}:",
      "${TTexts.email.tr}:",
      "${TTexts.email.tr}:",
      "${TTexts.phone.tr}:",
      "${TTexts.phone.tr}:",
      "${TTexts.phone.tr}:",
      "${TTexts.address.tr}:",
    ];
    List<String> guestDetailsSubTitle = [
      "Catalin Pustai",
      "catalin@business.com",
      "catalinpustai@gmail.com",
      "+1 303-548-1234",
      "+971 58 123 4567",
      "+971 58 7654 321",
      "7 Glittering Sky, Aliso Viejo, CA, 92656",
    ];
    List<String> bookingDetailsTitle = [
      "${TTexts.statusLabel.tr}:",
      "${TTexts.propertyLabel.tr}:",
      "${TTexts.partySizeLabel.tr}:",
      "${TTexts.currencyLabel.tr}:",
      "${TTexts.paymentMethodLabel.tr}:",
      "${TTexts.listingSiteLabel.tr}:",
      "${TTexts.dateLabel.tr}:",
    ];
    List<String> bookingDetailsSubTitle = [
      "Okay",
      "Studio (806) at Dubai Arch (JLT)",
      "1 Adult",
      "AED",
      "Credit Card",
      "Airbnb",
      "30-04-2024 - 30-05-2024",
    ];
    List<String> financialDetailsTitle = [
      "${TTexts.totalChargedLabel.tr}:",
      "${TTexts.totalPaidLabel.tr}:",
      "${TTexts.totalRefundedLabel.tr}:",
      "${TTexts.totalOwedLabel.tr}:",
      "${TTexts.hostFeesLabel.tr}:",
      "${TTexts.netChargesLabel.tr}:",
      "${TTexts.netPaymentsLabel.tr}:",
    ];
    List<String> financialDetailsSubTitle = [
      "11,386.09 AED",
      "11,386.09 AED",
      "0.00",
      "0.00",
      "1,331.21 AED",
      "10,054.88 AED",
      "10,054.88 AED",
    ];

    List<String> column1 = [
      TTexts.itemLabel.tr,
      TTexts.rentLabel.tr,
      TTexts.surchargeLabel.tr,
      TTexts.taxLabel.tr,
      TTexts.taxLabel.tr,
    ];

    List<String> column2 = [
      TTexts.descriptionLabel.tr,
      TTexts.rentLabel.tr,
      TTexts.oneBedroomApartmentCleaningFeeLabel.tr,
      TTexts.dubaiTourismTaxLabel.tr,
      TTexts.vatLabel.tr,
    ];
    List<String> column3 = [
      TTexts.amountLabel.tr,
      "10,386.75",
      "180.00",
      "300.00",
      "5%",
    ];
    List<String> column4 = [
      TTexts.commLabel.tr,
      "17%",
      "0%",
      "",
      "",
    ];
    List<String> column5 = [
      TTexts.expLabel.tr,
      "",
      "180.00",
      "",
      "",
    ];
    return ElasticIn(
      duration: const Duration(milliseconds: 500),
      child: TRoundedContainer(
        margin: margin,
        radius: radius,
        showBorder: showBorder,
        width: double.infinity,
        height: double.infinity,
        child:  SingleChildScrollView(
            physics: physics ?? const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(TSizes.sm),
              child: Column(
                children: [
                  ignoreAppBar?const SizedBox(): TAppBar(
                    title:  Text(TTexts.overviewLabel.tr),
                    showBackArrow: false,
                    actions: [
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
                          child: TCircularIcon(
                            icon: TImage.clearIcon,
                            onPressed: () => Get.back(),
                          )),
                    ],
                  ),
                  /// Dotted Title
                  DottedCenterTitle(
                    title: TTexts.guestsDetailsLabel.tr,
                    borderColor: dark
                        ? TColors.lightPrimaryBorderColor
                        : TColors.primary,
                    dottedRoundedBorderTitle: true,
                  ),

                  ListLayout(
                    itemCount: guestDetailsTitle.length,
                    padding: const EdgeInsetsDirectional.symmetric(
                        vertical: TSizes.sm),
                    itemBuilder: (_, index) =>
                        HorizontalTitleSubtitleWithDottedDivider(
                      title: guestDetailsTitle[index],
                      subTitle: guestDetailsSubTitle[index],
                    ),
                  ),

                  /// Dotted Title
                  DottedCenterTitle(
                    title: TTexts.bookingDetailsLabel.tr,
                    borderColor: dark
                        ? TColors.lightPrimaryBorderColor
                        : TColors.primary,
                    dottedRoundedBorderTitle: true,
                  ),

                  ListLayout(
                    itemCount: bookingDetailsTitle.length,
                    padding: const EdgeInsetsDirectional.symmetric(
                        vertical: TSizes.sm),
                    itemBuilder: (_, index) =>
                        HorizontalTitleSubtitleWithDottedDivider(
                      title: bookingDetailsTitle[index],
                      subTitle: bookingDetailsSubTitle[index],
                    ),
                  ),

                  /// Dotted Title
                  DottedCenterTitle(
                    title: TTexts.financialDetailsLabel.tr,
                    borderColor: dark
                        ? TColors.lightPrimaryBorderColor
                        : TColors.primary,
                    dottedRoundedBorderTitle: true,
                  ),

                  ListLayout(
                    itemCount: 4,
                    padding: const EdgeInsetsDirectional.symmetric(
                        vertical: TSizes.sm),
                    itemBuilder: (_, index) =>
                        HorizontalTitleSubtitleWithDottedDivider(
                      title: financialDetailsTitle[index],
                      subTitle: financialDetailsSubTitle[index],
                    ),
                  ),

                  /// Dotted Title
                  DottedCenterTitle(
                    title: TTexts.chargesDetailsLabel.tr,
                    borderColor: dark
                        ? TColors.lightPrimaryBorderColor
                        : TColors.primary,
                    dottedRoundedBorderTitle: true,
                  ),

                  ConstrainedBox(
                    constraints: const BoxConstraints(
                        maxHeight: double.infinity, minHeight: 56.0),
                    child: ListView.separated(
                      itemCount: column1.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsetsDirectional.symmetric(
                          vertical: TSizes.sm),
                      separatorBuilder: (_, index) => const SizedBox(
                        height: TSizes.sm,
                      ),
                      itemBuilder: (_, index) => ChargeDetailsTableRow(
                        isLast: index == column1.length - 1 ? true : false,
                        isFirst: index == 0 ? true : false,
                        column1: column1[index],
                        column2: column2[index],
                        column3: column3[index],
                        column4: column4[index],
                        column5: column5[index],
                      ),
                    ),
                  ),

                  /// Dotted Title
                  DottedCenterTitle(
                    title: TTexts.activityDetailsLabel.tr,
                    borderColor: dark
                        ? TColors.lightPrimaryBorderColor
                        : TColors.primary,
                    dottedRoundedBorderTitle: true,
                  ),
                  const SizedBox(
                    height: TSizes.sm,
                  ),
                  bulletText("${TTexts.aprLabel.tr} 10, 24 - ${TTexts.theBookingWasEnteredLabel.tr}"),
                  bulletText(
                      "${TTexts.aprLabel.tr} 10, 24 - ${TTexts.collectedOfLabel.tr} د.إ. 819.34 ${TTexts.fromCreditCardLabel.tr}."),
                  bulletText(
                      "${TTexts.aprLabel.tr} 10, 24 - ${TTexts.collectedOfLabel.tr} د.إ. 10,566.75 ${TTexts.fromCreditCardLabel.tr}."),
                  bulletText(
                      "${TTexts.aprLabel.tr} 10, 24 - ${TTexts.collectedOfDepositLabel.tr} د.إ. 1,000.00 ${TTexts.fromCreditCardVisaLabel.tr} ***7297."),
                ],
              ),
            ),
          ),

      ),
    );
  }

  Widget bulletText(String text) => Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.xs),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text.rich(
                TextSpan(children: [
                  TextSpan(
                    text: '\u2022  ',
                    style: Theme.of(Get.context!)
                        .textTheme
                        .bodyLarge!
                        .apply(color: TColors.primary),
                  ),
                  TextSpan(
                      text: "${text.split('-')[0]}-",
                      style: Theme.of(Get.context!)
                          .textTheme
                          .labelMedium!
                          .apply(color: TColors.primary)),
                  TextSpan(
                      text: text.split('-')[1],
                      style: Theme.of(Get.context!)
                          .textTheme
                          .labelMedium!
                          .apply(color: TColors.grey2)),
                ]),
                softWrap: true,
              ),
            ),
          ],
        ),
      );
}
