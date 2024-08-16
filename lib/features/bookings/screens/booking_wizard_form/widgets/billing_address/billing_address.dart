import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../common/widgets/buttons/primary_button.dart';
import '../../../../../../common/widgets/texts/section_heading_with_edit_Icon.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/text_strings.dart';
import '../../../../../../utils/helpers/helper_functions.dart';
import '../../../../../../utils/validators/validation.dart';

class BillingAddress extends StatelessWidget {
  const BillingAddress({
    super.key,
    this.onContinuePressed,
    this.onBackPressed,
  });

  final VoidCallback? onContinuePressed, onBackPressed;

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            TTexts.billingAddressLabel.tr,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: TSizes.md),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    // controller: controller.exDate,
                    expands: false,
                    decoration: InputDecoration(
                      labelText: TTexts.fName.tr,
                    ),
                    validator: (value) =>
                        TValidator.validateEmptyText(TTexts.fName.tr, value!),
                  ),
                ),
                const SizedBox(
                  width: TSizes.spaceBtwInputField,
                ),
                Expanded(
                  child: TextFormField(
                    // controller: controller.exDate,
                    expands: false,
                    decoration: InputDecoration(
                      labelText: TTexts.lName.tr,
                    ),
                    validator: (value) =>
                        TValidator.validateEmptyText(TTexts.lName.tr, value!),
                  ),
                ),
              ],
            ),
          ),
          TextFormField(
            // controller: controller.exDate,
            expands: false,
            decoration: InputDecoration(
              labelText: TTexts.loginEmailHint.tr,
            ),
            validator: (value) => TValidator.validateEmail(value),
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputField,
          ),
          TextFormField(
            // controller: controller.exDate,
            expands: false,
            decoration: InputDecoration(
              labelText: TTexts.phoneHint.tr,
            ),
            validator: (value) => TValidator.validateEmail(value),
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputField,
          ),
          TextFormField(
            // controller: controller.exDate,
            maxLines: 5,
            expands: false,
            decoration:  InputDecoration(
                labelText: TTexts.streetAddressLabel.tr, alignLabelWithHint: true),
            validator: (value) =>
                TValidator.validateEmptyText(TTexts.streetAddressLabel.tr, value),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: TSizes.md),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    // controller: controller.exDate,
                    expands: false,
                    decoration:  InputDecoration(
                      labelText: TTexts.cityLabel.tr,
                    ),
                    validator: (value) =>
                        TValidator.validateEmptyText(TTexts.cityLabel.tr, value),
                  ),
                ),
                const SizedBox(
                  width: TSizes.spaceBtwInputField,
                ),
                Expanded(
                  child: TextFormField(
                    // controller: controller.exDate,
                    expands: false,
                    decoration:  InputDecoration(
                      labelText: TTexts.countryLabel.tr,
                    ),
                    validator: (value) =>
                        TValidator.validateEmptyText(TTexts.countryLabel.tr, value!),
                  ),
                ),
              ],
            ),
          ),

          SectionHeadingWithEditIcon(
              title: TTexts.priceDetailsLabel.tr, showEditButton: false, onPressed: () {}),
          ConstrainedBox(
            constraints:
                const BoxConstraints(maxHeight: double.infinity, minHeight: 56),
            child: ListView.separated(
              itemCount: 3,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (_, index) => const SizedBox(
                height: TSizes.xs,
              ),
              itemBuilder: (_, index) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    index == 1
                        ? "${TTexts.cleaningFeeLabel.tr} 150 AED / ${TTexts.nightLabel.tr}"
                        : index == 2
                            ? TTexts.taxLabel.tr
                            : "1300 AED x 3 ${TTexts.nightLabel.tr}",
                    style: Theme.of(context).textTheme.labelMedium!.apply(
                        color: darkMode
                            ? TColors.darkFontColor
                            : TColors.lightIconColor),
                  ),
                  Text(
                    index == 1
                        ? "450"
                        : index == 2
                            ? "30"
                            : "3,900 AED",
                    style: Theme.of(context).textTheme.labelLarge!.apply(
                        color: darkMode
                            ? TColors.darkFontColor
                            : TColors.darkerGrey),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                TTexts.totalLabel.tr,
                style: Theme.of(context).textTheme.labelLarge!.apply(
                    color: darkMode
                        ? TColors.darkFontColor
                        : TColors.lightIconColor),
              ),
              Text(
                "4380 AED",
                style: Theme.of(context).textTheme.labelLarge!.apply(
                    color:
                        darkMode ? TColors.darkFontColor : TColors.darkerGrey),
              ),
            ],
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections * 2,
          ),

          PrimaryButton(
            loading: false.obs,
            title: TTexts.payNowLabel.tr,
            onPressed: onContinuePressed,
          ),

          // TRoundedContainer(
          //   isGradient: true,
          //   gradient: TColors.linerGradient2,
          //   radius: TSizes.cardRadiusMd,
          //   width: double.infinity,
          //   child: ElevatedButton(
          //       onPressed: onContinuePressed,
          //       child: const Text("Pay Now")),
          // ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),

          TextButton(
              onPressed: onBackPressed,
              child: Text(
                TTexts.backLabel.tr,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: darkMode ? TColors.darkFontColor : TColors.darkGrey),
              )),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),
        ],
      ),
    );
  }
}
