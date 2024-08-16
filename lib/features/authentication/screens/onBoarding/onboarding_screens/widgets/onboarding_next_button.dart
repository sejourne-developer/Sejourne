import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sejourne/utils/constants/text_strings.dart';

import '../../../../../../utils/constants/sizes.dart';
import '../../../../controllers/onboarding/onboarding_controller.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //final dark=THelperFunctions.isDarkMode(context);
    return PositionedDirectional(
      bottom: TSizes.defaultSpace,
      end: TSizes.defaultSpace,
      child: TextButton(
        onPressed: () => OnBoardingController.instance.nextPage(),
        child: Text(
          TTexts.next.tr,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
