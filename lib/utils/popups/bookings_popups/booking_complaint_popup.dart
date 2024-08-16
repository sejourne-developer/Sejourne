
import '../../../data/services/exporter.dart';
import '../general_popups/primary_popup_container.dart';

class BookingComplaintPopUp extends StatelessWidget {
  const BookingComplaintPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryPopupContainer(
      headIcon: TImage.complaintIcon,
      title: TTexts.complaintTitle.tr,
      subTitle: TTexts.complaintSubTitle.tr,
      buttonText: TTexts.submitLabel.tr,
      onPressed: () {
        Get.back();
      },
      child: Padding(
        padding: const EdgeInsetsDirectional.only(
            end: TSizes.md, start: TSizes.md, top: TSizes.md),
        child: TextFormField(
          maxLines: 7,
          decoration: InputDecoration(
            hintText: TTexts.yourMessageHere.tr,
          ),
        ),
      ),
    );
  }
}
