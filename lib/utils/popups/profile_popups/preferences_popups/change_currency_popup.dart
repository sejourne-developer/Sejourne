import 'package:sejourne/data/services/exporter.dart';
import 'package:sejourne/features/authentication/screens/onBoarding/onBoarding_settings_screen/widgets/currency_drop_down_button.dart';
import '../../general_popups/primary_popup_container.dart';

class ChangeCurrencyPopUp extends StatelessWidget {
  const ChangeCurrencyPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryPopupContainer(
      headIcon: TImage.searchIcon,
      title: TTexts.changeCurrency.tr,
      subTitle: TTexts.changeCurrency.tr,
      buttonText:TTexts.updateLabel.tr,
      onPressed: () {
        Get.back();

      },
      child: const Padding(
        padding: EdgeInsets.all(TSizes.md),
        child: CurrencyDropDownButton()
      ),
    );
  }
}
