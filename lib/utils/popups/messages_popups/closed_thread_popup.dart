import '../../../data/services/exporter.dart';
import '../general_popups/primary_popup_container.dart';

class ClosedThreadPopup extends StatelessWidget {
  const ClosedThreadPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return  PrimaryPopupContainer(
      headIcon: TImage.doneIcon2,
      title: TTexts.confirmThreadClosure.tr,
      subTitle: TTexts.areYouSureToCloseThread.tr,
      subTitleTextStyle: Theme.of(context).textTheme.bodyMedium!.apply(
          color: THelperFunctions.isDarkMode(context)
              ? TColors.darkFontColor
              : TColors.darkGrey),
      buttonText: TTexts.yesCloseThread.tr,
      onPressed: () {
        Get.back();
      },
    );
  }
}
