import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';

class VerticalTitleSubTitleWidget extends StatelessWidget {
  const VerticalTitleSubTitleWidget({
    super.key,
    required this.title,
    required this.subTitle,
    this.titleStyle,
    this.subTitleStyle,
    this.titleAlign = TextAlign.center,
    this.subTitleAlign = TextAlign.center,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  final String title, subTitle;
  final TextStyle? titleStyle, subTitleStyle;
  final TextAlign titleAlign, subTitleAlign;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
        maxLines: 2,
        textAlign: titleAlign,
        overflow: TextOverflow.ellipsis,
        TextSpan(
          children: [
            TextSpan(
              text: title,
              style: titleStyle ??
                  Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .apply(color: TColors.primary),
            ),

            /// SubTitle
            TextSpan(
              text: subTitle,
              //textAlign:subTitleAlign

              style: subTitleStyle ??
                  Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .apply(color: TColors.darkGrey),
            ),
          ],
        ));
  }
}
