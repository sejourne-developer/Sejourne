import 'package:sejourne/common/widgets/buttons/primary_button.dart';
import 'package:sejourne/common/widgets/layouts/grid_layout.dart';
import 'package:sejourne/common/widgets/texts/horizontal_icon_text.dart';
import 'package:sejourne/data/services/exporter.dart';
import 'package:sejourne/features/personalization/screens/documents/document_screen.dart';
import 'package:sejourne/features/personalization/screens/personal_details/personal_details.dart';
import 'package:sejourne/features/personalization/screens/preferences/preferences_screen.dart';
import 'package:sejourne/features/personalization/screens/profile/widgets/icon_title.dart';
import 'package:sejourne/features/personalization/screens/profile/widgets/profile_pic.dart';
import 'package:sejourne/features/personalization/screens/profile/widgets/rating_widget.dart';
import 'package:sejourne/features/personalization/screens/settings/settings_screen.dart';
import 'package:sejourne/features/personalization/screens/support_and_feedback/support_and_feedback_screen.dart';
import 'package:sejourne/utils/local_storage/storage_utility.dart';
import 'package:sejourne/utils/popups/general_popups/login_popup_container.dart';

import '../../../app/controllers/user/user_controller.dart';
import '../legal_information/legal_information_screen.dart';
import '../payment/payment_screen.dart';
import '../reviews/reviews_screen.dart';
import '../security/security_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    final token = TLocalStorage().readData('TOKEN');
    List titles = [
      TTexts.personalLabel.tr,
      TTexts.preferencesLabel.tr,
      TTexts.securityLabel.tr,
      TTexts.paymentLabel.tr,
      TTexts.legalLabel.tr,
      TTexts.documentLabel.tr,
      TTexts.reviewsLabel.tr,
      TTexts.supportLabel.tr,
      TTexts.settingsLabel.tr,
    ];
    List icons = [
      TImage.personal,
      TImage.preferences,
      TImage.security,
      TImage.payment,
      TImage.legalIcon,
      TImage.documentsIcon,
      TImage.reviewsIcon,
      TImage.supportIcon2,
      TImage.settings,
    ];

    List<Widget> route = [
      const PersonalDetails(),
      const PreferencesScreen(),
      const SecurityScreen(),
      const PaymentScreen(),
      const LegalInformationScreen(),
      const DocumentScreen(),
      const ReviewsScreen(),
      const SupportAndFeedbackScreen(),
      const SettingsScreen(),
    ];

    return Scaffold(
      endDrawerEnableOpenDragGesture: false,
      backgroundColor: Colors.transparent,

      /// Body
      body: BackgroundImageContainer(
        child: SingleChildScrollView(
          child: Obx(
            () => controller.profileLoading.value
                ? SizedBox(
                    height: TDeviceUtils.getScreenHeight(),
                    child: const Center(child: CircularProgressIndicator()),
                  )
                : Column(
                    children: [
                      const NetworkCheckerContainer(),
                      Padding(
                        padding: TSpacingStyle.paddingWithAppBarHeight2,
                        child: Column(
                          children: [
                            MainScreensAppBar(
                                leadingIcon: TImage.profileIcon,
                                title: TTexts.profileLabel.tr),

                            /// Profile Picture and User name
                            const SizedBox(
                              height: TSizes.spaceBtwSections,
                            ),
                            SizedBox(
                              height: 220,
                              child: Stack(children: [
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: TRoundedContainer(
                                    height: 150,
                                    isGradient: true,
                                    padding: EdgeInsets.only(
                                        bottom: token != null
                                            ? TSizes.defaultSpace
                                            : TSizes.md),
                                    width: double.infinity,
                                    child: token != null
                                        ? Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  /// User Name
                                                  FittedBox(
                                                    fit: BoxFit.scaleDown,
                                                    child: Text(
                                                      controller.user.fullName!,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineSmall!
                                                          .apply(
                                                              color: TColors
                                                                  .white),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: TSizes.sm,
                                                  ),

                                                  /// Verified Icon
                                                  controller.user
                                                              .emailVerifyStatus ==
                                                          'Verified'
                                                      ? SvgPicture.asset(
                                                          TImage.verifiedIcon)
                                                      : const SizedBox(),
                                                ],
                                              ),

                                              const SizedBox(
                                                height: TSizes.xs,
                                              ),

                                              /// Location
                                              HorizontalIconText(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                icon: TImage.locationIcon,
                                                iconColor: TColors.white,
                                                isSub: false,
                                                maxLine: 1,
                                                title: TTexts.dubai.tr,
                                                titleTextStyle:
                                                    Theme.of(context)
                                                        .textTheme
                                                        .labelSmall!
                                                        .apply(
                                                          color: TColors.white,
                                                        ),
                                              ),

                                              const SizedBox(
                                                height: TSizes.xs,
                                              ),

                                              FittedBox(
                                                fit: BoxFit.scaleDown,
                                                child: TRatingWidget(
                                                  iconSize: TDeviceUtils
                                                          .getScreenWidth(
                                                              context) *
                                                      0.05,
                                                  ratingBarWidth: TDeviceUtils
                                                          .getScreenWidth(
                                                              context) *
                                                      0.25,
                                                ),
                                              ),
                                            ],
                                          )
                                        : Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                TTexts.guestUser.tr,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge!
                                                    .apply(
                                                        color: TColors.white),
                                              ),
                                              const SizedBox(
                                                height: TSizes.sm,
                                              ),
                                              PrimaryButton(
                                                buttonBackgroundColor:
                                                    TColors.white,
                                                loading: false.obs,
                                                onPressed: () => showDialog(
                                                    context: context,
                                                    builder: (context) =>
                                                        const LoginPopUpContainer()),
                                                title: TTexts.login.tr,
                                                height: 32,
                                                width: 78,
                                                radius: TSizes.sm,
                                                textStyle: Theme.of(context)
                                                    .textTheme
                                                    .labelMedium!,
                                              ),
                                            ],
                                          ),
                                  ),
                                ),

                                /// Profile Pic
                                Positioned(
                                  //top: 20,
                                  left:
                                      TDeviceUtils.getScreenWidth(context) / 3,
                                  child: const ProfilePic(
                                    image: TImage.user2,
                                  ),
                                ),
                              ]),
                            ),
                            const SizedBox(
                              height: TSizes.spaceBtwSections,
                            ),

                            ///
                            TGridLayout(
                                itemCount: titles.length,
                                crossAxisSpacing: TSizes.sm,
                                mainAxisSpacing: TSizes.sm,
                                mainAxisExtent: 120,
                                itemBuilder: (_, index) => TRoundedContainer(
                                      onPressed: () =>token != null? Get.to(() => route[index]):index==4 ||index==7 ||index==8 ?
                                          Get.to(() => route[index]):showDialog(
                                        context: context,
                                        builder: (context)=>const LoginPopUpContainer()
                                      ),
                                      showBorder: true,
                                      isGradient: false,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: TSizes.md),
                                      shadow: TShadowStyle.containerShadow,
                                      child: IconTitle(
                                        showBorder: false,
                                        title: titles[index],
                                        icon: icons[index],
                                      ),
                                    )),
                            const SizedBox(
                              height: TSizes.spaceBtwSections,
                            ),
                            const SizedBox(
                              height: TSizes.appBarHeight * 2,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
