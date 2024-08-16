import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sejourne/common/widgets/appbar/appbar.dart';
import 'package:sejourne/common/widgets/custom_shapes/containers/background_image_container.dart';
import 'package:sejourne/common/widgets/layouts/profile_features_item_list.dart';
import 'package:sejourne/features/authentication/screens/login/widgets/privacy_policy.dart';
import 'package:sejourne/features/authentication/screens/login/widgets/terms_of_services.dart';
import 'package:sejourne/features/personalization/screens/legal_information/widgets/about_screen.dart';
import 'package:sejourne/features/personalization/screens/legal_information/widgets/cookie_policy_screen.dart';
import 'package:sejourne/utils/constants/image_strings.dart';
import 'package:sejourne/utils/constants/sizes.dart';

import '../../../../common/widgets/layouts/list_layout.dart';
import '../../../../data/services/app_variables.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/text_strings.dart';

class LegalInformationScreen extends StatelessWidget {
  const LegalInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> title = [
      TTexts.aboutLabel.tr,
      TTexts.termsOfUse.tr,
      TTexts.privacyPolicy.tr,
      TTexts.cookiePolicy.tr,
    ];
    List<String> subTitle = [
      TTexts.whoWeAre.tr,
      TTexts.readTerms.tr,
      TTexts.reviewDataCollect.tr,
      TTexts.learnCookies.tr,
    ];
    List<String> icons = [
      TImage.contactsIcon,
      TImage.termsOfServiceIcon,
      TImage.privacyPolicyIcon,
      TImage.cookieIcon,
    ];
    List<Widget> onPressed = [
      const AboutScreen(),
      const TermsOfServicesScreen(),
      const PrivacyPolicyScreen(),
      const CookiePolicyScreen(),
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
                title: Text(TTexts.legalInformation.tr),
              ),
              const SizedBox(
                height: TSizes.sm,
              ),
              Text(
                TTexts.findAllLegalDoc.tr,
                style: Theme.of(context).textTheme.labelMedium!.apply(
                    color: Get.isDarkMode
                        ? TColors.darkFontColor
                        : TColors.darkerGrey),
              ),

              ListLayout(
                  itemBuilder: (_, index) => GestureDetector(
                        onTap: () => Get.to(onPressed[index]),
                        child: ProfileFeaturesItemList(
                          icon: icons[index],
                          title: title[index],
                          isVerified: false,
                          showEditButton: false,
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
