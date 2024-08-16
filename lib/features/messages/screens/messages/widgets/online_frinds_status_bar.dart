import 'package:dotted_border/dotted_border.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sejourne/data/services/exporter.dart';
import 'package:sejourne/features/messages/screens/messages/widgets/search_bottom_sheet.dart';
import '../../../../../common/widgets/images/dotted_border_circle_image.dart';
import '../../chat/chat_screen.dart';

class OnlineFriendsStatusBar extends StatelessWidget {
  const OnlineFriendsStatusBar(
      {super.key, required this.isFirst, required this.image});

  final bool isFirst;
  final String image;

  @override
  Widget build(BuildContext context) {
    return isFirst
        ? GestureDetector(
            onTap: () => Get.bottomSheet(
              backgroundColor: THelperFunctions.isDarkMode(context)?TColors.dark:TColors.light,
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.only(topStart:Radius.circular(TSizes.md),topEnd:Radius.circular(TSizes.md),),

              ),
              // barrierColor: Colors.red,
              ignoreSafeArea: false, // add this
              SizedBox(
                  height: TDeviceUtils.getScreenHeight() * 0.75,
                  child: const MessagesSearchBottomSheet()),
            ),
            child: SizedBox(
              width: 65,
              height: 65,
              child: Stack(
                children: [
                  Center(
                    child: TRoundedContainer(
                        isGradient: false,
                        radius: 100,
                        showBorder: false,
                        backgroundColor: THelperFunctions.isDarkMode(context)
                            ? TColors.darkContainer
                            : TColors.softGrey,
                        height: 65,
                        width: 65,
                        child: Icon(
                          Iconsax.add,
                          size: TSizes.iconLg,
                          color: THelperFunctions.isDarkMode(context)
                              ? TColors.grey2
                              : TColors.dark,
                        )),
                  ),
                  DottedBorder(
                      borderType: BorderType.Circle,
                      color: TColors.darkGrey,
                      dashPattern: const [2, 2],
                      strokeWidth: 1,
                      //borderPadding: const EdgeInsets.all(1),
                      child: const SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                      )),
                ],
              ),
            ),
          )
        : GestureDetector(
            onTap: () => Get.to(
              () => const ChatScreen(),
            ),
            child: Center(
                child: TDottedBorderCircleImage(
              borderWidth: 1,
              imageSize: 65,
              image: image,
            )),
          );
  }
}
