import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sejourne/common/widgets/buttons/primary_button.dart';
import 'package:sejourne/common/widgets/custom_shapes/containers/signin_signup_background_image_container.dart';
import 'package:sejourne/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:sejourne/utils/constants/colors.dart';
import 'package:sejourne/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/login_sing_up_widgets/login_signup_header.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import 'opt_form.dart';

class ConfirmationCodeScreen extends StatelessWidget {
  const ConfirmationCodeScreen({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    final forgetPasswordController = ForgetPasswordController.instance;
    forgetPasswordController.startTimer();
    return Scaffold(
      body: SigninSignupBackgroundImageContainer(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                const SizedBox(
                  height: TSizes.spaceBtwSections * 2,
                ),

                /// header logo and titles
                LoginSignUpHeader(
                    title: TTexts.verifyAccountTitle.tr,
                    subTitle: TTexts.verifyAccountSubTitle.tr),

                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                const OtpForm(),

                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),

                /// Submit Button
                Obx(
                  () {
                    return PrimaryButton(
                      loading: forgetPasswordController.buttonLoading,
                      title: TTexts.confirmCode.tr,
                      buttonBackgroundColor:
                          forgetPasswordController.enableButton.value
                              ? null
                              : TColors.grey,
                      onPressed: forgetPasswordController.enableButton.value
                          ? () => forgetPasswordController.confirmOTPCode()
                          : null,
                    );
                  },
                ),

                // Obx(
                //   () => TRoundedContainer(
                //     gradient:
                //         ForgetPasswordController.instance.enableButton.value
                //             ? TColors.linerGradient2
                //             : const LinearGradient(
                //                 colors: [TColors.grey2, TColors.grey2]),
                //     radius: TSizes.cardRadiusMd,
                //     isGradient: true,
                //     showBorder: false,
                //     width: double.infinity,
                //     child: ElevatedButton(
                //       onPressed: ForgetPasswordController
                //               .instance.enableButton.value
                //           ? () =>
                //               ForgetPasswordController.instance.confirmOTPCode()
                //           : null,
                //       child: Obx(
                //         () => ForgetPasswordController
                //                 .instance.buttonLoading.value
                //             ? const SizedBox(
                //                 height: 19,
                //                 width: 19,
                //                 child: CircularProgressIndicator())
                //             : Text(
                //                 TTexts.confirmCode.tr,
                //                 style: ForgetPasswordController
                //                         .instance.enableButton.value
                //                     ? null
                //                     : Theme.of(context).textTheme.bodyLarge,
                //               ),
                //       ),
                //     ),
                //   ),
                // ),

                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),

                Obx(
                  () => forgetPasswordController.start.value != 0
                      ? Text.rich(
                          textAlign: TextAlign.center,
                          TextSpan(
                            children: [
                              TextSpan(
                                text: TTexts.doNotReceiveCode.tr,
                                style: Theme.of(context).textTheme.titleSmall!,
                              ),
                              TextSpan(
                                text: ForgetPasswordController
                                    .instance.start.value
                                    .toString(),
                              ),
                              TextSpan(text: TTexts.second.tr),
                            ],
                          ),
                        )
                      : const SizedBox(),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),

                Obx(
                  () => TextButton(
                      onPressed: forgetPasswordController.start.value == 0
                          ? () {
                              forgetPasswordController.sendOTPEmail(email);
                            }
                          : null,
                      child: Text(
                        TTexts.resendCodeNow.tr,
                        style: Theme.of(context).textTheme.titleMedium!.apply(
                              color: ForgetPasswordController
                                          .instance.start.value !=
                                      0
                                  ? TColors.grey2
                                  : THelperFunctions.isDarkMode(context)
                                      ? TColors.darkFontColor
                                      : TColors.primary,
                              decoration: TextDecoration.underline,
                            ),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
