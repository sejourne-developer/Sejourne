import 'package:animated_custom_dropdown/custom_dropdown.dart';
import '../../../data/services/exporter.dart';
import '../general_popups/primary_popup_container.dart';


class TranslatePopup extends StatelessWidget {
  const TranslatePopup({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    List<String> label = [
      "English",
      "Arabic",
      "French",
      "Urdo",
      "Germany",
    ];
    return PrimaryPopupContainer(
      headIcon: TImage.languageIcon,
      title: TTexts.translateMessage.tr,
      subTitle: TTexts.translateMessageSubTitle.tr,
      buttonText: TTexts.translateLabel.tr,
      subTitleTextStyle: Theme.of(context).textTheme.bodyMedium!.apply(color: THelperFunctions.isDarkMode(context)?TColors.darkFontColor:TColors.darkGrey),
      onPressed: () {
        Get.back();
      },
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(
            horizontal: TSizes.md, vertical: TSizes.md),
        child: Column(
          children: [
            Center(
              child: CustomDropdown<String>.search(
                hintText: TTexts.selectLanguage.tr,
                items: label,
                decoration: CustomDropdownDecoration(
                    headerStyle: Theme.of(context).textTheme.labelMedium,
                    hintStyle: Theme.of(context).textTheme.labelMedium,
                    expandedSuffixIcon: SvgPicture.asset(
                      TImage.clearIcon,
                      height: TSizes.iconXs,
                      width: TSizes.iconXs,
                      colorFilter: ColorFilter.mode(
                          dark ? TColors.darkIconColor : TColors.lightIconColor,
                          BlendMode.srcIn),
                    ),
                    closedSuffixIcon: SvgPicture.asset(
                      TImage.arrowDownIcon,
                      height: TSizes.iconXs,
                      width: TSizes.iconXs,
                      colorFilter: ColorFilter.mode(
                          dark ? TColors.darkIconColor : TColors.lightIconColor,
                          BlendMode.srcIn),
                    ),
                    closedFillColor: dark ? TColors.dark : TColors.white,
                    expandedFillColor: dark ? TColors.dark : TColors.white,
                    searchFieldDecoration: SearchFieldDecoration(
                        fillColor: dark ? TColors.dark : TColors.white,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: dark
                                    ? TColors.darkPrimaryBorderColor
                                    : TColors.lightPrimaryBorderColor))),
                    prefixIcon: SvgPicture.asset(
                      TImage.languageIcon,
                      height: TSizes.iconSm,
                      width: TSizes.iconSm,
                      colorFilter: ColorFilter.mode(
                          dark ? TColors.darkIconColor : TColors.primary,
                          BlendMode.srcIn),
                    ),
                    closedBorder: Border.all(
                        width: 1,
                        color: dark
                            ? TColors.darkPrimaryBorderColor
                            : TColors.lightPrimaryBorderColor)),
                excludeSelected: false,
                onChanged: (value) {
                  debugPrint('changing value to: $value');
                },
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
          ],
        ),
      ),
    );
  }
}
