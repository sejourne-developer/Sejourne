import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sejourne/common/widgets/buttons/primary_button.dart';
import 'package:sejourne/common/widgets/texts/horizontal_title_sub_title_widget.dart';
import 'package:sejourne/features/app/controllers/home/home_controller.dart';
import 'package:sejourne/features/app/controllers/user/user_controller.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class EmailVerificationWidget extends StatelessWidget {
  const EmailVerificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedContainer(
        height: HomeController.instance.verifyLater.value ? 0 : 200,
        width: double.infinity,
        curve: Curves.easeInOut,
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          borderRadius:
              const BorderRadiusDirectional.all(Radius.circular(TSizes.md)),
          color: THelperFunctions.isDarkMode(context)
              ? TColors.darkContainer
              : TColors.grey,
        ),
        padding: const EdgeInsetsDirectional.all(TSizes.md),
        duration: const Duration(milliseconds: 500),
        margin:  EdgeInsetsDirectional.symmetric(
            horizontal: TSizes.sm, vertical:HomeController.instance.verifyLater.value?0 :TSizes.md),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HorizontalTitleSubTitleWidget(
                title: TTexts.verificationTitle.tr,
                subTitle: TTexts.verificationSubTitle.tr,
                titleStyle: Theme.of(context).textTheme.bodyLarge,
                subTitleStyle: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: TSizes.md,),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  PrimaryButton(
                    height: 32,
                    width: 72,
                    radius: TSizes.sm,
                    loading: HomeController.instance.buttonLoading,
                    title: TTexts.verifyNow.tr,
                    textStyle: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .apply(color: TColors.white),
                    onPressed: () => HomeController.instance.sendEmailVerificationOTPCodeToEmail(UserController.instance.user.id)
                        ,
                  ),
                  const SizedBox(
                    width: TSizes.md,
                  ),
                  PrimaryButton(
                    height: 32,
                    width: 72,
                    radius: TSizes.sm,
                    loading: false.obs,
                    title: TTexts.verifyLater.tr,
                    buttonBackgroundColor: TColors.blackContainer,
                    textStyle: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .apply(color: TColors.white),
                    onPressed: () =>
                        HomeController.instance.verifyLater.value = true,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
