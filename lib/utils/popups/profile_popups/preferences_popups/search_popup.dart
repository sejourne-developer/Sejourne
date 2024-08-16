import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../constants/colors.dart';
import '../../../constants/image_strings.dart';
import '../../../constants/sizes.dart';
import '../../../constants/text_strings.dart';
import '../../../helpers/helper_functions.dart';
import '../../general_popups/primary_popup_container.dart';

class SearchPopup extends StatelessWidget {
  const SearchPopup({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    List<String> label = [
      TTexts.businessBayLabel,
      TTexts.downTownLabel,
      TTexts.dubaiHillsLabel,
      TTexts.dubaiMarinaLabel,
      TTexts.laCoteLabel,
      TTexts.businessBayLabel,
      TTexts.downTownLabel,
      TTexts.dubaiHillsLabel,
      TTexts.dubaiMarinaLabel,
      TTexts.laCoteLabel,
    ];
    return PrimaryPopupContainer(
      headIcon: TImage.searchIcon,
      title: TTexts.searchLabel.tr,
      subTitle: TTexts.searchLabel.tr,
      buttonText: TTexts.updateLabel.tr,
      onPressed: () {
        Get.back();

      },
      child: Padding(
        padding: const EdgeInsets.all(TSizes.md),
        child: CustomDropdown<String>.search(
          hintText: TTexts.locationRole.tr,
          items: label,
          searchHintText: TTexts.searchLabel.tr,
          decoration: CustomDropdownDecoration(

              expandedSuffixIcon: SvgPicture.asset(
                TImage.clearIcon,

                colorFilter: ColorFilter.mode(
                    dark ? TColors.darkIconColor : TColors.lightIconColor,
                    BlendMode.srcIn),
              ),
              closedSuffixIcon: SvgPicture.asset(
                TImage.arrowDownIcon,
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
            debugPrint('changing value to: $value');
          },
        ),
      ),
    );
  }
}
