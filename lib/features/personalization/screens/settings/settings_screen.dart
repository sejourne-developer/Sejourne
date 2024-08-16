import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sejourne/utils/popups/profile_popups/settings_popups/app_version_popup.dart';
import 'package:sejourne/utils/popups/profile_popups/settings_popups/delete_account_popup.dart';
import 'package:sejourne/features/personalization/screens/settings/widget/permissions_settings.dart';
import 'package:sejourne/features/personalization/screens/settings/widget/udate_information_screen.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/custom_shapes/containers/background_image_container.dart';
import '../../../../common/widgets/layouts/list_layout.dart';
import '../../../../common/widgets/layouts/profile_features_item_list.dart';
import '../../../../data/services/app_variables.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/local_storage/storage_utility.dart';
import '../../controllers/settings_controller.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SettingsController());
    final token = TLocalStorage().readData('TOKEN');
    List<String> title = [
      TTexts.updateInformationTitle.tr,
      TTexts.appVersionTitle.tr,
      TTexts.permissionsTitle.tr,
      TTexts.deleteAccountTitle.tr,
    ];
    List<String> subTitle = [
      TTexts.updateInformationSubTitle.tr,
      TTexts.appVersionSubTitle.tr,
      TTexts.permissionsSubTitle.tr,
      TTexts.deleteAccountSubTitle.tr,
    ];
    List<String> icons = [
      TImage.updateInformationIcon,
      TImage.appVersionIcon,
      TImage.permissionIcon,
      TImage.deleteAccountIcon,
    ];
    List<Widget> route = [
      const UpdateInformationScreen(),
      const AppVersionPopUp(),
      const PermissionsSettingsScreen(),
      const DeleteAccountPopUp(),
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
                title: Text(TTexts.settingsLabel.tr),
              ),
              const SizedBox(
                height: TSizes.sm,
              ),
              Text(
                TTexts.manageYourSettingsLabel.tr,
                style: Theme.of(context).textTheme.labelMedium!.apply(
                    color: Get.isDarkMode
                        ? TColors.darkFontColor
                        : TColors.darkerGrey),
              ),

              ListLayout(
                itemBuilder: (_, index) => GestureDetector(
                  onTap: () => index == 0 ||index == 2
                      ? Get.to(route[index])
                      : showDialog(
                          context: context,
                          builder: (context) {
                            return route[index];
                          }),
                  child: ProfileFeaturesItemList(
                    icon: icons[index],
                    title: title[index],
                    isVerified: false,
                    showEditButton: false,
                    subTitle: subTitle[index],
                  ),
                ),
                itemCount:token != null? title.length:title.length-1,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
