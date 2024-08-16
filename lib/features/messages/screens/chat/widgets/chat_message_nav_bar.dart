import 'package:sejourne/common/widgets/layouts/grid_layout.dart';
import 'package:sejourne/data/services/exporter.dart';
import 'package:sejourne/common/widgets/texts/horizontal_icon_text.dart';
import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../controllers/messages/messages_controller.dart';

class ChatBottomNavBar extends StatelessWidget {
  const ChatBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(MessagesController());
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        /// emoji container
        Obx(
          () => controller.showEmojiContainer.value
              ? TRoundedContainer(
                  isGradient: false,
                  showBorder: true,
                  padding: const EdgeInsets.all(TSizes.sm),
                  //borderColor: dark?TColors.darkPrimaryBorderColor:TColors.grey2,
                  margin: const EdgeInsets.all(TSizes.sm),
                  height: 200,
                  width: double.infinity,
                  child: TGridLayout(
                    scrollPhysics: const AlwaysScrollableScrollPhysics(),
                    mainAxisExtent: 40,
                    crossAxisCount: 8,
                    //scrollDirection: Axis.horizontal,
                    itemCount: controller.emojis.length,
                    itemBuilder: (_, index) => InkWell(
                      onTap: () => controller.messageTextEditController.text =
                          controller.messageTextEditController.text +
                              controller.emojis[index].value,
                      child: Text(
                        controller.emojis[index].value,
                        style: const TextStyle(fontSize: 24),
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
        ),

        /// Attachment container
        Obx(
          () => controller.showAttachmentContainer.value
              ? Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: TRoundedContainer(
                      isGradient: false,
                      showBorder: true,
                      padding: const EdgeInsets.all(TSizes.md),
                      margin: const EdgeInsets.all(TSizes.sm),
                      width: TDeviceUtils.getScreenWidth(context) * 0.5,
                      height: TDeviceUtils.getScreenWidth(context) * 0.70,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          HorizontalIconText(
                            iconSize: TSizes.lg,
                            icon: TImage.robotIcon,
                            title: TTexts.suggestReply.tr,
                            isSub: false,
                            titleTextStyle:
                            Theme.of(context).textTheme.bodyMedium,
                            iconColor: dark?TColors.darkIconColor:TColors.primary,
                          ),
                          HorizontalIconText(
                            iconSize: TSizes.lg,
                            icon: TImage.savedIcon,
                            title: TTexts.savedReplies.tr,
                            isSub: false,
                            titleTextStyle:
                            Theme.of(context).textTheme.bodyMedium,
                            iconColor: dark?TColors.darkIconColor:TColors.primary,

                          ),
                          HorizontalIconText(
                            iconSize: TSizes.lg,
                            icon: TImage.cameraIcon,
                            title: TTexts.cameraTitle.tr,
                            isSub: false,
                            titleTextStyle:
                                Theme.of(context).textTheme.bodyMedium,
                            iconColor: dark?TColors.darkIconColor:TColors.primary,

                          ),
                          HorizontalIconText(
                            iconSize: TSizes.lg,
                            icon: TImage.galleryIcon,
                            title: TTexts.gallery.tr,
                            isSub: false,
                            titleTextStyle:
                                Theme.of(context).textTheme.bodyMedium,
                            iconColor: dark?TColors.darkIconColor:TColors.primary,

                          ),
                          HorizontalIconText(
                            iconSize: TSizes.lg,
                            icon: TImage.documentsIcon,
                            title: TTexts.documents.tr,
                            isSub: false,
                            titleTextStyle:
                                Theme.of(context).textTheme.bodyMedium,
                            iconColor: dark?TColors.darkIconColor:TColors.primary,

                          ),
                          HorizontalIconText(
                            iconSize: TSizes.lg,
                            icon: TImage.locationIcon,
                            title: TTexts.locationLabel.tr,
                            isSub: false,
                            titleTextStyle:
                                Theme.of(context).textTheme.bodyMedium,
                            iconColor: dark?TColors.darkIconColor:TColors.primary,

                          ),
                        ],
                      )),
                )
              : const SizedBox(),
        ),

        /// rounded curves
        ConstrainedBox(
          constraints: BoxConstraints(
              minHeight: 56,
              maxHeight: TDeviceUtils.getScreenWidth(context) * 0.5,
              minWidth: 56,
              maxWidth: TDeviceUtils.getScreenWidth(context)),
          child: Container(
            padding: const EdgeInsetsDirectional.all(TSizes.sm),
              decoration: BoxDecoration(
                  color: dark ? TColors.dark : TColors.light,
                  boxShadow: [TShadowStyle.verticalProductShadow],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(TSizes.cardRadiusLg),
                    topRight: Radius.circular(TSizes.cardRadiusLg),
                  )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                /// Attachment Icon
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:TSizes.sm),
                  child: InkWell(
                      onTap: () {
                        controller.showEmojiContainer.value = false;
                        controller.showAttachmentContainer.value =
                        !controller.showAttachmentContainer.value;
                      },
                      child: SvgPicture.asset(TImage.attachIcon,height: TSizes.iconMd,width: TSizes.iconMd,)),
                ),
                const SizedBox(
                  width: TSizes.sm,
                ),
                /// Emoji Icon
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:TSizes.sm),
                  child: InkWell(
                      onTap: () {
                        controller.showAttachmentContainer.value =
                        false;
                        controller.showEmojiContainer.value =
                        !controller.showEmojiContainer.value;
                      },
                      child: SvgPicture.asset(TImage.emojyIcon,height: TSizes.iconMd,width: TSizes.iconMd,)),
                ),
                const SizedBox(
                  width: TSizes.sm,
                ),
                SizedBox(
                  width: TDeviceUtils.getScreenWidth(context)*0.62,
                  child: TextFormField(
                    maxLines: null,
                    controller: controller.messageTextEditController,
                    scrollPadding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).viewInsets.bottom),
                    decoration: InputDecoration(

                       contentPadding: const EdgeInsetsDirectional.symmetric(vertical:TSizes.xs,horizontal: TSizes.md),
                        enabledBorder: const OutlineInputBorder().copyWith(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: const BorderSide(
                            width: 1,
                            color: TColors.lightPrimaryBorderColor,
                          ),
                        ),


                        hintText: TTexts.writeMessageLabel.tr,
                        hintStyle: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .apply(color: TColors.grey)),
                  ),
                ),

                const SizedBox(
                  width: TSizes.sm,
                ),
                /// send button
                TCircularContainer(
                  padding: TSizes.sm,
                  isGradient: true,
                  height: 40,
                  width: 40,
                  // width: ,
                  child: SvgPicture.asset(TImage.sendIcon),
                )
              ],
            ),
          ),
          // child: Container(
          //   // constraints: BoxConstraints(
          //   //   minHeight: 56,maxHeight: TDeviceUtils.getScreenWidth(context)*0.5
          //   // ),
          //   height: 72,
          //   padding: const EdgeInsets.all(TSizes.sm),
          //   decoration: BoxDecoration(
          //       color: dark ? TColors.dark : TColors.light,
          //       boxShadow: [TShadowStyle.verticalProductShadow],
          //       borderRadius: const BorderRadius.only(
          //         topLeft: Radius.circular(TSizes.cardRadiusLg),
          //         topRight: Radius.circular(TSizes.cardRadiusLg),
          //       )),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.end,
          //     crossAxisAlignment: CrossAxisAlignment.end,
          //     mainAxisSize: MainAxisSize.min,
          //     children: [
          //       Expanded(
          //         flex: 10,
          //
          //         /// icons and text field
          //         child: TRoundedContainer(
          //           isGradient: false,
          //           showBorder: true,
          //           radius: TSizes.md,
          //           height: double.infinity,
          //           padding: const EdgeInsets.all(TSizes.sm),
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             crossAxisAlignment: CrossAxisAlignment.end,
          //             mainAxisSize: MainAxisSize.min,
          //             children: [
          //               /// Attachment Icon
          //               InkWell(
          //                   onTap: () {
          //                     controller.showEmojiContainer.value = false;
          //                     controller.showAttachmentContainer.value =
          //                         !controller.showAttachmentContainer.value;
          //                   },
          //                   child: SvgPicture.asset(TImage.attachIcon)),
          //               const SizedBox(
          //                 width: TSizes.sm,
          //               ),
          //
          //               /// Emoji Icon
          //               InkWell(
          //                   onTap: () {
          //                     controller.showAttachmentContainer.value = false;
          //                     controller.showEmojiContainer.value =
          //                         !controller.showEmojiContainer.value;
          //                   },
          //                   child: SvgPicture.asset(TImage.emojyIcon)),
          //               Expanded(
          //                 child: TextFormField(
          //                   maxLines: null,
          //                   expands: true,
          //                   //maxLines: 5,
          //                   controller: controller.messageController,
          //                   scrollPadding: EdgeInsets.symmetric(
          //                       vertical:
          //                           MediaQuery.of(context).viewInsets.bottom),
          //                   decoration: InputDecoration(
          //                       focusedBorder:
          //                           const OutlineInputBorder().copyWith(
          //                         borderRadius: BorderRadius.circular(14.0),
          //                         borderSide: BorderSide.none,
          //                       ),
          //                       enabledBorder:
          //                           const OutlineInputBorder().copyWith(
          //                         borderRadius: BorderRadius.circular(14.0),
          //                         borderSide: BorderSide.none,
          //                       ),
          //                       hintText: "Write message",
          //                       hintStyle: Theme.of(context)
          //                           .textTheme
          //                           .labelMedium!
          //                           .apply(color: TColors.grey)),
          //                 ),
          //               )
          //             ],
          //           ),
          //         ),
          //       ),
          //
          //       const SizedBox(
          //         width: TSizes.md,
          //       ),
          //
          //       /// send button
          //       TCircularContainer(
          //         padding: TSizes.md,
          //         isGradient: true,
          //         height: 56,
          //         width: 56,
          //         // width: ,
          //         child: SvgPicture.asset(TImage.sendIcon),
          //       )
          //     ],
          //   ),
          // ),
        ),

        /// when keyboard appear text field gos up
        SizedBox(
          height: MediaQuery.of(context).viewInsets.bottom,
        ),
      ],
    );
  }
}
