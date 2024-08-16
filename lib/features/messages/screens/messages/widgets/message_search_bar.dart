import 'package:iconsax/iconsax.dart';
import 'package:sejourne/data/services/exporter.dart';

import '../../../../app/controllers/drawers/drawer_controller.dart';
import '../../../controllers/messages/messages_controller.dart';

class MessageSearchBar extends StatelessWidget {
  const MessageSearchBar({super.key, required this.focusNode, required this.onEditCompleted});
  final FocusNode focusNode;
  final VoidCallback onEditCompleted;
  @override
  Widget build(BuildContext context) {
    final controller = MessagesController.instance;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.sm),
      child: Row(
        children: [
          Expanded(
            flex: 10,
            child: SizedBox(
              height: TSizes.xl + 2,
              child: Form(
                child: TextFormField(

                  focusNode: controller.messageTextEditControllerFocusNode,
                  onEditingComplete: onEditCompleted,
                  cursorColor: Get.isDarkMode
                      ? TColors.darkPrimaryBorderColor
                      : TColors.accent,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(TSizes.xs)),
                        borderSide: BorderSide(
                            color: Get.isDarkMode
                                ? TColors.darkPrimaryBorderColor
                                : TColors.lightPrimaryBorderColor)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(TSizes.xs)),
                        borderSide: BorderSide(
                            color: Get.isDarkMode
                                ? TColors.darkPrimaryBorderColor
                                : TColors.lightPrimaryBorderColor)),
                    hintText: TTexts.searchLabel.tr,
                    contentPadding: EdgeInsets.zero,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: TSizes.sm, horizontal: TSizes.sm),
                      child: SvgPicture.asset(
                        TImage.searchIcon,
                        height: TSizes.md,
                        width: TSizes.md,
                        colorFilter: ColorFilter.mode(THelperFunctions.isDarkMode(context) ? TColors.darkIconColor : TColors.primary,BlendMode.srcIn),
                      ),
                    ),
                  ),
                  onTap: () {
                    controller.showOnlineStatusBar.value = false;
                    controller.expandOnChanged();
                  },
                  //padding: EdgeInsets.zero,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: TSizes.sm,
          ),
          Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: TRoundedContainer(
                  onPressed: () {
                    controller.messageTextEditControllerFocusNode.unfocus();
                    MyDrawerController.instance.homeScaffoldKey.currentState
                        ?.openEndDrawer();
                  },
                  radius: TSizes.xs,
                  padding: const EdgeInsets.all(TSizes.xs + 2),
                  child: Icon(
                    Iconsax.filter,
                    size: TSizes.iconSm,
                    color: THelperFunctions.isDarkMode(context)
                        ? TColors.darkIconColor
                        : TColors.lightIconColor,
                  )))
        ],
      ),
    );
  }
}
