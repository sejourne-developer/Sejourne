import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';

class ButtonAndTextWidget extends StatelessWidget {
  const ButtonAndTextWidget(
      {super.key,
      this.isSignUp = false,
      required this.text1,
      required this.text2,
      this.onPressed});

  final bool isSignUp;
  final String text1, text2;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
          style: Theme.of(context).textTheme.labelMedium!.apply(
              color: dark
                  ? TColors.darkFontColor
                  : TColors.darkerGrey.withOpacity(0.5)),
        ),
        TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(padding: EdgeInsets.zero),
          child: Text(
            text2,
            style: Theme.of(context).textTheme.labelLarge!.apply(
                  color: dark ? TColors.white : TColors.primary,
                  decoration: TextDecoration.underline,
                ),
          ),
        )
      ],
    );
  }
}
