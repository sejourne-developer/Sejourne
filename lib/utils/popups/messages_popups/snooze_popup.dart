import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../../../data/services/exporter.dart';
import '../general_popups/calender_popup.dart';

class SnoozePopup extends StatelessWidget {
  const SnoozePopup({super.key});

  @override
  Widget build(BuildContext context) {
    return CalenderPopUpForm(
      title: TTexts.snoozeMessage.tr,
      subTitle:
          TTexts.snoozeMessageSubTitle.tr,
      buttonText: TTexts.snoozeMessage.tr,
      initialSelectedDate: DateTime.now(),
      dateRangePickerSelectionMode:DateRangePickerSelectionMode.single,
      onPressed: () {
        Get.back();
      },
      onSelectedDate: (arg) {
        dynamic date = THelperFunctions.dateSelection(arg);
        debugPrint("********************** Date $date");
       // controller.selectedDate =
        date.toString().split(" ")[0];
      },
    );
  }
}
