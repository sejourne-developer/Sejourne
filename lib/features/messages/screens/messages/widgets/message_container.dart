import 'package:sejourne/utils/popups/messages_popups/report_popup.dart';
import '../../../../../common/widgets/custom_shapes/containers/status_container.dart';
import '../../../../../common/widgets/images/dotted_border_circle_image.dart';
import '../../../../../data/services/exporter.dart';
import '../../../../../common/widgets/texts/horizontal_icon_text.dart';
import '../../../../../utils/popups/messages_popups/assigned_to_popup.dart';
import '../../../../../utils/popups/messages_popups/block_popup.dart';
import '../../../../../utils/popups/messages_popups/snooze_popup.dart';
import '../../../../../utils/popups/messages_popups/closed_thread_popup.dart';


class MessageContainer extends StatelessWidget {
  const MessageContainer(
      {super.key, required this.image, required this.userName,  this.isPriority=false});

  final String image, userName;
  final bool isPriority;

  @override
  Widget build(BuildContext context) {
    List<String> label = [
      TTexts.closedThreadLabel.tr,
      TTexts.assignedToLabel.tr,
      TTexts.snoozedLabel.tr,
      TTexts.reportLabel.tr,
      TTexts.blockLabel.tr
    ];
    List<String> icons = [
      TImage.doneIcon2,
      TImage.assignedToIcon,
      TImage.snoozeIcon,
      TImage.flagIcon,
      TImage.blockIcon,
    ];

    List<Widget> route = [
      const ClosedThreadPopup(),
      const AssignedToPopup(),
      const SnoozePopup(),
      const ReportPopup(),
      const BlockPopup(),
    ];

    return TRoundedContainer(
      showBorder: true,
      isGradient: false,
      padding: const EdgeInsets.all(TSizes.sm),
      shadow: TShadowStyle.containerShadow,
      child: Row(
        children: [
          /// User Picture
          FittedBox(
            child: TDottedBorderCircleImage(
              imageSize: 72,
              borderWidth: 1,
              image: image,
              status: false,
            ),
          ),

          Expanded(
            flex: 7,
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: TSizes.sm),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// User Name
                      Text(userName,
                          style: Theme.of(context).textTheme.labelLarge!),
                      Row(
                        children: [

                          isPriority?const Icon(Icons.star_rounded,color: TColors.green,size: TSizes.md,):const SizedBox(),
                          const SizedBox(
                            width: TSizes.xs,
                          ),
                          /// User Status (open,online ...)
                          StatusContainer(label: TTexts.openLabel.tr),
                          const SizedBox(
                            width: TSizes.xs,
                          ),

                          /// Time
                          Text(
                            '1m ago',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .apply(color: TColors.darkGrey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: TSizes.xs,
                  ),
                  Row(
                    children: [
                      /// Message String
                      Expanded(
                        flex: 17,
                        child: Text(
                            'Hello Allyah, good afternoon. Thank you for your response to my WhatsApp messages.',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.labelSmall!),
                      ),

                      /// Three Dot Icon
                      Expanded(
                        flex: 2,
                        child: PopupMenuButton(
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

                          color: Get.isDarkMode
                              ? TColors.darkContainer
                              : TColors.white,
                          itemBuilder: (context) {
                            return List.generate(
                              label.length,
                              (index) {
                                return PopupMenuItem(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) =>
                                          route[index],
                                    );
                                  },
                                  height: TSizes.iconLg,
                                  child: HorizontalIconText(
                                    icon: icons[index],
                                    title: label[index],
                                    iconColor:
                                        THelperFunctions.isDarkMode(context)
                                            ? TColors.darkIconColor
                                            : TColors.primary,
                                    isSub: false,
                                  ),
                                );
                              },
                            );
                          },

                          /// Three dot icon
                          child: Icon(
                            Icons.more_vert_outlined,
                            color: Get.isDarkMode
                                ? TColors.darkIconColor
                                : TColors.secondaryAccent,
                            size: TSizes.iconLg,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: TSizes.xs,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      /// Location Icon And Location
                      HorizontalIconText(
                        maxLine: 1,
                        icon: TImage.locationIcon,
                        title: "2BR (608) O2 Residence JLT",
                        isSub: false,
                        titleTextStyle: Theme.of(context).textTheme.labelSmall,
                        iconSize: TSizes.sm,
                      ),

                      const SizedBox(
                        width: TSizes.sm,
                      ),

                      /// Date
                      StatusContainer(
                        label: "4 May - 7 May",
                        textStyle: Theme.of(context).textTheme.displayMedium,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
