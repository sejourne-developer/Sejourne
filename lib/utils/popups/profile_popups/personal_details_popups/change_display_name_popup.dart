import 'package:iconsax/iconsax.dart';
import 'package:sejourne/data/services/exporter.dart';
import '../../../validators/validation.dart';
import '../../../../features/personalization/controllers/personal_details_controller.dart';
import '../../general_popups/primary_popup_container.dart';

class ChangeDisplayNamePopUpForm extends StatelessWidget {
  const ChangeDisplayNamePopUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = PersonalInformationController.instance;
    return Material(
      color: Colors.transparent,
      child: PrimaryPopupContainer(
        headIcon: TImage.userProfileIcon,
        title: TTexts.changeDISName.tr,
        subTitle: TTexts.changeYourDISName.tr,
        buttonText: TTexts.updateLabel.tr,
        onPressed: () {
          if (!controller.displayNameForm.currentState!.validate()) {
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
              key: controller.displayNameForm,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
                child: TextFormField(
                  controller: controller.displayNameEditingController,
                  expands: false,
                  decoration: InputDecoration(
                      labelText: TTexts.display.tr,
                      prefixIcon: Icon(
                        Iconsax.user,
                        color: dark ? TColors.darkIconColor : TColors.primary,
                      )),
                  validator: (value) =>
                      TValidator.validateEmptyText(TTexts.display.tr, value!),
                ),
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputField,
            ),
          ],
        ),
      ),
    );
  }
}
