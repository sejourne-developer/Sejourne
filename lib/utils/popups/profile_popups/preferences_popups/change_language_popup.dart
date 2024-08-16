import 'package:sejourne/data/services/exporter.dart';
import '../../../../features/authentication/screens/onBoarding/onBoarding_settings_screen/widgets/language_drop_down_button.dart';
import '../../general_popups/primary_popup_container.dart';

class ChangeLanguagePopUp extends StatelessWidget {
  const ChangeLanguagePopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: PrimaryPopupContainer(
        title: TTexts.changeLanguage.tr,
        subTitle: TTexts.selectLanguage.tr,
        buttonText: TTexts.saveLabel.tr,
        headIcon: TImage.languageIcon,
        onPressed: () {
          Get.back();
        },
        child: const Padding(
          padding:
              EdgeInsets.symmetric(horizontal: TSizes.md, vertical: TSizes.md),
          child: LanguageDropDownButton(),
        ),
      ),
    );
  }
}
