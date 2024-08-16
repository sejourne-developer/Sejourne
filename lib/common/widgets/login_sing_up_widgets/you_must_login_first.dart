import '../../../data/services/exporter.dart';
import '../../../utils/popups/general_popups/login_popup_container.dart';
import '../buttons/primary_button.dart';

class YouMustLoginFirst extends StatelessWidget {
  const YouMustLoginFirst({super.key,  this.icon,  this.title,  this.subTitle,  this.appBarIcon="",  this.appBarTitle="",  this.ignoreAppBar=false,  this.showButton=true, });

  final String? icon, title, subTitle, appBarIcon,appBarTitle;
  final bool ignoreAppBar,showButton;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
       ignoreAppBar?const SizedBox(): Column(
         mainAxisSize: MainAxisSize.min,
          children: [
            const NetworkCheckerContainer(),
            /// App Bar
            Padding(
              padding: TSpacingStyle.paddingWithAppBarHeight2,
              child: MainScreensAppBar(
                  leadingIcon: appBarIcon!,
                  title: appBarTitle!),
            ),
          ],
        ),

        SizedBox(
          height: TDeviceUtils.getScreenHeight() * 0.80,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: TDeviceUtils.getScreenHeight() * 0.25,
                width: double.infinity,
                padding: const EdgeInsetsDirectional.all(TSizes.md),
                child: CircleAvatar(
                  backgroundColor:
                  dark ? TColors.darkContainer : TColors.lightGrey,
                  child: SvgPicture.asset(
                    icon ?? TImage.lockIcon,
                    colorFilter: ColorFilter.mode(
                        dark
                            ? TColors.darkIconColor
                            : TColors.darkGrey,
                        BlendMode.srcIn),
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              const SizedBox(height: TSizes.md,),

              Text(
                title ?? TTexts.loginToViewTitle.tr,
                style: Theme.of(context).textTheme.headlineSmall!,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: TSizes.md,
              ),
              Padding(
                padding: EdgeInsetsDirectional.symmetric(
                    horizontal:
                    TDeviceUtils.getScreenWidth(context) * 0.20),
                child: Text(
                  subTitle?? TTexts.loginToViewSubTitle.tr,
                  style: Theme.of(context).textTheme.bodySmall!,
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
             showButton? PrimaryButton(
                loading: false.obs,
                padding: const EdgeInsetsDirectional.symmetric(horizontal: TSizes.md),
                onPressed: () => showDialog(
                    context: context,
                    builder: (context) => const LoginPopUpContainer()),
                title: TTexts.signInToYourProfile.tr,
                height: 32,
                width: 78,
                radius: TSizes.sm,
                textStyle: Theme.of(context).textTheme.labelMedium!.apply(color: TColors.white),
              ):const SizedBox(),
            ],
          ),
        ),
      ],
    );
  }
}
