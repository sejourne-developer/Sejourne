import 'package:group_button/group_button.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sejourne/common/widgets/texts/horizontal_icon_text.dart';
import '../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../data/services/exporter.dart';
import '../../../features/messages/controllers/messages/messages_controller.dart';
import '../general_popups/primary_popup_container.dart';

class TagsPopup extends StatelessWidget {
  const TagsPopup({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller=MessagesController.instance;
    return PrimaryPopupContainer(
      headIcon: TImage.dealsIcon,
      title: TTexts.manageTags.tr,
      subTitle:
          TTexts.manageTagsSubTitle.tr,
      buttonText: TTexts.saveLabel.tr,
      subTitleTextStyle: Theme.of(context).textTheme.bodyMedium!.apply(
          color: dark
              ? TColors.darkFontColor
              : TColors.darkGrey),
      onPressed: () {
        Get.back();
      },
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(
            horizontal: TSizes.md, vertical: TSizes.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: TSearchContainer(
                text: "${TTexts.addLabel.tr} ...",
                suffixButtonText: TTexts.addLabel.tr,
                isTextField: true,
                icon: Iconsax.tag,
                searchController: controller.tagsController,
                showSearchSuffixButton: true,
                onPressedSearchSuffixButton: () {
                  FocusScope.of(context).unfocus();
                  controller
                      .addItem(controller.tagsController.text);
                },
                // onEditingComplete: () {
                //   FocusScope.of(context).unfocus();
                //   buttons
                //       .add(MessagesController.instance.tagsController.text.obs);
                //   MessagesController.instance.update();
                // },
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            Obx(
                ()=> GroupButton<String>(
                options:
                    const GroupButtonOptions(groupingType: GroupingType.wrap),
                buttons: controller.tagsList.value,
                buttonBuilder: (selected, propertyType, context) {
                  return FittedBox(
                    fit: BoxFit.scaleDown,
                    child: TRoundedContainer(
                      radius: TSizes.sm,
                      isGradient: true,
                      showBorder: false,
                      height: 32,
                      padding: const EdgeInsetsDirectional.symmetric(
                          horizontal: TSizes.sm),
                      child: HorizontalIconText(
                        iconColor: TColors.white,
                        icon: TImage.dealsIcon,
                        isSub: false,
                        title: propertyType,
                        titleTextStyle: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .apply(color: TColors.white),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
