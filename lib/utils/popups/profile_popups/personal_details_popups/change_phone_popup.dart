import 'package:flutter/foundation.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:sejourne/data/services/exporter.dart';
import '../../../../features/personalization/controllers/personal_details_controller.dart';
import '../../general_popups/primary_popup_container.dart';

class ChangePhonePopUpForm extends StatelessWidget {
  const ChangePhonePopUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = PersonalInformationController.instance;
    return Material(
      color: Colors.transparent,
      child: PrimaryPopupContainer(
        headIcon: TImage.phoneIcon,
        title: TTexts.changeNumber.tr,
        subTitle: TTexts.changeYourNumber.tr,
        buttonText: TTexts.updateLabel.tr,
        onPressed: () {
          Get.back();
        },
        child: Column(
          children: [
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
                child: GestureDetector(
                  onTap: () async {
                    // Show the country code picker when tapped.
                    final picked = await controller.countryPicker
                        .showPicker(context: context);
                    // Null check
                    if (picked != null) debugPrint(picked.flagImagePackage);
                  },
                  child: InternationalPhoneNumberInput(

                    hintText: TTexts.phone.tr,
                    onInputChanged: (PhoneNumber number) {
                      if (kDebugMode) {
                        print(number.phoneNumber);
                      }
                    },
                    onInputValidated: (bool value) {
                      if (kDebugMode) {
                        print(value);
                      }
                    },
                    selectorConfig: const SelectorConfig(
                      selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                      useBottomSheetSafeArea: true,
                    ),
                    ignoreBlank: false,
                    autoValidateMode: AutovalidateMode.disabled,
                    selectorTextStyle: const TextStyle(color: Colors.black),
                    initialValue: PhoneNumber(isoCode: 'AE'),
                    textFieldController: controller.phoneEditingController,
                    formatInput: true,

                    keyboardType:
                    const TextInputType.numberWithOptions(signed: true, decimal: true),
                    inputBorder: const OutlineInputBorder(),
                    onSaved: (PhoneNumber number) {
                      if (kDebugMode) {
                        print('On Saved: $number');
                      }
                    },
                  ),
                )),
            const SizedBox(
              height: TSizes.spaceBtwInputField,
            ),
          ],
        ),
      ),
    );
  }
}
