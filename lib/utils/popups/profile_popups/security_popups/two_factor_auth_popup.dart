import 'package:flutter/cupertino.dart';
import 'package:sejourne/common/widgets/layouts/list_layout.dart';
import 'package:sejourne/common/widgets/texts/section_header.dart';
import 'package:sejourne/data/services/exporter.dart';
import 'package:sejourne/features/personalization/controllers/security_controller.dart';
import 'package:sejourne/utils/local_storage/storage_utility.dart';

import '../../../../common/widgets/texts/custom_radio_text_button.dart';
import '../../general_popups/primary_popup_container.dart';

class TwoFactorAuthPopup extends StatelessWidget {
  const TwoFactorAuthPopup({
    super.key,
    required this.permissionKey,
  });

  final String permissionKey;

  @override
  Widget build(BuildContext context) {
    final controller = SecurityController.instance;
    List<String> label = [
      TTexts.sms.tr,
      TTexts.email.tr,
      TTexts.authenticatorApp.tr
    ];
    return PrimaryPopupContainer(
      headIcon: TImage.twoFactorAuthIcon,
      title: TTexts.twoFactorAuth.tr,
      subTitle: TTexts.addExtraSecurity.tr,
      buttonText: TTexts.saveLabel.tr,
      onPressed: () {
        Get.back();
      },
      child: Padding(
        padding: const EdgeInsetsDirectional.all(TSizes.md),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(TTexts.twoFactorAuth.tr),
                Obx(
                  () => CupertinoSwitch(
                    value: controller.twoFactorAuthSwitchButtonValue.value,
                    activeColor:
                        Get.isDarkMode ? TColors.primary : TColors.accent,
                    trackColor: TColors.darkFontColor,
                    thumbColor:
                        Get.isDarkMode ? TColors.darkFontColor : TColors.white,
                    onChanged: (value) {
                      TLocalStorage().saveData(permissionKey, value);
                      controller.twoFactorAuthSwitchButtonValue.value = value;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            Obx(
              () => AnimatedOpacity(
                opacity:
                    controller.twoFactorAuthSwitchButtonValue.value ? 1.0 : 0.5,
                duration: const Duration(milliseconds: 500),
                child: AbsorbPointer(
                  absorbing: !controller.twoFactorAuthSwitchButtonValue.value,
                  child: Column(
                    children: [
                      TSectionHeading(
                        title: TTexts.verificationMethod.tr,
                        showActionButton: false,
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      ListLayout(
                        separatorHeight: TSizes.md,
                        padding: const EdgeInsetsDirectional.symmetric(horizontal: TSizes.sm),
                        itemBuilder: (_, index) => Obx(
                          () => CustomRadioButton(


                              text: label[index],
                              index: index,
                              textStyle: Theme.of(context).textTheme.bodyMedium,
                              selectedIndex:
                                  controller.selectedTwoFactorAuthOption.value,
                              onPressed: () {
                                controller.selectedTwoFactorAuthOption.value =
                                    index;
                                TLocalStorage().saveData(
                                    "selectedTwoFactorAuthOption", index);
                                // controller.selectedReasonOption.value = index;
                                // controller.reservationController.text=reasons[index];
                              }),
                        ),

                        //     Row(
                        //   children: [
                        //     Obx(
                        //       () => Radio(
                        //           activeColor: Get.isDarkMode
                        //               ? TColors.primary
                        //               : TColors.accent,
                        //           splashRadius: TSizes.md,
                        //           toggleable: true,
                        //           visualDensity: VisualDensity.comfortable,
                        //           value: index,
                        //           groupValue: controller
                        //               .selectedTwoFactorAuthOption.value,
                        //           onChanged: (value) {
                        //             controller.selectedTwoFactorAuthOption
                        //                 .value = value!;
                        //             TLocalStorage().saveData(
                        //                 "selectedTwoFactorAuthOption", value);
                        //           }),
                        //     ),
                        //     Text(
                        //       label[index],
                        //       style: Theme.of(context).textTheme.bodyMedium,
                        //     )
                        //   ],
                        // ),
                        itemCount: label.length,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
