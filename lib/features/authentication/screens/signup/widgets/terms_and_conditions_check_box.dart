import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sejourne/features/authentication/screens/login/widgets/privacy_policy.dart';
import 'package:sejourne/features/authentication/screens/login/widgets/terms_of_services.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/signup/signup_controller.dart';

class TTermsAndConditionCheckBox extends StatelessWidget {
  const TTermsAndConditionCheckBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignUpController.instance;
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: TSizes.md,
              height: TSizes.xl,
              child: Obx(() => Checkbox(
                  value: controller.privacyPolicy.value,
                  onChanged: (value) => controller.privacyPolicy.value =
                      !controller.privacyPolicy.value)),
            ),
            const SizedBox(
              width: TSizes.sm,
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              InkWell(
                onTap: () => Get.to(() => const TermsOfServicesScreen()),
                child: Text.rich(
                  textAlign: TextAlign.start,
                  maxLines: 2,
                  TextSpan(children: [
                    TextSpan(
                        text: '${TTexts.iAgreeTo.tr} ',
                        style: Theme.of(context).textTheme.titleMedium),
                    TextSpan(
                      text: '${TTexts.termsOfUse.tr} ',
                      style: Theme.of(context).textTheme.titleLarge!.apply(
                            color:
                                dark ? TColors.darkFontColor : TColors.primary,
                            decoration: TextDecoration.underline,
                            decorationColor:
                                dark ? TColors.darkFontColor : TColors.primary,
                          ),
                    ),
                    TextSpan(
                        text: '${TTexts.and.tr} ',
                        style: Theme.of(context).textTheme.titleMedium),
                  ]),
                ),
              ),
              InkWell(
                onTap: () => Get.to(() => const PrivacyPolicyScreen()),
                child: Text(
                  '${TTexts.privacyPolicy.tr} ',
                  style: Theme.of(context).textTheme.titleLarge!.apply(
                        color: dark ? TColors.darkFontColor : TColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor:
                            dark ? TColors.darkFontColor : TColors.primary,
                      ),
                ),
              ),
            ]),
          ],
        ),
      ],
    );
  }
}
