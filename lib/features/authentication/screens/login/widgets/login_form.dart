import 'package:iconsax/iconsax.dart';
import 'package:sejourne/common/widgets/buttons/primary_button.dart';
import 'package:sejourne/data/services/exporter.dart';
import 'package:sejourne/navigation_menu.dart';

import '../../../../../common/widgets/login_sing_up_widgets/button_and_text.dart';
import '../../../../../common/widgets/login_sing_up_widgets/social_buttons.dart';
import '../../../../../utils/validators/validation.dart';
import '../../../controllers/login/login_controller.dart';
import '../../password_configration/forget_password.dart';
import '../../signup/signup_screen.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
    this.isPopup = false,
  });

  final bool isPopup;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    final dark = THelperFunctions.isDarkMode(context);
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            /// Email
            TextFormField(
              controller: controller.emailController,
              decoration: InputDecoration(
                labelText: TTexts.loginEmailHint.tr,
              ),
              validator: (value) => TValidator.validateEmail(value),
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
                validator: (value) =>
                    TValidator.validateEmptyText(TTexts.password.tr, value!),
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputField / 2,
            ),

            /// Remember Me & Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Remember Me
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Obx(
                      () => SizedBox(
                        height: TSizes.md,
                        width: TSizes.md,
                        child: Checkbox(
                          value: controller.rememberMe.value,
                          onChanged: (value) => controller.rememberMe.value =
                              !controller.rememberMe.value,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: TSizes.sm,
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        TTexts.rememberMe.tr,
                        style: Theme.of(context).textTheme.labelLarge!.apply(
                            color:
                                dark ? TColors.darkFontColor : TColors.primary),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),

                /// Forget Password
                TextButton(
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  onPressed: () => Get.to(
                    () => const ForgetPassword(),
                  ),
                  child: Text(
                    TTexts.forgetPassword.tr,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelLarge!.apply(
                        decoration: TextDecoration.underline,
                        color: dark ? TColors.darkFontColor : TColors.primary),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),

            /// Sign In Button
            PrimaryButton(
              loading: false.obs,
              title: TTexts.login.tr.toUpperCase(),
              onPressed: () => controller.emailAndPasswordSignIn(
                  controller.emailController.text,
                  controller.passwordController.text),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems ,
            ),

            PrimaryButton(
                    loading: false.obs,
                    buttonBackgroundColor: TColors.grey,
                    title: TTexts.continueAsGuest.tr,
                    textStyle: Theme.of(context).textTheme.bodyLarge,
                    onPressed:isPopup? () => Get.back():() => Get.to(()=>const NavigationMenu()),
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

            /// Social Buttons
            const TSocialButtons(),
            SizedBox(
              height: isPopup ? 0 : TSizes.spaceBtwSections,
            ),

            /// Don't Have Account
            ButtonAndTextWidget(
              text1: TTexts.notHaveAccount.tr,
              text2: TTexts.signup.tr,
              onPressed: () => Get.offAll(() => const SignUpScreen()),
            ),

            SizedBox(
              height: isPopup ? 0 : TSizes.spaceBtwSections,
            ),
          ],
        ),
      ),
    );
  }
}
