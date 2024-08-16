import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sejourne/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:sejourne/common/widgets/texts/vertical_title_sub_title_widget.dart';

import '../../../../../common/styles/shadows.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/containers/background_image_container.dart';
import '../../../../../common/widgets/layouts/list_layout.dart';
import '../../../../../data/services/app_variables.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class ActiveSessionsScreen extends StatelessWidget {
  const ActiveSessionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> title = [
      "iPhone 12",
      "Chrome on MacBook Pro",
      "Samsung Galaxy S21",
    ];
    List<String> location = [
      "Los Angeles, USA",
      "New York, USA",
      "Los Angeles, USA",
    ];
    List<String> icons = [
      TImage.signOutIcon,
      TImage.signOutIcon,
      TImage.signOutIcon,
    ];

    List<String> time = [
      "02/15/2023, 10:00 AM",
      "02/15/2023, 10:00 AM",
      "02/15/2023, 10:00 AM",
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
                title: Text(TTexts.activeSessions.tr),
              ),
              const SizedBox(
                height: TSizes.sm,
              ),

              Text(
                TTexts.manageActiveSession.tr,
                style: Theme.of(context).textTheme.labelMedium!.apply(
                    color: Get.isDarkMode
                        ? TColors.darkFontColor
                        : TColors.darkerGrey),
              ),

              ListLayout(
                itemCount: 3,
                itemBuilder: (_, index) => TRoundedContainer(
                  shadow: TShadowStyle.containerShadow,
                  radius: TSizes.sm + 2,
                  padding: const EdgeInsetsDirectional.all(TSizes.md),
                  margin: const EdgeInsetsDirectional.only(bottom: TSizes.md),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Material(
                        borderRadius: const BorderRadiusDirectional.all(
                            Radius.circular(TSizes.sm + 2)),
                        color: Get.isDarkMode
                            ? TColors.darkContainer
                            : const Color(0xFFF6F6F6),
                        child: Padding(
                            padding: const EdgeInsetsDirectional.all(TSizes.sm),
                            child: SizedBox(
                                width: TSizes.iconLg,
                                height: TSizes.iconLg,
                                child: Center(
                                    child: SvgPicture.asset(icons[index],
                                        //fit: BoxFit.cover,
                                        height: TSizes.iconSm,
                                        width: TSizes.iconSm,
                                        colorFilter: ColorFilter.mode(
                                            Get.isDarkMode
                                                ? TColors.darkIconColor
                                                : TColors.primary,
                                            BlendMode.srcIn))))),
                      ),
                      const SizedBox(
                        width: TSizes.sm,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title[index],
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: VerticalTitleSubTitleWidget(
                              title: "${TTexts.locationLabel.tr}: ",
                              subTitle: location[index],
                              subTitleStyle:
                                  Theme.of(context).textTheme.labelMedium,
                              titleStyle: TextStyle(
                                  fontSize: 8,
                                  fontWeight: FontWeight.bold,
                                  color: Get.isDarkMode
                                      ? TColors.darkFontColor
                                      : TColors.fontColor),
                            ),
                          ),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: VerticalTitleSubTitleWidget(
                              title: "${TTexts.loginTime.tr}: ",
                              subTitle: time[index],
                              subTitleStyle:
                                  Theme.of(context).textTheme.labelMedium,
                              titleStyle: TextStyle(
                                  fontSize: 8,
                                  fontWeight: FontWeight.bold,
                                  color: Get.isDarkMode
                                      ? TColors.darkFontColor
                                      : TColors.fontColor),
                            ),
                          ),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: VerticalTitleSubTitleWidget(
                              title: "${TTexts.logoutTime.tr}: ",
                              subTitle: time[index],
                              subTitleStyle:
                                  Theme.of(context).textTheme.labelMedium,
                              titleStyle: TextStyle(
                                  fontSize: 8,
                                  fontWeight: FontWeight.bold,
                                  color: Get.isDarkMode
                                      ? TColors.darkFontColor
                                      : TColors.fontColor),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
