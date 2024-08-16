import 'package:share_plus/share_plus.dart';

import '../../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../../data/services/exporter.dart';
import '../../../../../messages/controllers/messages/messages_controller.dart';
import '../../../../../messages/screens/chat/chat_screen.dart';
import '../../../../controllers/product_details/product_details_controller.dart';

class PropertyDetailsAppBar extends StatelessWidget {
  const PropertyDetailsAppBar({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: TSizes.defaultSpace, vertical: TSizes.md),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TCircularIcon(
            icon:Get.locale == arabic ?TImage.rightArrowIcon: TImage.backArrow,
            onPressed: () => Get.back(),
          ),
          Row(
            children: [
              TCircularIcon(
                onPressed: () => Share.share(
                    'check out my website https://example.com',
                    subject: 'Look what I made!'),
                icon: TImage.share,
              ),
              const SizedBox(
                width: TSizes.sm,
              ),
              TCircularIcon(
                onPressed: () => Get.to(() {
                  Get.put(MessagesController());
                  return const ChatScreen();
                }),
                icon: TImage.messagesIcon,
              ),
              const SizedBox(
                width: TSizes.sm,
              ),
              Obx(
                    () => TCircularIcon(
                  onPressed: () => ProductDetailsController.instance.favorite.value =
                  !ProductDetailsController.instance.favorite.value,
                  isAnimated: ProductDetailsController.instance.favorite.value,
                  icon: TImage.wishListIcon,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}