import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sejourne/common/widgets/buttons/primary_button.dart';
import 'package:sejourne/common/widgets/custom_shapes/containers/signin_signup_background_image_container.dart';
import 'package:sejourne/features/authentication/screens/login/login_screen.dart';

import '../../../../common/widgets/login_sing_up_widgets/button_and_text.dart';
import '../../../../common/widgets/login_sing_up_widgets/login_signup_header.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/validators/validation.dart';
import '../../controllers/forget_password/forget_password_controller.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      //extendBody: true,
      body: SigninSignupBackgroundImageContainer(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: TSizes.spaceBtwSections * 2,
                ),

                /// header logo and titles
                LoginSignUpHeader(
                    title: TTexts.forgetPasswordTitle.tr,
                    subTitle: TTexts.forgetPasswordSubTitle.tr),

                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),

                /// Text Fields
                Form(
                  key: controller.forgetPasswordFormKey,
                  child: TextFormField(
                    controller: controller.email,
                    decoration: InputDecoration(
                      labelText: TTexts.loginEmailHint.tr,
                      //prefixIcon: Icon(Iconsax.direct_right),
                    ),
                    validator: (value) => TValidator.validateEmail(value),
                  ),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwInputField,
                ),

                /// Submit Button
                PrimaryButton(
                  title: TTexts.sContinue.tr,
                  loading: controller.buttonLoading,
                  onPressed: () {
                    ForgetPasswordController.instance.start.value = 60;
                    ForgetPasswordController.instance.startTimer();
                    controller.sendOTPEmail(controller.email.text);
                  },
                ),
                // TRoundedContainer(
                //   gradient: TColors.linerGradient2,
                //   radius: TSizes.cardRadiusMd,
                //   showBorder: false,
                //   //padding: EdgeInsets.symmetric(vertical: TSizes.xs),
                //   isGradient: true,
                //   width: double.infinity,
                //   child:  ElevatedButton(
                //       onPressed:
                //         () {
                //           ForgetPasswordController.instance.start.value =
                //               60;
                //           ForgetPasswordController.instance.startTimer();
                //           controller.sendOTPEmail(controller.email.text);
                //         },
                //       child: Obx(
                //         ()=> controller.buttonLoading.value? const SizedBox(
                //            height: 19,
                //            width: 19,
                //           child: CircularProgressIndicator(
                //           ),
                //         ):Text(TTexts.sContinue.tr),
                //       ),
                //     ),
                //
                // ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),

                ButtonAndTextWidget(
                  text1: TTexts.doNotForget.tr,
                  text2: TTexts.cancel.tr,
                  onPressed: () => Get.offAll(() => const LoginScreen()),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
