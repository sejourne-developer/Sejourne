import '../../../../../common/widgets/texts/horizontal_icon_text.dart';
import '../../../../../data/services/exporter.dart';
import '../../../../../utils/popups/bookings_popups/booking_check_in_popup.dart';
import '../../../../../utils/popups/bookings_popups/booking_check_out_popup.dart';
import '../../../../../utils/popups/bookings_popups/booking_complaint_popup.dart';
import '../../../../../utils/popups/bookings_popups/booking_details_popup.dart';
import '../../../../messages/screens/chat/chat_screen.dart';
import '../../booking_wizard_form/booking_wizard_form.dart';
import '../../cancel_change_booking_wizard_form/cancel_change_booking_wizard_form.dart';
import '../../write_review/write_review_screen.dart';

class BookingThreeDotsDropDownButton extends StatelessWidget {
  const BookingThreeDotsDropDownButton({
    super.key,
    required this.bookingType,
  });

  final int bookingType;


  @override
  Widget build(BuildContext context) {
    List<String> onGoingLabel = [
      TTexts.checkOutTitle.tr,
      TTexts.editBooking.tr,
      TTexts.complain.tr,
      TTexts.messageToHost.tr,
      TTexts.overviewLabel.tr
    ];
    List<String> onGoingIcons = [
      TImage.bookingCheckOutIcon,
      TImage.feedBackIcon,
      TImage.complainIcon,
      TImage.messagesIcon,
      TImage.overviewIcon
    ];
    List<String> upComingLabel = [
      TTexts.checkInTitle.tr,
      TTexts.editBooking.tr,
      TTexts.messageToHost.tr,
      TTexts.overviewLabel.tr
    ];
    List<String> upComingIcons = [
      TImage.bookingCheckInIcon,
      TImage.feedBackIcon,
      TImage.messagesIcon,
      TImage.overviewIcon,
    ];
    List<String> completeLabel = [
      TTexts.writeReview.tr,
      TTexts.bookAgain.tr,
      TTexts.complain.tr,
      TTexts.messageToHost.tr,
      TTexts.overviewLabel.tr
    ];

    List<String> completeIcons = [
      TImage.feedBackIcon,
      TImage.searchBookingIcon,
      TImage.complainIcon,
      TImage.messagesIcon,
      TImage.overviewIcon
    ];
    return PopupMenuButton(
      shape: OutlineInputBorder(
          borderSide: BorderSide(
            color: Get.isDarkMode
                ? TColors.darkPrimaryBorderColor
                : TColors.lightPrimaryBorderColor,
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(TSizes.md),
            bottomLeft: Radius.circular(TSizes.md),
            bottomRight: Radius.circular(TSizes.md),
            topRight: Radius.circular(0),
          )),

      color: Get.isDarkMode ? TColors.darkContainer : TColors.white,
      itemBuilder: (context) {
        switch (bookingType) {
          case 1:
            return List.generate(
              onGoingLabel.length,
                  (index) {
                return PopupMenuItem(
                  height: TSizes.iconLg,
                  onTap: () => index == 0
                      ? showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                      const BookingCheckOutPopUp())
                      : index == 1
                      ? Get.to(
                          () => const CancelChangeBookingWizardForm())
                      : index == 2
                      ? showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                    const BookingComplaintPopUp(),
                  )
                      : index == 3
                      ? Get.to(() => const ChatScreen())
                      : showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                    const BookingDetailsPopup(
                      margin:
                      EdgeInsetsDirectional.symmetric(
                          horizontal: TSizes.sm,
                          vertical:
                          TSizes.spaceBtwSections),
                    ),
                  ),
                  child: GestureDetector(
                    child: HorizontalIconText(
                      icon: onGoingIcons[index],
                      title: onGoingLabel[index],
                      isSub: false,
                    ),
                  ),
                );
              },
            );
          case 2:
            return List.generate(
              upComingLabel.length,
                  (index) {
                return PopupMenuItem(
                  height: TSizes.iconLg,
                  onTap: () => index == 0
                      ? showDialog(
                      context: Get.context!,
                      builder: (context) => const BookingCheckInPopUp())
                      : index == 1
                      ? Get.to(
                          () => const CancelChangeBookingWizardForm())
                      : index == 2
                      ? Get.to(() => const ChatScreen())
                      : showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                    const BookingDetailsPopup(
                      margin: EdgeInsetsDirectional.symmetric(
                          horizontal: TSizes.sm,
                          vertical: TSizes.spaceBtwSections),
                    ),
                  ),
                  child: HorizontalIconText(
                    icon: upComingIcons[index],
                    title: upComingLabel[index],
                    isSub: false,
                  ),
                );
              },
            );
          case 3:
            return List.generate(
              completeLabel.length,
                  (index) {
                return PopupMenuItem(
                  height: TSizes.iconLg,
                  onTap: () => index == 0
                      ? Get.to(() => const WriteReviewScreen())
                      : index == 1
                      ? Get.to(() => const BookingWizardForm())
                      : index == 2
                      ? showDialog(
                      context: Get.context!,
                      builder: (context) =>
                      const BookingComplaintPopUp())
                      : index == 3
                      ? Get.to(() => const ChatScreen())
                      : showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                    const BookingDetailsPopup(
                      margin:
                      EdgeInsetsDirectional.symmetric(
                          horizontal: TSizes.sm,
                          vertical:
                          TSizes.spaceBtwSections),
                    ),
                  ),
                  child: GestureDetector(
                    child: HorizontalIconText(
                      icon: completeIcons[index],
                      title: completeLabel[index],
                      isSub: false,
                    ),
                  ),
                );
              },
            );
          default:
            return List.generate(
              0,
                  (index) {
                return const PopupMenuItem(child: SizedBox());
              },
            );
        }
      },

      /// Three dot icon
      child: Icon(
        Icons.more_vert_outlined,
        color:
        Get.isDarkMode ? TColors.darkIconColor : TColors.secondaryAccent,
        size: TSizes.iconLg,
      ),
    );
  }
}