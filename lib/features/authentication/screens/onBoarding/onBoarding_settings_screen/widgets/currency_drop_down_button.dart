import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sejourne/utils/helpers/helper_functions.dart';
import '../../../../../../data/repositories/authentication_repository/authentication_repository.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/image_strings.dart';
import 'package:get/get.dart';

import '../../../../../../utils/constants/text_strings.dart';
import '../../../../../../utils/local_storage/storage_utility.dart';


class CurrencyDropDownButton extends StatelessWidget {
  const CurrencyDropDownButton({super.key});

  @override
  Widget build(BuildContext context) {
    final storage=TLocalStorage();
    final List<Rx<String>> currencyDropDownItems = [
      "${TTexts.aed.tr} - ${TTexts.aed.tr}".obs,
      "${TTexts.usd.tr} - \$".obs,
    ];    final dark = THelperFunctions.isDarkMode(context);
    return SizedBox(
      width: double.infinity,
      child:CustomDropdown<Rx<String>>.search(
          hintText: "${TTexts.aed.tr} - ${TTexts.aed.tr}",
          items: currencyDropDownItems,
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
            if (value == currencyDropDownItems[0]) {
              AuthenticationRepository.selectedAppCurrency.value = value!.value;
              storage.saveData('SELECTED_CURRENCY', "AED");
            } else if (value == currencyDropDownItems[1]) {
              AuthenticationRepository.selectedAppCurrency.value = value!.value;
              storage.saveData('SELECTED_CURRENCY', "USD");
            }
          },
        ),
    );
  }
}
