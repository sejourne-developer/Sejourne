import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sejourne/common/widgets/appbar/appbar.dart';
import 'package:sejourne/common/widgets/custom_shapes/containers/background_image_container.dart';
import 'package:sejourne/utils/constants/image_strings.dart';
import 'package:sejourne/utils/constants/sizes.dart';
import 'package:sejourne/utils/constants/text_strings.dart';

import '../../../../../common/widgets/layouts/list_layout.dart';
import '../../../../../common/widgets/layouts/profile_features_item_list.dart';
import '../../../../../data/services/app_variables.dart';
import '../../../../../utils/constants/colors.dart';

class NotificationPreferencesScreen extends StatelessWidget {
  const NotificationPreferencesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> title = [
      TTexts.bookingNotificationsTitle.tr,
      TTexts.promotionalNotificationsTitle.tr,
      TTexts.accountAlertsTitle.tr,
      TTexts.generalNotificationsTitle.tr,
    ];
    List<String> subTitle = [
      TTexts.bookingNotificationsSubTitle.tr,
      TTexts.promotionalNotificationsSubTitle.tr,
      TTexts.accountAlertsSubTitle.tr,
      TTexts.generalNotificationsSubTitle.tr,
    ];
    List<String> icons = [
      TImage.searchBookingIcon,
      TImage.promotionalNotificationIcon,
      TImage.userProfileIcon,
      TImage.notificationIcon2,
    ];

    List<Rx<bool>> switchButtonValue = [
      false.obs,
      false.obs,
      false.obs,
      false.obs,
    ];

    List<String> permissionKey = [
      "booking_notifications",
      "promotional_notifications",
      "account_alerts",
      "general_notifications",
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
                title: Text(TTexts.notificationPreferencesTitle.tr),
              ),
              const SizedBox(
                height: TSizes.sm,
              ),

              Text(
                TTexts.notificationPreferencesSubTitle.tr,
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
                        isPermission: false,
                        permissionKey: permissionKey[index],
                        switchButtonValue: switchButtonValue[index],
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
