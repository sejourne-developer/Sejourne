import 'package:flutter/services.dart';
import 'package:sejourne/data/services/exporter.dart';
import 'package:sejourne/utils/popups/messages_popups/tags_popup.dart';
import 'package:sejourne/utils/popups/messages_popups/translate_popup.dart';
import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../common/widgets/images/dotted_border_circle_image.dart';
import '../../../../../common/widgets/texts/horizontal_icon_text.dart';
import '../../../../../utils/popups/general_popups/loaders.dart';
import '../../../../../utils/popups/messages_popups/block_popup.dart';
import '../../../../../utils/popups/messages_popups/snooze_popup.dart';
import '../../../controllers/messages/messages_controller.dart';
import '../../../../../utils/popups/messages_popups/assigned_to_popup.dart';
import '../../../../../utils/popups/messages_popups/closed_thread_popup.dart';
import '../../../../../utils/popups/messages_popups/report_popup.dart';
import 'chat_screen_booking_details_bottom_sheet.dart';
import 'chat_screen_media_and_documents_bottom_sheet.dart';

class ChatAppBar extends StatelessWidget {
  const ChatAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = MessagesController.instance;
    final dark = THelperFunctions.isDarkMode(context);
    List<String> label = [
      TTexts.closedThreadLabel.tr,
      TTexts.assignedToLabel.tr,
      TTexts.translateLabel.tr,
      TTexts.bookingDetailsLabel.tr,
      TTexts.searchLabel.tr,
      TTexts.mediaDocumentsLabel.tr,
      TTexts.snoozedLabel.tr,
      TTexts.tagsLabel.tr,
      TTexts.reportLabel.tr,
      TTexts.blockLabel.tr
    ];
    List<String> icons = [
      TImage.doneIcon2,
      TImage.assignedToIcon,
      TImage.languageIcon,
      TImage.searchBookingIcon,
      TImage.searchIcon2,
      TImage.mediaIcon,
      TImage.snoozeIcon,
      TImage.dealsIcon,
      TImage.flagIcon,
      TImage.blockIcon,
    ];
    List<Widget> route = [
      const ClosedThreadPopup(),
      const AssignedToPopup(),
      const TranslatePopup(),
      const ChatScreenBookingDetailsBottomSheet(properties: [
        TImage.prop1,
        TImage.prop5,
      ]),
      const SizedBox(),
      const ChatScreenMediaAndDocumentsBottomSheet(
        documents: [
          TImage.prop1,
          TImage.prop2,
          TImage.prop3,
          TImage.prop4,
          TImage.prop5,
          TImage.prop6,
          TImage.prop7,
          TImage.prop8,
          TImage.prop9,
          TImage.prop10,
          TImage.prop11,
          TImage.prop12,
          TImage.prop13,
          TImage.prop14,
          TImage.prop15,
          TImage.prop16,
        ],
      ),
      const SnoozePopup(),
      const TagsPopup(),
      const ReportPopup(),
      const BlockPopup(),
    ];
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: TSizes.sm, horizontal: TSizes.sm),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: TColors.grey,
            width: 1,
          ),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TCircularIcon(
                icon: Get.locale == arabic
                    ? TImage.rightArrowIcon
                    : TImage.backArrow,
                onPressed: () => Get.back(),
              ),
              const SizedBox(
                width: TSizes.md,
              ),

              /// user pic
              const TDottedBorderCircleImage(
                image: TImage.user,
                isSvg: true,
                borderWidth: 1,
                status: false,
                imageSize: TSizes.iconLg,
              ),
              const SizedBox(
                width: TSizes.md,
              ),

              /// User Name And Status
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Sejourne",
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        const SizedBox(
                          width: TSizes.xs,
                        ),
                        GestureDetector(
                            onTap: () {
                              Clipboard.setData(
                                  const ClipboardData(text: "Sejourne"));
                              TLoaders.successSnackBar(
                                  title: TTexts.successLabel.tr,
                                  message: TTexts.copyToClipboard.tr);
                            },
                            child: SvgPicture.asset(TImage.copyIcon),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const TCircularContainer(
                          backgroundColor: TColors.green,
                          height: TSizes.xs + 2,
                          width: TSizes.xs + 2,
                          margin: EdgeInsets.only(right: TSizes.xs),
                        ),
                        Text(
                          TTexts.online.tr,
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ],
                    )
                  ],
                ),
              ),

              /// Actions
              Obx(
                  ()=> TCircularIcon(
                  onPressed: ()=>controller.isPriority.value =!controller.isPriority.value,
                  icon:controller.isPriority.value?TImage.starIcon:TImage.chatStarIcon,
                  height: TSizes.iconLg,
                  width: TSizes.iconLg,
                  padding: TSizes.sm,
                  color:controller.isPriority.value? TColors.green:dark ? TColors.darkIconColor : TColors.secondaryAccent,
                ),
              ),
              const SizedBox(
                width: TSizes.sm,
              ),
              TCircularIcon(
                icon: TImage.videoCallIcon,
                height: TSizes.iconLg,
                width: TSizes.iconLg,
                padding: TSizes.sm,
                color: dark ? TColors.darkIconColor : TColors.secondaryAccent,
              ),
              const SizedBox(
                width: TSizes.sm,
              ),
              TCircularIcon(
                icon: TImage.phoneCallIcon,
                height: TSizes.iconLg,
                width: TSizes.iconLg,
                padding: TSizes.sm,
                color: dark ? TColors.darkIconColor : TColors.secondaryAccent,
              ),
              const SizedBox(
                width: TSizes.sm,
              ),
              PopupMenuButton(
                constraints: BoxConstraints(
                    minWidth: TDeviceUtils.getScreenWidth(context) * 0.5,
                    maxHeight: double.infinity,
                    minHeight: 56,
                    maxWidth: double.infinity),
                shape: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: dark
                          ? TColors.darkPrimaryBorderColor
                          : TColors.lightPrimaryBorderColor,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(TSizes.md),
                    )),

                color: dark ? TColors.darkContainer : TColors.white,
                itemBuilder: (context) {
                  return List.generate(
                    label.length,
                    (index) {
                      return PopupMenuItem(
                        onTap: () {
                          index == 3 || index == 5
                              ? Get.bottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor:
                                      THelperFunctions.isDarkMode(context)
                                          ? TColors.dark
                                          : TColors.white,
                                  ignoreSafeArea: true,
                                  route[index])
                              : index == 4
                                  ? {
                                      MessagesController.instance
                                              .chatSearchBarHeight.value =
                                          TSizes.appBarHeight + TSizes.sm,
                                      controller.showChatBottomBar.value = false
                                    }
                                  : showDialog(
                                      context: context,
                                      builder: (context) => route[index],
                                    );
                        },
                        height: TSizes.iconLg,
                        child: HorizontalIconText(
                          icon: icons[index],
                          title: label[index],
                          iconColor: THelperFunctions.isDarkMode(context)
                              ? TColors.darkIconColor
                              : TColors.primary,
                          isSub: false,
                        ),
                      );
                    },
                  );
                },

                /// Three dot icon
                child: TCircularIcon(
                  icon: TImage.verticalThreeDots,
                  height: TSizes.iconLg,
                  width: TSizes.iconLg,
                  padding: TSizes.sm,
                  color: dark ? TColors.darkIconColor : TColors.secondaryAccent,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: TSizes.sm,
          ),
        ],
      ),
    );
  }
}
