import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_button/group_button.dart';
import 'package:sejourne/utils/constants/text_strings.dart';

import '../../../../common/styles/shadows.dart';
import '../../../../common/widgets/icons/dotted_circle_border_icon.dart';
import '../../../constants/colors.dart';
import '../../../constants/image_strings.dart';
import '../../../constants/sizes.dart';
import '../../../device/device_utility.dart';
import '../../general_popups/primary_popup_container.dart';

class PropertyTypePopup extends StatelessWidget {
  const PropertyTypePopup({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> buttons = [
      TTexts.apartmentLabel.tr,
      TTexts.villaLabel.tr
    ]; //, TTexts.cabinLabel.tr, TTexts.houseLabel.tr
    List<String> icons = [TImage.apartmentIcon, TImage.villaIcon];
    return PrimaryPopupContainer(
      headIcon: TImage.searchIcon,
      title: TTexts.propertyLabel.tr,
      subTitle: TTexts.selectPropertyLabel.tr,
      buttonText: TTexts.saveLabel.tr,
      onPressed: () {
        Get.back();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.md),
        child: GroupButton<String>(
          options: const GroupButtonOptions(
            groupingType: GroupingType.wrap,
          ),
          buttons: buttons,
          buttonIndexedBuilder: (selected, propertyType, context) {
            return Container(
                padding:
                    const EdgeInsetsDirectional.symmetric(vertical: TSizes.md),
                width: TDeviceUtils.getScreenWidth(context) * 0.40,
                decoration: BoxDecoration(
                    color:
                        Get.isDarkMode ? TColors.darkContainer : TColors.white,
                    border: selected
                        ? Border.all(width: 2, color: TColors.accent)
                        : null,
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    boxShadow: [TShadowStyle.horizontalProductShadow]),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  SizedBox(
                    height: 120,
                    width: 120,
                    child: DottedCircleBorderIcon(
                      icon: icons[propertyType],
                      iconSize: TSizes.iconLg,
                      borderColor: TColors.darkPrimaryBorderColor,
                    ),
                  ),
                  Text(buttons[propertyType])
                ]));
          },
        ),
      ),
    );
  }
}
