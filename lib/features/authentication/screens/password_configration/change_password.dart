import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sejourne/common/widgets/buttons/primary_button.dart';
import 'package:sejourne/common/widgets/custom_shapes/containers/signin_signup_background_image_container.dart';

import '../../../../common/widgets/login_sing_up_widgets/button_and_text.dart';
import '../../../../common/widgets/login_sing_up_widgets/login_signup_header.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/validators/validation.dart';
import '../../controllers/forget_password/forget_password_controller.dart';
import '../login/login_screen.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.token});

  final String token;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      extendBody: true,
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
                    title: TTexts.changeYourPasswordTitle.tr,
                    subTitle: TTexts.changeYourPasswordSubTitle.tr),

                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                Form(
                  key: controller.changePasswordFormKey,
                  child: Column(
                    children: [
                      /// Password
                      Obx(
                        () => TextFormField(
                          controller: controller.newPasswordController,
                          obscureText: controller.hideNewPassword.value,
                          decoration: InputDecoration(
                            labelText: TTexts.password.tr,
                            suffixIcon: IconButton(
                              onPressed: () => controller.hideNewPassword
                                  .value = !controller.hideNewPassword.value,
                              icon: Icon(controller.hideNewPassword.value
                                  ? Iconsax.eye_slash
                                  : Iconsax.eye),
                            ),
                          ),
                          validator: (value) =>
                              TValidator.validatePassword(value!),
                        ),
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwInputField,
                      ),

                      /// confirm Password
                      Obx(
                        () => TextFormField(
                          controller: controller.confirmPasswordController,
                          obscureText: controller.hideConfirmPassword.value,
                          decoration: InputDecoration(
                            labelText: TTexts.rePassword.tr,
                            suffixIcon: IconButton(
                              onPressed: () =>
                                  controller.hideConfirmPassword.value =
                                      !controller.hideConfirmPassword.value,
                              icon: Icon(controller.hideConfirmPassword.value
                                  ? Iconsax.eye_slash
                                  : Iconsax.eye),
                            ),
                          ),
                          validator: (value) => TValidator.passwordMatch(
                              value, controller.newPasswordController.text),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),

                /// Buttons
                PrimaryButton(
                  loading: controller.buttonLoading,
                  title: TTexts.updatePassword.tr,
                  onPressed: () => controller.changePassword(token),
                ),
                // TRoundedContainer(
                //   gradient: TColors.linerGradient2,
                //   radius: TSizes.cardRadiusMd,
                //   isGradient: true,
                //   showBorder: false,
                //   width: double.infinity,
                //   child: ElevatedButton(
                //     onPressed: ()=> controller.changePassword(token),
                //     child:   Text(TTexts.updatePassword.tr),
                //   ),
                // ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),

                ButtonAndTextWidget(
                  text1: TTexts.rememberPassword.tr,
                  text2: TTexts.login.tr,
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
