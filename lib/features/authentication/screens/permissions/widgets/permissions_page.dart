import 'package:sejourne/common/widgets/buttons/primary_button.dart';
import 'package:sejourne/data/services/exporter.dart';

import '../../../../../common/widgets/custom_shapes/containers/signin_signup_background_image_container.dart';

class PermissionsPage extends StatelessWidget {
  const PermissionsPage({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.onBoardingDescription,
    this.allowOnPressed,
    this.denyOnPressed,
  });

  final String image, title, subTitle, onBoardingDescription;
  final VoidCallback? allowOnPressed, denyOnPressed;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Center(
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(
            vertical: TSizes.spaceBtwSections * 2, horizontal: TSizes.md),
        child: ClipRRect(
          borderRadius:
              const BorderRadiusDirectional.all(Radius.circular(TSizes.md)),
          child: Scaffold(
            body: SigninSignupBackgroundImageContainer(
              child: Padding(
                padding: const EdgeInsets.all(TSizes.md),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),
                    Text(
                      title,
                      style: Theme.of(context).textTheme.headlineSmall!,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: TSizes.sm,
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.symmetric(
                          horizontal:
                              TDeviceUtils.getScreenWidth(context) * 0.20),
                      child: Text(
                        subTitle,
                        style: Theme.of(context).textTheme.bodySmall!,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      height: TDeviceUtils.getScreenHeight() * 0.25,
                      width: double.infinity,
                      padding: const EdgeInsetsDirectional.all(TSizes.md),
                      child: CircleAvatar(
                        backgroundColor:
                            dark ? TColors.darkContainer : TColors.lightGrey,
                        child: SvgPicture.asset(
                          image,
                          colorFilter: ColorFilter.mode(
                              dark
                                  ? TColors.darkIconColor
                                  : TColors.lightIconColor,
                              BlendMode.srcIn),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    // const SizedBox(
                    //   height: TSizes.md,
                    // ),
                    const SizedBox(
                      height: TSizes.md,
                    ),
                    Text(
                      onBoardingDescription,
                      style: Theme.of(context).textTheme.bodySmall!.apply(
                          color: dark ? TColors.darkFontColor : TColors.black),
                      textAlign: TextAlign.center,
                    ),

                    const Spacer(),
                    // const SizedBox(
                    //   height: TSizes.spaceBtwSections,
                    // ),
                    PrimaryButton(
                      loading: false.obs,
                      title: TTexts.allowLabel.tr,
                      onPressed: allowOnPressed,
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwInputField,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: OutlinedButton(
                          onPressed: denyOnPressed, child:  Text(TTexts.denyLabel.tr)),
                    ),
                    // const SizedBox(
                    //   height: TSizes.spaceBtwSections,
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
