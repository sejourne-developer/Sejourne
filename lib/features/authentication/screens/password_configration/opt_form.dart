import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../controllers/forget_password/forget_password_controller.dart';

class OtpForm extends StatelessWidget {
  const OtpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    final dark = THelperFunctions.isDarkMode(context);
    return Form(
      key: controller.optFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Directionality(
            // Specify direction if desired
            textDirection: TextDirection.ltr,
            child: Pinput(
              length: 6,
              controller: controller.pinController,
              focusNode: controller.focusNode,

              androidSmsAutofillMethod:
                  AndroidSmsAutofillMethod.smsUserConsentApi,
              listenForMultipleSmsOnAndroid: true,
              defaultPinTheme: controller.defaultPinTheme.copyWith(
                  decoration: BoxDecoration(
                color: THelperFunctions.isDarkMode(Get.context!)
                    ? TColors.dark
                    : TColors.white,
                borderRadius: BorderRadius.circular(TSizes.sm),
                border: Border.all(
                    color: THelperFunctions.isDarkMode(Get.context!)
                        ? TColors.darkPrimaryBorderColor
                        : TColors.grey),
              )),
              separatorBuilder: (index) => const SizedBox(width: TSizes.sm),
              //validator: (value)=> TValidator.validateOpt(value),
              // {
              //   return value == '222222' ? null : 'Pin is incorrect';
              // },
              // onClipboardFound: (value) {
              //   debugPrint('onClipboardFound: $value');
              //   pinController.setText(value);
              // },
              hapticFeedbackType: HapticFeedbackType.lightImpact,
              onCompleted: (pin) {
                controller.enableButton.value = true;
                debugPrint('onCompleted: $pin');
              },
              onChanged: (value) {
                controller.enableButton.value = false;
                debugPrint('onChanged: $value');
              },
              cursor: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 9),
                    width: 22,
                    height: 1,
                    color:
                        dark ? TColors.darkPrimaryBorderColor : TColors.primary,
                  ),
                ],
              ),
              focusedPinTheme: controller.defaultPinTheme.copyWith(
                decoration: controller.defaultPinTheme.decoration!.copyWith(
                  color: dark ? TColors.dark : TColors.white,
                  borderRadius: BorderRadius.circular(TSizes.xs),
                  border: Border.all(
                      color: dark
                          ? TColors.darkPrimaryBorderColor
                          : TColors.primary),
                ),
              ),
              obscureText: true,

              submittedPinTheme: controller.defaultPinTheme.copyWith(
                decoration: controller.defaultPinTheme.decoration!.copyWith(
                  color: dark ? TColors.dark : TColors.white,
                  borderRadius: BorderRadius.circular(TSizes.sm),
                  border: Border.all(
                      color: dark
                          ? TColors.darkPrimaryBorderColor
                          : TColors.primary),
                ),
              ),
              errorPinTheme: controller.defaultPinTheme.copyBorderWith(
                border: Border.all(color: Colors.redAccent),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
