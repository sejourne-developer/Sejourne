import 'package:iconsax/iconsax.dart';
import 'package:sejourne/data/services/exporter.dart';
import 'package:sejourne/features/personalization/controllers/security_controller.dart';
import '../../general_popups/primary_popup_container.dart';
import '../../../validators/validation.dart';

class ChangePasswordPopup extends StatelessWidget {
  const ChangePasswordPopup({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SecurityController.instance;
    return PrimaryPopupContainer(
      headIcon: TImage.passwordIcon,
      title: TTexts.changePassword.tr,
      subTitle: TTexts.ensureYourPassword.tr,
      buttonText: TTexts.changePassword.tr,
      showButton: true,
      onPressed: () {
        if (!controller.changePasswordFormKey.currentState!.validate()) {
          return;
        }
        Get.back();

      },
      child: Padding(
        padding: const EdgeInsets.all(TSizes.md),
        child: Form(
          key: controller.changePasswordFormKey,
          child: Column(
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: TSizes.spaceBtwInputField,
                  ),

                  /// Current Password
                  Obx(
                    () => TextFormField(
                      controller: controller.currentPasswordController,
                      obscureText: controller.hideCurrentPassword.value,
                      decoration: InputDecoration(
                        labelText: TTexts.currentPassword.tr,
                        suffixIcon: IconButton(
                          onPressed: () => controller.hideCurrentPassword
                              .value = !controller.hideCurrentPassword.value,
                          icon: Icon(controller.hideCurrentPassword.value
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

                  /// new password
                  Obx(
                    () => TextFormField(
                      controller: controller.newPasswordController,
                      obscureText: controller.hideNewPassword.value,
                      decoration: InputDecoration(
                        labelText: TTexts.newPasswordHint.tr,
                        suffixIcon: IconButton(
                          onPressed: () => controller.hideNewPassword.value =
                              !controller.hideNewPassword.value,
                          icon: Icon(controller.hideNewPassword.value
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

                  /// confirm New Password
                  Obx(
                    () => TextFormField(
                      controller: controller.confirmNewPasswordController,
                      obscureText: controller.hideConfirmPassword.value,
                      decoration: InputDecoration(
                        labelText: TTexts.confirmPasswordHint.tr,
                        suffixIcon: IconButton(
                          onPressed: () => controller.hideConfirmPassword
                              .value = !controller.hideConfirmPassword.value,
                          icon: Icon(controller.hideConfirmPassword.value
                              ? Iconsax.eye_slash
                              : Iconsax.eye),
                        ),
                      ),
                      validator: (value) => TValidator.passwordMatch(
                          value, controller.newPasswordController.text),
                    ),
                  ),

                  const SizedBox(
                    height: TSizes.spaceBtwInputField,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
