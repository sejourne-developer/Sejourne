import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/circular_container.dart';

class CustomRadioButton extends StatelessWidget {
  const CustomRadioButton({
    super.key,
    required this.text,
    required this.index,
    required this.selectedIndex,
    this.onPressed,
    this.spaceBetweenRadioAndText = TSizes.md, this.textStyle,
  });

  final String text;
  final int index, selectedIndex;
  final double spaceBetweenRadioAndText;
  final VoidCallback? onPressed;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return InkWell(
        onTap: onPressed,
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadiusDirectional.all(Radius.circular(100)),
                  border: Border.all(
                      color: dark ? TColors.darkerGrey : TColors.grey)),
              child: TCircularContainer(
                backgroundColor:
                    selectedIndex == index ? TColors.white : Colors.transparent,
                padding: TSizes.md,
                isGradient: selectedIndex == index ? true : false,
                height: TSizes.md,
                width: TSizes.md,
              ),
            ),
            SizedBox(
              width: spaceBetweenRadioAndText,
            ),
            FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  text,
                  style: textStyle??Theme.of(context).textTheme.bodyMedium!.apply(
                      color: dark ? TColors.darkFontColor : TColors.primary),
                )),
          ],
        ));
  }
}
