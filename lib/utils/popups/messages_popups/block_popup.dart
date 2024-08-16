import '../../../../../data/services/exporter.dart';
import '../general_popups/primary_popup_container.dart';

class BlockPopup extends StatelessWidget {
  const BlockPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return  PrimaryPopupContainer(
      headIcon: TImage.blockIcon,
      title: TTexts.blockUser.tr,
      subTitle: TTexts.blockUserSubTitle.tr,
      buttonText: TTexts.blockUser.tr,
      subTitleTextStyle: Theme.of(context).textTheme.bodyMedium!.apply(
          color: THelperFunctions.isDarkMode(context)
              ? TColors.darkFontColor
              : TColors.darkGrey),
      onPressed: () {
        Get.back();
      },
    );
  }
}
