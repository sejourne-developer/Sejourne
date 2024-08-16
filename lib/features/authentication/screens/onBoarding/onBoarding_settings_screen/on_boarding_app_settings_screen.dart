import 'package:sejourne/common/widgets/buttons/primary_button.dart';
import 'package:sejourne/data/services/exporter.dart';
import 'package:sejourne/common/widgets/texts/horizontal_title_sub_title_widget.dart';
import 'package:sejourne/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:sejourne/features/authentication/screens/onBoarding/onBoarding_settings_screen/widgets/currency_drop_down_button.dart';
import 'package:sejourne/features/authentication/screens/onBoarding/onBoarding_settings_screen/widgets/language_drop_down_button.dart';
import 'package:sejourne/features/authentication/screens/onBoarding/onboarding_screens/onboarding.dart';
import '../../../../../common/widgets/custom_shapes/containers/signin_signup_background_image_container.dart';
import '../../../../../utils/local_storage/storage_utility.dart';

class OnBoardingAppSettingsScreen extends GetView<OnBoardingController> {
  const OnBoardingAppSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final storage=TLocalStorage();
    Get.put(OnBoardingController());
    return Scaffold(
      body: SigninSignupBackgroundImageContainer(
        child: SingleChildScrollView(
          child: Padding(
            padding: TSpacingStyle.paddingWithAppBarHeight,
            child: Column(
              children: [
                /// Header
                HorizontalTitleSubTitleWidget(
                  title: TTexts.preferencesTitle.tr,
                  //title: TTexts.get(context, TTexts.preferencesTitle),
                  subTitle: TTexts.preferencesSubTitle.tr,
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),

                /// language title and subtitle
                SizedBox(
                  width: double.infinity,
                  child: HorizontalTitleSubTitleWidget(
                    title: TTexts.languageTitle.tr,
                    subTitle: TTexts.languageSubTitle.tr,
                    titleStyle: Theme.of(context).textTheme.bodyLarge,
                    subTitleStyle: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .apply(color: TColors.darkFontColor),
                    subTitleAlign: TextAlign.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),

                /// Language Drop Button
                const LanguageDropDownButton(),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),

                /// Theme title and subtitle
                SizedBox(
                  width: double.infinity,
                  child: HorizontalTitleSubTitleWidget(
                    title: TTexts.themeTitle.tr,
                    subTitle: TTexts.themeSubTitle.tr,
                    titleStyle: Theme.of(context).textTheme.bodyLarge,
                    subTitleStyle: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .apply(color: TColors.darkFontColor),
                    subTitleAlign: TextAlign.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.changeThemeMode(ThemeMode.light);
                        storage.saveData('DARK_THEME_MODE', false);
                      },
                      child: Container(
                          width: TDeviceUtils.getScreenWidth(context) * 0.40,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Get.isDarkMode
                                  ? null
                                  : Border.all(width: 2, color: Colors.blue),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                              boxShadow: [
                                TShadowStyle.horizontalProductShadow
                              ]),
                          child: SvgPicture.asset(
                              fit: BoxFit.fill, TImage.lightThemeImage)),
                    ),
                    InkWell(
                      onTap: () {
                        Get.changeThemeMode(ThemeMode.dark);
                        storage.saveData('DARK_THEME_MODE', true);
                      },
                      child: Container(
                          width: TDeviceUtils.getScreenWidth(context) * 0.40,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Get.isDarkMode
                                  ? Border.all(width: 2, color: Colors.blue)
                                  : null,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                              boxShadow: [
                                TShadowStyle.horizontalProductShadow
                              ]),
                          child: SvgPicture.asset(
                            fit: BoxFit.fill,
                            TImage.darkThemeImage,
                          )),
                    ),
                  ],
                ),

                // TGridLayout(
                //   itemCount: 2,
                //   crossAxisCount: 2,
                //   mainAxisExtent: TDeviceUtils.getScreenHeight() * 0.25,
                //   itemBuilder: (_, index) => InkWell(
                //       onTap: () {
                //         if(index == 0) {
                //           //Get . changeTheme (  TAppTheme.lightTheme  ) ;
                //           controller.lightBorder.value=true;
                //           controller.darkBorder.value=false;
                //           Get.changeThemeMode(ThemeMode.light);
                //         }else if(index == 1){
                //           //Get.changeTheme ( TAppTheme.darkTheme ) ;
                //           controller.lightBorder.value=false;
                //           controller.darkBorder.value=true;
                //           Get.changeThemeMode(ThemeMode.dark);
                //         }
                //       },
                //       child: Container(
                //         width: double.minPositive,
                //           decoration: BoxDecoration(
                //               color: Colors.transparent,
                //               borderRadius: const BorderRadius.all(Radius.circular(12)),
                //               boxShadow: [TShadowStyle.horizontalProductShadow]),
                //           child: SvgPicture.asset(
                //             fit: BoxFit.fill,
                //             index == 0
                //                 ? TImage.lightThemeImage
                //                 : TImage.darkThemeImage,
                //           ))),
                // ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),

                /// Currency title and subtitle
                SizedBox(
                  width: double.infinity,
                  child: HorizontalTitleSubTitleWidget(
                    title: TTexts.currencyTitle.tr,
                    subTitle: TTexts.currencySubTitle.tr,
                    titleStyle: Theme.of(context).textTheme.bodyLarge,
                    subTitleStyle: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .apply(color: TColors.darkFontColor),
                    subTitleAlign: TextAlign.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),

                /// Currency Drop Button
                const CurrencyDropDownButton(),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),

                /// Save and Continue Button
                PrimaryButton(loading: false.obs,
                    onPressed: () {
                      storage.saveData(
                          "isOnBoardingAppSettingsScreenFirstTime", false);
                      Get.offAll(() => const OnBoardingScreen());
                    },
                    title: TTexts.saveAndContinue.tr.toUpperCase(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
