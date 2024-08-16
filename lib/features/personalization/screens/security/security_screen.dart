import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sejourne/common/widgets/appbar/appbar.dart';
import 'package:sejourne/common/widgets/custom_shapes/containers/background_image_container.dart';
import 'package:sejourne/common/widgets/layouts/profile_features_item_list.dart';
import 'package:sejourne/features/personalization/controllers/security_controller.dart';
import 'package:sejourne/features/personalization/screens/security/widgets/active_sessions_screen.dart';
import 'package:sejourne/utils/popups/profile_popups/security_popups/change_password_popup.dart';
import 'package:sejourne/utils/popups/profile_popups/security_popups/two_factor_auth_popup.dart';
import 'package:sejourne/utils/constants/image_strings.dart';
import 'package:sejourne/utils/constants/sizes.dart';

import '../../../../common/widgets/layouts/list_layout.dart';
import '../../../../data/services/app_variables.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/text_strings.dart';

class SecurityScreen extends StatelessWidget {
  const SecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SecurityController());
    List<String> title = [
      TTexts.password.tr,
      TTexts.twoFactorAuth.tr,
      TTexts.activeSessions.tr,
    ];
    List<String> subTitle = [
      TTexts.resetPassword.tr,
      TTexts.increaseSecurity.tr,
      TTexts.selectSignOut.tr,
    ];
    List<String> icons = [
      TImage.passwordIcon,
      TImage.twoFactorAuthIcon,
      TImage.activeSessionIcon,
    ];
    List<Widget> onPressed = [
      const ChangePasswordPopup(),
      const TwoFactorAuthPopup(
        permissionKey: "Two_factor_Auth",
      ),
      const ActiveSessionsScreen(),
    ];
    return BackgroundImageContainer(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.sm),
          child: Column(
            children: [
              /// App bar
               TAppBar(
                leadingIcon:Get.locale==arabic?TImage.rightArrowIcon: TImage.backArrow,
                title: Text(TTexts.securityLabel.tr),
              ),
              Text(
                TTexts.changeSecuritySettings.tr,
                style: Theme.of(context).textTheme.labelMedium!.apply(
                    color: Get.isDarkMode
                        ? TColors.darkFontColor
                        : TColors.darkerGrey),
              ),

              ListLayout(
                  itemBuilder: (_, index) => GestureDetector(
                        onTap: () => index == title.length - 1
                            ? Get.to(() => const ActiveSessionsScreen())
                            : showDialog(
                                context: context,
                                builder: (context) => onPressed[index],
                              ),
                        child: ProfileFeaturesItemList(
                          icon: icons[index],
                          title: title[index],
                          showEditButton:
                              index == title.length - 1 ? false : true,
                          isVerified: false,
                          subTitle: subTitle[index],
                        ),
                      ),
                  itemCount: title.length),
            ],
          ),
        ),
      ),
    ));
  }
}
