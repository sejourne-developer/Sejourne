import '../../../common/widgets/texts/vertical_title_sub_title_widget.dart';
import '../../../data/services/exporter.dart';
import '../general_popups/primary_popup_container.dart';

class BookingCheckOutPopUp extends StatelessWidget {
  const BookingCheckOutPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return PrimaryPopupContainer(
      headIcon: TImage.bookingCheckOutIcon,
      title: TTexts.bookingCheckOutTitle.tr,
      subTitle: TTexts.bookingCheckOutSubTitle.tr,
      buttonText: TTexts.checkOutNow.tr,
      onPressed: () {
        Get.back();
      },
      child: Padding(
        padding: const EdgeInsetsDirectional.all(TSizes.md),
        child: Column(
          children: [
            TRoundedContainer(
              width: double.infinity,
              radius: 10,
              backgroundColor: dark ? TColors.dark : TColors.lightContainer,
              padding: const EdgeInsetsDirectional.all(TSizes.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VerticalTitleSubTitleWidget(
                    title: "${TTexts.propertyName.tr}: ",
                    subTitle: "Ocean View Villa",
                    titleStyle: Theme.of(context).textTheme.labelMedium,
                    subTitleStyle: Theme.of(context).textTheme.labelMedium!.apply(
                        color: dark ? TColors.darkFontColor : TColors.darkGrey),
                  ),
                  const SizedBox(
                    height: TSizes.sm,
                  ),
                  VerticalTitleSubTitleWidget(
                    title: "${TTexts.bookingDate.tr}: ",
                    subTitle: "August 15 - August 20, 2024",
                    titleStyle: Theme.of(context).textTheme.labelMedium,
                    subTitleStyle: Theme.of(context).textTheme.labelMedium!.apply(
                        color: dark ? TColors.darkFontColor : TColors.darkGrey),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  TTexts.pleaseTakeMoment.tr,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                InkWell(
                  onTap: (){},
                  child: Text(
                    " ${TTexts.rules.tr}",
                    style: Theme.of(context).textTheme.labelLarge!.apply(
                        color: dark ? TColors.darkFontColor : TColors.primary),
                  ),
                ),
              ],

            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  TTexts.and.tr,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                InkWell(
                  onTap: (){},
                  child: Text(
                    " ${TTexts.termsAndConditions.tr} ",
                    style: Theme.of(context).textTheme.labelLarge!.apply(
                        color: dark ? TColors.darkFontColor : TColors.primary),
                  ),
                ),
                Text(
                  TTexts.forStay.tr,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
