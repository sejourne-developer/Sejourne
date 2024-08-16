import 'package:sejourne/data/services/exporter.dart';
import '../../general_popups/calender_popup.dart';

class ChangeBirthDatePopUpForm extends StatelessWidget {
  const ChangeBirthDatePopUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return CalenderPopUpForm(
      title: TTexts.changeBD.tr,
      subTitle: TTexts.changeYourBD.tr,
      buttonText: TTexts.updateLabel.tr,
      onPressed: () => Get.back(),
      maxDate: DateTime.now().copyWith(year: 2010),
      enablePastDates: true,
      initialSelectedDate: DateTime.now().copyWith(year: 2010),
      onSelectedDate: (arg) {
        dynamic date = THelperFunctions.dateSelection(arg);
        debugPrint("********************** Date $date");
        //controller.checkInDateController.text=date.toString().split(" ")[0];
      },
    );
  }
}
