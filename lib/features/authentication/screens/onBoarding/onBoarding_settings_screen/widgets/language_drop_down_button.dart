import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sejourne/data/repositories/authentication_repository/authentication_repository.dart';
import 'package:sejourne/data/services/app_variables.dart';
import 'package:sejourne/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:sejourne/utils/helpers/helper_functions.dart';

import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/image_strings.dart';
import '../../../../../../utils/constants/text_strings.dart';
import '../../../../../../utils/local_storage/storage_utility.dart';

class LanguageDropDownButton extends GetView<OnBoardingController> {
  const LanguageDropDownButton({super.key});

  @override
  Widget build(BuildContext context) {
    final storage=TLocalStorage();
    final dark = THelperFunctions.isDarkMode(context);
    final List<Rx<String>> languageDropDownItems = [
      "${TTexts.english.tr} - ENG".obs,
      "${TTexts.french.tr} - FR".obs,
      "${TTexts.arabic.tr} - AR".obs,
    ];
    //final controller = OnBoardingController.instance;
    return SizedBox(
      width: double.infinity,
      child:  CustomDropdown<Rx<String>>.search(
          hintText: "${TTexts.english.tr} - ENG",
          items: languageDropDownItems,
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
            if (value == languageDropDownItems[0]) {
              AuthenticationRepository.selectedAppLanguage.value = value!.value;
              Get.updateLocale(english);
              storage.saveData('SELECTED_LANGUAGE', "ENG");
            } else if (value == languageDropDownItems[1]) {
              AuthenticationRepository.selectedAppLanguage.value = value!.value;
              Get.updateLocale(french);
              storage.saveData('SELECTED_LANGUAGE', "FR");
            } else {
              AuthenticationRepository.selectedAppLanguage.value = value!.value;
              Get.updateLocale(arabic);
              storage.saveData('SELECTED_LANGUAGE', "AR");
            }
            AuthenticationRepository.selectedAppLanguage.value = value.value;
          },
        ),

    );
  }
}
