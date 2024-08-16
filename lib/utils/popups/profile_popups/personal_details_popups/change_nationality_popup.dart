import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:sejourne/data/services/exporter.dart';

import '../../general_popups/primary_popup_container.dart';

class ChangeNationalityPopUpForm extends StatelessWidget {
  const ChangeNationalityPopUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    List<String>? items = [
      "United States",
      "United Kingdom",
      "Japan",
      "Finland",
      "Zimbabwe",
      "Yemen",
      "United Arab Emirates"
    ];
    return Material(
      color: Colors.transparent,
      child: PrimaryPopupContainer(
        headIcon: TImage.flagIcon,
        title: TTexts.changeNationality.tr,
        subTitle: TTexts.changeYourNationality.tr,
        onPressed: () {
          Get.back();
        },
        buttonText: TTexts.updateLabel.tr,
        child: Padding(
          padding: const EdgeInsets.all(TSizes.md),
          child: CustomDropdown<String>.search(
            hintText: TTexts.nationality.tr,
            items: items,
            decoration: CustomDropdownDecoration(
                prefixIcon: SvgPicture.asset(
                  TImage.flagIcon,
                  height: TSizes.iconMd,
                  width: TSizes.iconMd,
                  colorFilter: ColorFilter.mode(
                      dark ? TColors.darkIconColor : TColors.lightIconColor,
                      BlendMode.srcIn),
                ),
                listItemDecoration: ListItemDecoration(
                    selectedColor:
                        dark ? TColors.dark : TColors.primary.withOpacity(0.3)),
                closedFillColor: dark ? TColors.dark : TColors.white,
                expandedFillColor: dark ? TColors.dark : TColors.white,
                searchFieldDecoration: SearchFieldDecoration(
                    fillColor: dark ? TColors.dark : TColors.white,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: dark
                                ? TColors.darkPrimaryBorderColor
                                : TColors.lightPrimaryBorderColor))),
                closedBorder: Border.all(
                    width: 1,
                    color: dark
                        ? TColors.darkPrimaryBorderColor
                        : TColors.lightPrimaryBorderColor)),
            excludeSelected: false,
            onChanged: (value) {
              //controller.selectedValue = value;
              debugPrint('changing value to: $value');
            },
          ),
        ),
      ),
    );
  }
}
