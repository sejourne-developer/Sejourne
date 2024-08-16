import 'package:sejourne/data/services/exporter.dart';

import '../../../../../common/widgets/image_text_widgets/horizontal_image_text.dart';
import '../../chat/chat_screen.dart';

class MessagesSearchBottomSheet extends StatelessWidget {
  const MessagesSearchBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> label = [
      "Catalin Pustai",
      "Cress",
      "Nately",
      "Emma",
      "Salma",
      "Lona",
      "Jinny",
      "Cat woman",
      "Batman",
      "Bob marley",
    ];
    List<String> images = [
      TImage.user1,
      TImage.user2,
      TImage.user3,
      TImage.user4,
      TImage.user5,
      TImage.user3,
      TImage.user4,
      TImage.user2,
      TImage.user4,
      TImage.user3,
    ];
    return  Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(TSizes.sm),
            child: SizedBox(
              height: TSizes.xl + 2,
              child: TextFormField(
                onEditingComplete: () {
                  FocusScope.of(context).unfocus();
                },
                //autofocus: true,
                cursorColor: Get.isDarkMode
                    ? TColors.darkPrimaryBorderColor
                    : TColors.accent,
                //text: TTexts.searchLabel,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                          Radius.circular(TSizes.xs)),
                      borderSide: BorderSide(
                          color: Get.isDarkMode
                              ? TColors.darkPrimaryBorderColor
                              : TColors.lightPrimaryBorderColor)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                          Radius.circular(TSizes.xs)),
                      borderSide: BorderSide(
                          color: Get.isDarkMode
                              ? TColors.darkPrimaryBorderColor
                              : TColors.lightPrimaryBorderColor)),
                  hintText: TTexts.searchLabel.tr,
                  contentPadding: EdgeInsets.zero,
                  prefixIcon: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: SvgPicture.asset(
                        TImage.searchIcon,
                        height: TSizes.iconSm,
                        colorFilter: ColorFilter.mode(THelperFunctions.isDarkMode(context) ? TColors.darkIconColor : TColors.primary,BlendMode.srcIn),
                      )),
                ),
                onTap: () {},
                //padding: EdgeInsets.zero,
              ),
            ),
          ),
          Flexible(
            child: ListView.separated(
              itemCount: images.length,
              padding: const EdgeInsets.symmetric(horizontal: TSizes.sm),
              separatorBuilder: (_, index) => const Divider(
                height: TSizes.md,
              ),
              itemBuilder: (_, index) => Padding(
                padding: const EdgeInsets.all(TSizes.sm),
                child: THorizontalImageText(
                  imageSize: 72,
                  status: true,
                  isGradient: true,
                  onTap: () => Get.to(
                        () => const ChatScreen(),
                  ),
                  actionButtonOnPressed: () =>
                      Get.to(() => const ChatScreen()),
                  showActionButton: true,
                  showTime: true,
                  image: images[index],
                  title: label[index],
                  subTitle: "Hello Allyah, good afternoon....",
                  titleTextStyle: Theme.of(context).textTheme.bodyLarge,
                  actionButtonText: "Message",
                ),
              ),
            ),
          ),
        ],

    );
  }
}
