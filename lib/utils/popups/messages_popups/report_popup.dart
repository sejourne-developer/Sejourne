import '../../../data/services/exporter.dart';
import '../general_popups/primary_popup_container.dart';

class ReportPopup extends StatelessWidget {
  const ReportPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return  PrimaryPopupContainer(
      headIcon: TImage.flagIcon,
      title: TTexts.reportMessage.tr,
      subTitle: TTexts.reportMessageSubTitle.tr,
      buttonText: TTexts.submitReport.tr,
      onPressed: () {
        Get.back();
      },
      subTitleTextStyle: Theme.of(context).textTheme.bodyMedium!.apply(
          color: THelperFunctions.isDarkMode(context)
              ? TColors.darkFontColor
              : TColors.darkGrey),
      child: Padding(
        padding: const EdgeInsetsDirectional.all(TSizes.md),
        child: TextFormField(
          maxLines: 5,
          decoration:  InputDecoration(
            hintText: TTexts.pleaseProvide.tr,
          ),
        ),
      ),
    );
  }
}
