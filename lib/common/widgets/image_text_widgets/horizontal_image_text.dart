import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sejourne/common/widgets/texts/horizontal_title_sub_title_widget.dart';
import 'package:sejourne/utils/constants/text_strings.dart';
import '../texts/horizontal_icon_text.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/rounded_container.dart';
import '../images/dotted_border_circle_image.dart';

class THorizontalImageText extends StatelessWidget {
  const THorizontalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = TColors.black,
    this.backgroundColor,
    this.onTap,
    this.imageSize = 72,
    this.titleTextStyle,
    this.subTitle,
    this.subTitleTextStyle,
    this.showActionButton = false,
    this.actionButtonOnPressed,
    this.status = false,
    this.actionButtonText,  this.isGradient=false,this.showTime=false,
  });

  final String image, title;
  final String? subTitle, actionButtonText;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;
  final double imageSize;
  final TextStyle? titleTextStyle, subTitleTextStyle;
  final bool showActionButton, status,isGradient,showTime;
  final VoidCallback? actionButtonOnPressed;

  @override
  Widget build(BuildContext context) {
    THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          /// Circular icon
          TDottedBorderCircleImage(
            image: image,
            imageSize: imageSize,
            borderWidth: 1,
            status: status,
          ),
          const SizedBox(
            width: TSizes.spaceBtwItems,
          ),

          /// Text
          Expanded(
            flex: 8,
            child: Column(
              children: [
                FittedBox(
                  child: HorizontalTitleSubTitleWidget(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    title: title,
                    subTitle: subTitle ?? "",
                    titleStyle:
                        titleTextStyle ?? Theme.of(context).textTheme.labelMedium!,
                    subTitleStyle: subTitleTextStyle ??
                        Theme.of(context).textTheme.labelMedium!,
                  ),
                ),
                const SizedBox(height: TSizes.xs,),

               showTime? const HorizontalIconText(icon: TImage.timer, title: "1 min ago",isSub: false,):const SizedBox()
              ],
            ),
          ),

          showActionButton
              ? TRoundedContainer(
                  backgroundColor:
                      Get.isDarkMode ? TColors.darkContainer : TColors.grey,
                  isGradient: isGradient,
                  showBorder: false,
                  height: TSizes.lg,
                  margin: const EdgeInsetsDirectional.only(start: TSizes.md),
                  padding: EdgeInsets.zero,
                  radius: TSizes.sm,
                  child: TextButton(
                    onPressed: actionButtonOnPressed,
                    child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          actionButtonText ?? TTexts.select.tr.toUpperCase(),
                          style: Theme.of(context).textTheme.labelMedium!.apply(
                              color: Get.isDarkMode
                                  ? TColors.darkFontColor
                                  :isGradient?TColors.white: TColors.primary),
                        )),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
