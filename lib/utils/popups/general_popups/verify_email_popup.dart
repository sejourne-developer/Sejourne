import 'package:pinput/pinput.dart';
import 'package:sejourne/features/app/controllers/home/home_controller.dart';
import 'package:sejourne/features/app/controllers/user/user_controller.dart';
import 'package:sejourne/utils/popups/general_popups/primary_popup_container.dart';

import '../../../common/widgets/buttons/primary_button.dart';
import '../../../data/services/exporter.dart';

class VerifyEmailPopup extends StatelessWidget {
  const VerifyEmailPopup({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = HomeController.instance;
    final userController =UserController.instance;
    homeController.startTimer();
    final dark = THelperFunctions.isDarkMode(context);
    return Obx(
      () => PrimaryPopupContainer(
        headIcon: homeController.verified.value
            ? TImage.verifyIcon2
            : TImage.verifyIcon1,
        title: homeController.verified.value
            ? TTexts.verifiedTitle.tr
            : TTexts.verifyTitle.tr,
        subTitle: homeController.verified.value
            ? TTexts.verifiedSubTitle.tr
            : TTexts.verifySubTitle.tr,
        buttonText: "",
        showButton: false,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: homeController.verified.value
                ? PrimaryButton(
                    loading: false.obs, title: TTexts.closeLabel.tr,
              onPressed: ()=>Get.back(),
            )
                : Column(
                    children: [
                      const SizedBox(
                        height: TSizes.spaceBtwSections,
                      ),
                      Form(
                        key: homeController.optFormKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Directionality(
                              // Specify direction if desired
                              textDirection: TextDirection.ltr,
                              child: Pinput(
                                length: 6,
                                controller: homeController.pinController,
                                focusNode: homeController.focusNode,
                                androidSmsAutofillMethod:
                                    AndroidSmsAutofillMethod.smsUserConsentApi,
                                listenForMultipleSmsOnAndroid: true,
                                defaultPinTheme:
                                    homeController.defaultPinTheme.copyWith(
                                        decoration: BoxDecoration(
                                  color:
                                      THelperFunctions.isDarkMode(Get.context!)
                                          ? TColors.dark
                                          : TColors.white,
                                  borderRadius:
                                      BorderRadius.circular(TSizes.sm),
                                  border: Border.all(
                                      color: THelperFunctions.isDarkMode(
                                              Get.context!)
                                          ? TColors.darkPrimaryBorderColor
                                          : TColors.grey),
                                )),
                                separatorBuilder: (index) =>
                                    const SizedBox(width: TSizes.sm),
                                //validator: (value)=> TValidator.validateOpt(value),
                                // {
                                //   return value == '222222' ? null : 'Pin is incorrect';
                                // },
                                // onClipboardFound: (value) {
                                //   debugPrint('onClipboardFound: $value');
                                //   pinController.setText(value);
                                // },
                                hapticFeedbackType:
                                    HapticFeedbackType.lightImpact,
                                onCompleted: (pin) {
                                  homeController.enableButton.value = true;
                                  debugPrint('onCompleted: $pin');
                                },
                                onChanged: (value) {
                                  homeController.enableButton.value = false;
                                  debugPrint('onChanged: $value');
                                },
                                cursor: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 9),
                                      width: 22,
                                      height: 1,
                                      color: dark
                                          ? TColors.darkPrimaryBorderColor
                                          : TColors.primary,
                                    ),
                                  ],
                                ),
                                focusedPinTheme:
                                    homeController.defaultPinTheme.copyWith(
                                  decoration: homeController
                                      .defaultPinTheme.decoration!
                                      .copyWith(
                                    color: dark ? TColors.dark : TColors.white,
                                    borderRadius:
                                        BorderRadius.circular(TSizes.xs),
                                    border: Border.all(
                                        color: dark
                                            ? TColors.darkPrimaryBorderColor
                                            : TColors.primary),
                                  ),
                                ),
                                obscureText: true,

                                submittedPinTheme:
                                    homeController.defaultPinTheme.copyWith(
                                  decoration: homeController
                                      .defaultPinTheme.decoration!
                                      .copyWith(
                                    color: dark ? TColors.dark : TColors.white,
                                    borderRadius:
                                        BorderRadius.circular(TSizes.sm),
                                    border: Border.all(
                                        color: dark
                                            ? TColors.darkPrimaryBorderColor
                                            : TColors.primary),
                                  ),
                                ),
                                errorPinTheme: homeController.defaultPinTheme
                                    .copyBorderWith(
                                  border: Border.all(color: Colors.redAccent),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),

                      Obx(
                        () => homeController.start.value != 0
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
                                      text:
                                          homeController.start.value.toString(),
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
                            onPressed: homeController.start.value == 0
                                ? () {
                                    homeController.sendEmailVerificationOTPCodeToEmail(userController.user.id);
                                  }
                                : null,
                            child: Text(
                              TTexts.resendCodeNow.tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .apply(
                                    color: homeController.start.value != 0
                                        ? TColors.grey2
                                        : THelperFunctions.isDarkMode(context)
                                            ? TColors.darkFontColor
                                            : TColors.primary,
                                    decoration: TextDecoration.underline,
                                  ),
                            )),
                      ),

                      const SizedBox(
                        height: TSizes.spaceBtwSections,
                      ),

                      /// Submit Button
                      Obx(
                        () {
                          return PrimaryButton(
                            loading: homeController.buttonLoading,
                            title: TTexts.verifyNow.tr,
                            buttonBackgroundColor:
                                homeController.enableButton.value
                                    ? null
                                    : TColors.grey,
                            onPressed: homeController.enableButton.value
                                ? () => homeController.emailOTPVerificationCode()
                                : null,
                          );
                        },
                      ),

                      TextButton(
                        onPressed: () {
                          homeController.start.value=60;
                          Get.back();
                        },
                        child: Text(
                          TTexts.cancelLabel.tr,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
