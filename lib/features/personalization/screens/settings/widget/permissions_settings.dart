import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sejourne/common/widgets/appbar/appbar.dart';
import 'package:sejourne/common/widgets/custom_shapes/containers/background_image_container.dart';
import 'package:sejourne/features/personalization/controllers/settings_controller.dart';
import 'package:sejourne/utils/constants/image_strings.dart';
import 'package:sejourne/utils/constants/sizes.dart';
import '../../../../../common/widgets/layouts/list_layout.dart';
import '../../../../../common/widgets/layouts/profile_features_item_list.dart';
import '../../../../../data/services/app_variables.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';

class PermissionsSettingsScreen extends StatelessWidget {
  const PermissionsSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> title = [
      TTexts.locationLabel.tr,
      TTexts.cameraTitle.tr,
      TTexts.contactsTitle.tr,
      TTexts.storageTitle.tr,
      TTexts.microphoneTitle.tr,
      TTexts.notificationsTitle.tr,
      TTexts.calendarTitle.tr,
    ];
    List<String> subTitle = [
      TTexts.locationPermissionTitle.tr,
      TTexts.cameraPermissionSubTitle.tr,
      TTexts.contactPermissionSubTitle.tr,
      TTexts.storagePermissionSubTitle.tr,
      TTexts.micPermissionSubTitle.tr,
      TTexts.notificationsPermissionSubTitle.tr,
      TTexts.calendarPermissionSubTitle.tr,
    ];
    List<String> icons = [
      TImage.location1,
      TImage.cameraIcon1,
      TImage.contactsIcon,
      TImage.storageIcon,
      TImage.micIcon,
      TImage.notificationIcon3,
      TImage.searchBookingIcon,
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
                title: Text(TTexts.permissionsTitle.tr),
              ),
              const SizedBox(
                height: TSizes.sm,
              ),

              Text(
                TTexts.permissionSubTitle.tr,
                style: Theme.of(context).textTheme.labelMedium!.apply(
                    color: Get.isDarkMode
                        ? TColors.darkFontColor
                        : TColors.darkerGrey),
              ),

              ListLayout(
                  itemBuilder: (_, index) => ProfileFeaturesItemList(
                        icon: icons[index],
                        title: title[index],
                        showEditButton: false,
                        showSwitchButton: true,
                        permission: SettingsController.instance.permissionKey[index],
                        switchButtonValue: SettingsController.instance.permissionValue[index].obs,
                        isVerified: false,
                        subTitle: subTitle[index],
                      ),
                  itemCount: title.length),
            ],
          ),
        ),
      ),
    ));
  }
}
