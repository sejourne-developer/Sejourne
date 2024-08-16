import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sejourne/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:sejourne/features/app/screens/property_details/property_details_screen.dart';
import 'package:sejourne/utils/helpers/helper_functions.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../constants/text_strings.dart';

class PopupExpandPropertyBottomButtons extends StatelessWidget {
  const PopupExpandPropertyBottomButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.all(TSizes.sm),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TRoundedContainer(
              backgroundColor: dark ? TColors.darkContainer : TColors.grey,
              showBorder: false,
              height: TSizes.xl,
              padding: EdgeInsets.zero,
              radius: TSizes.sm,
              child: TextButton(
                onPressed: () => Get.back(),
                child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      (TTexts.cancelLabel.tr).toUpperCase(),
                      style: Theme.of(context).textTheme.labelMedium!.apply(
                          color:
                              dark ? TColors.darkFontColor : TColors.primary),
                    )),
              ),
            ),
          ),
          const SizedBox(
            width: TSizes.spaceBtwSections,
          ),
          Expanded(
            child: TRoundedContainer(
              backgroundColor: dark ? TColors.black : TColors.accent,
              showBorder: false,
              height: TSizes.xl,
              padding: EdgeInsets.zero,
              radius: TSizes.sm,
              child: TextButton(
                  onPressed: () => Get.to(() => const PropertyDetailScreen(
                    heroTag: "PopupExpandPropertyBottomButtonsHeroTag",
                  )),
                  child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text((TTexts.viewMoreDetails.tr).toUpperCase(),
                          style: Theme.of(context).textTheme.labelMedium!.apply(
                              color: dark
                                  ? TColors.darkFontColor
                                  : TColors.white)))),
            ),
          ),
        ],
      ),
    );
  }
}
