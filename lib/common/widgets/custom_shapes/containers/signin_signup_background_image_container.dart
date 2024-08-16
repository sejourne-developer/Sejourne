import 'package:flutter/material.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../../utils/constants/image_strings.dart';

class SigninSignupBackgroundImageContainer extends StatelessWidget {
  const SigninSignupBackgroundImageContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        /// Header Image
        Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              dark
                  ? TImage.darkSigninSignupBackgroundImageHeaderPNG
                  : TImage.lightSigninSignupBackgroundImageHeaderPNG,
              fit: BoxFit.cover,
            )),

        /// Footer Image
        Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              dark
                  ? TImage.darkSigninSignupBackgroundImageFooterPNG
                  : TImage.lightSigninSignupBackgroundImageFooterPNG,
              fit: BoxFit.cover,
            )),

        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: child,
        )
      ],
    );
  }
}
