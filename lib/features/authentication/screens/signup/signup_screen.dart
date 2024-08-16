import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sejourne/common/widgets/custom_shapes/containers/signin_signup_background_image_container.dart';
import 'package:sejourne/features/authentication/screens/signup/widgets/signup_form.dart';

import '../../../../common/styles/spacing_styles.dart';
import '../../../../common/widgets/login_sing_up_widgets/login_signup_header.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SigninSignupBackgroundImageContainer(
        child: SingleChildScrollView(
          child: Padding(
            padding: TSpacingStyle.paddingWithAppBarHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),

                /// header logo and titles
                LoginSignUpHeader(
                    title: TTexts.singUpTitle.tr,
                    subTitle: TTexts.singUpSubTitle.tr),

                /// Sign Up Form
                const SignUpForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
