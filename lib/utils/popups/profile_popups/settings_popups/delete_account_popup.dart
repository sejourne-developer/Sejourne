import 'package:sejourne/common/widgets/buttons/primary_button.dart';
import 'package:sejourne/data/services/exporter.dart';
import 'package:sejourne/features/personalization/screens/security/widgets/opt_settings_form.dart';
import 'package:sejourne/navigation_menu.dart';

import '../../../../features/personalization/controllers/settings_controller.dart';
import '../../general_popups/primary_popup_container.dart';

class DeleteAccountPopUp extends StatelessWidget {
  const DeleteAccountPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = SettingsController.instance;
    return Obx(
      () => PrimaryPopupContainer(
        headIcon: TImage.deleteAccountIcon,
        title: controller.showOtpForm.value
            ? TTexts.otpSubTitle.tr
            : TTexts.deleteAccount.tr,
        subTitle: controller.showOtpForm.value
            ? TTexts.otpSubTitle.tr
            : TTexts.deleteAccountSub.tr,
        buttonText: "",
        showButton: false,
        child: Padding(
          padding: const EdgeInsetsDirectional.all(TSizes.md),
          child: Obx(
            () => controller.showOtpForm.value

                /// Otp Form content
                ? Column(
                    children: [
                      const OtpSettingsForm(),
                      const SizedBox(
                        height: TSizes.spaceBtwSections,
                      ),
                      Obx(
                        () => controller.start.value != 0
                            ? Text.rich(
                                textAlign: TextAlign.center,
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: TTexts.doNotReceiveCode.tr,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!,
                                    ),
                                    TextSpan(
                                      text: controller.start.value.toString(),
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
                            onPressed: () {
                              controller.start.value = 60;
                              controller.startTimer();
                            },
                            // onPressed: controller.start.value == 0
                            //     ? () {
                            //         ForgetPasswordController.instance
                            //             .sendOTPEmail(email);
                            //       }
                            //     : null,
                            child: Text(
                              TTexts.resendCodeNow.tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .apply(
                                    color: controller.start.value != 0
                                        ? TColors.grey2
                                        : THelperFunctions.isDarkMode(context)
                                            ? TColors.darkFontColor
                                            : TColors.primary,
                                    decoration: TextDecoration.underline,
                                  ),
                            )),
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      PrimaryButton(
                        loading: false.obs,
                        title: TTexts.deleteAnAccount.tr,
                        buttonBackgroundColor: Colors.red,
                        onPressed: () {
                          controller.showOtpForm.value = false;
                          //controller.sendOTPEmail(controller.email.text);
                        },
                      ),
                      // TRoundedContainer(
                      //   width: double.infinity,
                      //   showBorder: false,
                      //   backgroundColor: Colors.red,
                      //   child: ElevatedButton(
                      //     onPressed: () {
                      //       controller.showOtpForm.value = false;
                      //       //controller.sendOTPEmail(controller.email.text);
                      //     },
                      //     child: Text(TTexts.deleteAnAccount.tr),
                      //   ),
                      // ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      PrimaryButton(
                        loading: false.obs,
                        title: TTexts.keepAccount.tr,
                        buttonBackgroundColor: const Color(0xFFF5D4D4),
                        onPressed: () {
                          controller.showOtpForm.value = false;
                          Get.offAll(() => const NavigationMenu());
                        },
                      ),
                      // TRoundedContainer(
                      //   width: double.infinity,
                      //   showBorder: false,
                      //   backgroundColor: const Color(0xFFF5D4D4),
                      //   child: ElevatedButton(
                      //     onPressed: () {
                      //       controller.showOtpForm.value = false;
                      //       Get.offAll(() => const NavigationMenu());
                      //     },
                      //     child: Text(TTexts.keepAccount.tr),
                      //   ),
                      // ),
                    ],
                  )

                /// Delete account content
                : Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: TSizes.spaceBtwSections,
                            vertical: TSizes.sm),
                        child: Text(
                          TTexts.onceYouDelete.tr,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodySmall!.apply(
                              color:
                                  dark ? TColors.darkFontColor : TColors.grey2),
                        ),
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      PrimaryButton(
                        loading: false.obs,
                        title: TTexts.confirm.tr,
                        onPressed: () {
                          controller.showOtpForm.value = true;
                          controller.startTimer();
                          //controller.sendOTPEmail(controller.email.text);
                        },
                        buttonBackgroundColor: Colors.red,
                      ),
                      // TRoundedContainer(
                      //   width: double.infinity,
                      //   showBorder: false,
                      //   backgroundColor: Colors.red,
                      //   child: ElevatedButton(
                      //     onPressed: () {
                      //       controller.showOtpForm.value = true;
                      //       controller.startTimer();
                      //       //controller.sendOTPEmail(controller.email.text);
                      //     },
                      //     child: Text(TTexts.confirm.tr),
                      //   ),
                      // ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),

                      PrimaryButton(
                        loading: false.obs,
                        title: TTexts.keepAccount.tr,
                        buttonBackgroundColor: const Color(0xFFF5D4D4),
                        onPressed: () =>
                            Get.offAll(() => const NavigationMenu()),
                      )
                      // TRoundedContainer(
                      //   width: double.infinity,
                      //   showBorder: false,
                      //   backgroundColor: const Color(0xFFF5D4D4),
                      //   child: ElevatedButton(
                      //     onPressed: () =>
                      //         Get.offAll(() => const NavigationMenu()),
                      //     child: Text(TTexts.keepAccount.tr),
                      //   ),
                      // ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
