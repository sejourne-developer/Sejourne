import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sejourne/common/widgets/appbar/appbar.dart';
import 'package:sejourne/common/widgets/custom_shapes/containers/background_image_container.dart';
import 'package:sejourne/data/repositories/authentication_repository/authentication_repository.dart';
import 'package:sejourne/utils/popups/profile_popups/preferences_popups/change_currency_popup.dart';
import 'package:sejourne/utils/popups/profile_popups/preferences_popups/change_language_popup.dart';
import 'package:sejourne/utils/popups/profile_popups/preferences_popups/change_theme_popup.dart';
import 'package:sejourne/features/personalization/screens/preferences/widgets/notification_preferences.dart';
import 'package:sejourne/utils/popups/profile_popups/preferences_popups/property_type_popup.dart';
import 'package:sejourne/utils/popups/profile_popups/preferences_popups/search_popup.dart';
import 'package:sejourne/utils/constants/image_strings.dart';
import 'package:sejourne/utils/constants/sizes.dart';
import '../../../../common/widgets/layouts/list_layout.dart';
import '../../../../common/widgets/layouts/profile_features_item_list.dart';
import '../../../../data/services/app_variables.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/popups/general_popups/primary_popup_container.dart';

class PreferencesScreen extends StatelessWidget {
  const PreferencesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> title = [
      TTexts.currencyLabel.tr,
      TTexts.languageLabel.tr,
      TTexts.themeLabel.tr,
      TTexts.searchLabel.tr,
      TTexts.propertyTypeLabel.tr,
      TTexts.notificationsTitle.tr,
      TTexts.dataSharingLabel.tr,
    ];
    List<String> subTitle = [
      AuthenticationRepository.selectedAppCurrency.value,
      AuthenticationRepository.selectedAppLanguage.value,
      AuthenticationRepository.instance.themeSelectText.value,
      (TTexts.dubai.tr),
      "${TTexts.apartmentLabel.tr}, ${TTexts.villaLabel.tr}.",
      TTexts.manageNotificationLabel.tr,
      TTexts.manageDataSharingLabel.tr,
    ];
    List<String> icons = [
      TImage.currencyIcon,
      TImage.languageIcon,
      TImage.themeIcon,
      TImage.propertySearchIcon,
      TImage.propertyTypeIcon,
      TImage.notificationIcon2,
      TImage.dataSharingIcon,
    ];
    List<Widget> onPressed = [
      const ChangeCurrencyPopUp(),
      const ChangeLanguagePopUp(),
      const ChangeThemePopUp(),
      const SearchPopup(),
      const PropertyTypePopup(),
      PrimaryPopupContainer(
        headIcon: TImage.notificationIcon1,
        title: TTexts.notificationsTitle.tr,
        subTitle: TTexts.customizeNotificationLabel.tr,
        buttonText: TTexts.saveLabel.tr,
        onPressed: () {
          Get.back();

        },
      ),
      PrimaryPopupContainer(
        headIcon: TImage.dataSharingIcon,
        title: TTexts.dataSharingLabel.tr,
        subTitle: TTexts.manageDataSharingLabel.tr,
        buttonText: TTexts.saveLabel.tr,
        onPressed: () {
          Get.back();

        },
      ),
    ];
    return BackgroundImageContainer(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.sm),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// App bar
               TAppBar(
                leadingIcon:Get.locale==arabic?TImage.rightArrowIcon: TImage.backArrow,
                title: Text(TTexts.preferencesLabel.tr),
              ),
              const SizedBox(
                height: TSizes.sm,
              ),

              Text(
                TTexts.changeLangCurrLabel.tr,
                style: Theme.of(context).textTheme.labelMedium!.apply(
                    color: Get.isDarkMode
                        ? TColors.darkFontColor
                        : TColors.darkerGrey),
              ),

              ListLayout(
                  itemBuilder: (_, index) => ProfileFeaturesItemList(
                        icon: icons[index],
                        title: title[index],
                        isVerified: false,
                        subTitle: subTitle[index],
                        onPressed: () => index == title.length - 2
                            ? Get.to(
                                () => const NotificationPreferencesScreen())
                            : showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return onPressed[index];
                                }),
                      ),
                  itemCount: title.length),
            ],
          ),
        ),
      ),
    ));
  }
}
