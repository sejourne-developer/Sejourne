import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/device/device_utility.dart';
import '../../../../../../utils/helpers/helper_functions.dart';
import '../../../../controllers/onboarding/onboarding_controller.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark = THelperFunctions.isDarkMode(context);
    return Padding(
      padding: EdgeInsets.only(
          bottom: TDeviceUtils.getBottomNavigationBarHeight() * 1.2),
      child: Align(
        alignment: AlignmentDirectional.bottomCenter,
        child: SmoothPageIndicator(
          effect: ExpandingDotsEffect(
            activeDotColor: dark ? TColors.primary : TColors.primary,
            dotColor: dark ? TColors.accent : TColors.accent,
            dotHeight: 8,
            dotWidth: 8,
          ),
          controller: controller.pageController,
          onDotClicked: controller.dotNavigationClick,
          count: 5,
        ),
      ),
    );
  }
}
