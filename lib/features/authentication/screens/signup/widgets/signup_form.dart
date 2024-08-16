import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sejourne/common/widgets/buttons/primary_button.dart';
import 'package:sejourne/features/authentication/screens/login/login_screen.dart';
import 'package:sejourne/features/authentication/screens/signup/widgets/terms_and_conditions_check_box.dart';

import '../../../../../common/widgets/login_sing_up_widgets/button_and_text.dart';
import '../../../../../common/widgets/login_sing_up_widgets/social_buttons.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/validators/validation.dart';
import '../../../controllers/signup/signup_controller.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Form(
      key: controller.signupFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            /// First & Last Name
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller.firstNameController,
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
                    controller: controller.lastNameController,
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
            const SizedBox(
              height: TSizes.spaceBtwInputField,
            ),

            /// Email
            TextFormField(
              controller: controller.emailController,
              decoration: InputDecoration(
                labelText: TTexts.email.tr,
              ),
              validator: (value) => TValidator.validateEmail(value!),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputField,
            ),

            /// Phone
            TextFormField(
              controller: controller.phoneController,
              decoration: InputDecoration(
                labelText: TTexts.phoneHint.tr,
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputField,
            ),

            /// Password
            Obx(
              () => TextFormField(
                controller: controller.passwordController,
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  labelText: TTexts.password.tr,
                  suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value =
                        !controller.hidePassword.value,
                    icon: Icon(controller.hidePassword.value
                        ? Iconsax.eye_slash
                        : Iconsax.eye),
                  ),
                ),
                validator: (value) => TValidator.validatePassword(value!),
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputField,
            ),

            /// Re Type Password
            Obx(
              () => TextFormField(
                controller: controller.rePasswordController,
                obscureText: controller.hideRePassword.value,
                decoration: InputDecoration(
                  labelText: TTexts.rePassword.tr,
                  suffixIcon: IconButton(
                    onPressed: () => controller.hideRePassword.value =
                        !controller.hideRePassword.value,
                    icon: Icon(controller.hideRePassword.value
                        ? Iconsax.eye_slash
                        : Iconsax.eye),
                  ),
                ),
                validator: (value) => TValidator.passwordMatch(
                    value, controller.passwordController.text),
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),

            /// TermConditions CheckBox
            const TTermsAndConditionCheckBox(),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),

            /// SIng Up Button
            PrimaryButton(
              loading: false.obs,
              onPressed: () => controller.signup(
                controller.firstNameController.text.trim(),
                controller.lastNameController.text.trim(),
                controller.emailController.text.trim(),
                controller.passwordController.text.trim(),
                controller.passwordController.text.trim(),
                controller.phoneController.text.trim(),
              ),
              title: TTexts.register.tr.toUpperCase(),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),

            /// Sign Up with
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: TSizes.defaultSpace),
              child: Center(
                  child: Text(
                TTexts.signUpWith.tr,
                style: Theme.of(context).textTheme.titleMedium,
              )),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),

            /// Social Buttons
            const TSocialButtons(),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),

            /// already have account
            ButtonAndTextWidget(
              isSignUp: true,
              text1: TTexts.alreadyHaveAccount.tr,
              text2: TTexts.login.tr,
              onPressed: () => Get.offAll(() => const LoginScreen()),
            ),
          ],
        ),
      ),
    );
  }
}
