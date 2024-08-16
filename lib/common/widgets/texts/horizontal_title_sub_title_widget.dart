import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class HorizontalTitleSubTitleWidget extends StatelessWidget {
  const HorizontalTitleSubTitleWidget({
    super.key,
    required this.title,
    required this.subTitle,
    this.titleStyle,
    this.subTitleStyle,
    this.titleAlign = TextAlign.center,
    this.subTitleAlign = TextAlign.center,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisAlignment = MainAxisAlignment.start,  this.isPhoneNumber=false,
  });

  final String title, subTitle;
  final TextStyle? titleStyle, subTitleStyle;
  final TextAlign titleAlign, subTitleAlign;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;
  final bool isPhoneNumber;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: mainAxisAlignment,
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(title,
              textAlign: titleAlign,
              style: titleStyle ?? Theme.of(context).textTheme.headlineSmall!
              //.apply(color: TColors.primary),
              ),
        ),
        const SizedBox(
          height: TSizes.sm,
        ),

        /// SubTitle
        Text(
          subTitle,
          textAlign: subTitleAlign,
          textDirection: isPhoneNumber?TextDirection.ltr:null,
          style: subTitleStyle ??
              Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .apply(color: TColors.darkFontColor),
        ),
      ],
    );
  }
}
