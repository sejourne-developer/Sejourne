import 'package:iconsax/iconsax.dart';
import 'package:sejourne/data/services/exporter.dart';
import '../../../validators/validation.dart';
import '../../../../features/personalization/controllers/personal_details_controller.dart';
import '../../general_popups/primary_popup_container.dart';

class ChangeNamePopUpForm extends StatelessWidget {
  const ChangeNamePopUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = PersonalInformationController.instance;
    return Material(
      color: Colors.transparent,
      child: PrimaryPopupContainer(
        title: TTexts.changeLabel.tr,
        subTitle: TTexts.changeFLName.tr,
        buttonText: TTexts.updateLabel.tr,
        headIcon: TImage.userProfileIcon,
        onPressed: () {
          if (!controller.changeNameForm.currentState!.validate()) {
            return;
          }
          Get.back();

        },
        child: Form(
          key: controller.changeNameForm,
          child: Column(
            children: [
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
                child: TextFormField(
                  controller: controller.firstnameEditingController,
                  expands: false,
                  decoration: InputDecoration(
                      labelText: TTexts.fName.tr,
                      prefixIcon: Icon(
                        Iconsax.user,
                        color: dark ? TColors.darkIconColor : TColors.primary,
                      )),
                  validator: (value) =>
                      TValidator.validateEmptyText(TTexts.fName.tr, value!),
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwInputField,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
                child: TextFormField(
                  controller: controller.lastnameEditingController,
                  expands: false,
                  decoration: InputDecoration(
                      labelText: TTexts.lName.tr,
                      prefixIcon: Icon(
                        Iconsax.user,
                        color: dark ? TColors.darkIconColor : TColors.primary,
                      )),
                  validator: (value) =>
                      TValidator.validateEmptyText(TTexts.lName.tr, value!),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
