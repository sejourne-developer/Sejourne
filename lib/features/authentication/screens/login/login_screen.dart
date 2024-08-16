import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sejourne/features/authentication/screens/login/widgets/login_form.dart';

import '../../../../common/styles/spacing_styles.dart';
import '../../../../common/widgets/custom_shapes/containers/signin_signup_background_image_container.dart';
import '../../../../common/widgets/login_sing_up_widgets/login_signup_header.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                    title: TTexts.loginTitle.tr,
                    subTitle: TTexts.loginSubTitle.tr),

                /// Login Form
                const TLoginForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
