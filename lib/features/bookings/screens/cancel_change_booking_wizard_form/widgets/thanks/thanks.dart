import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sejourne/utils/constants/image_strings.dart';

import '../../../../../../common/widgets/buttons/primary_button.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/text_strings.dart';
import '../../../../../../utils/device/device_utility.dart';
import '../../../../../../utils/helpers/helper_functions.dart';

class Thanks extends StatelessWidget {
  const Thanks({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: TSizes.md),
            child: Text(
              TTexts.yourBookCancelTitle.tr,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: TDeviceUtils.getScreenHeight() * 0.3,
            child: Center(
              child: SvgPicture.asset(
                TImage.successIcon,
                colorFilter: ColorFilter.mode(
                    THelperFunctions.isDarkMode(context)
                        ? TColors.darkIconColor
                        : TColors.lightIconColor,
                    BlendMode.srcIn),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: TSizes.md),
            child: Text(
              TTexts.yourBookCancelSubTitle.tr,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections * 2,
          ),

          PrimaryButton(
            loading: false.obs,
            title: TTexts.backToHome.tr,
            onPressed: onPressed,
          ),

          // TRoundedContainer(
          //   isGradient: true,
          //   gradient: TColors.linerGradient2,
          //   radius: TSizes.cardRadiusMd,
          //   width: double.infinity,
          //   child: ElevatedButton(
          //       onPressed: onPressed, child: const Text("Back to Home")),
          // ),
        ],
      ),
    );
  }
}
