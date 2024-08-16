import 'package:iconsax/iconsax.dart';
import 'package:sejourne/data/services/exporter.dart';
import '../../../validators/validation.dart';
import '../../../../features/personalization/controllers/personal_details_controller.dart';
import '../../general_popups/primary_popup_container.dart';

class ChangeEmailPopUpForm extends StatelessWidget {
  const ChangeEmailPopUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = PersonalInformationController.instance;
    return Material(
      color: Colors.transparent,
      child: PrimaryPopupContainer(
        headIcon: TImage.emailIcon,
        title: TTexts.changeEmail.tr,
        subTitle: TTexts.changeYourEmail.tr,
        buttonText: TTexts.updateLabel.tr,
        onPressed: () {
          if (!controller.emailForm.currentState!.validate()) {
            return;
          }
          Get.back();

        },
        child: Column(
          children: [
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            Form(
              key: controller.emailForm,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
                child: TextFormField(
                  controller: controller.emailEditingController,
                  expands: false,
                  decoration: InputDecoration(
                      labelText: TTexts.loginEmailHint.tr,
                      prefixIcon: Icon(
                        Iconsax.user,
                        color: dark ? TColors.darkIconColor : TColors.primary,
                      )),
                  validator: (value) => TValidator.validateEmptyText(
                      TTexts.loginEmailHint.tr, value!),
                ),
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
          ],
        ),
      ),
    );
  }
}
