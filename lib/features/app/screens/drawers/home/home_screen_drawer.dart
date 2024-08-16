import 'package:sejourne/common/widgets/buttons/primary_button.dart';
import 'package:sejourne/common/widgets/custom_shapes/containers/drawers_background_container.dart';
import 'package:sejourne/common/widgets/layouts/list_layout.dart';
import 'package:sejourne/data/services/exporter.dart';
import 'package:sejourne/features/authentication/screens/login/login_screen.dart';
import 'package:sejourne/features/personalization/screens/settings/settings_screen.dart';
import 'package:sejourne/features/personalization/screens/support_and_feedback/support_and_feedback_screen.dart';
import 'package:sejourne/utils/local_storage/storage_utility.dart';
import 'package:sejourne/utils/popups/general_popups/log_out_popup.dart';

import '../../../../../common/widgets/texts/horizontal_icon_text.dart';
import '../../../../personalization/screens/profile/widgets/profile_pic.dart';
import '../../../../personalization/screens/profile/widgets/rating_widget.dart';
import '../../../controllers/drawers/drawer_controller.dart';
import '../../../controllers/user/user_controller.dart';
import '../../compare/compare.dart';
import '../../deals/deals.dart';
import '../../locations/locations.dart';
import '../../search/search.dart';
import '../../see_all_properties_or_after_search/see_all_properties_or_after_search.dart';

class MenuScreen extends GetView<MyDrawerController> {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    final token = TLocalStorage().readData('TOKEN');
    final dark = THelperFunctions.isDarkMode(context);
    final List<String> listTileLabel = [
      TTexts.searchLabel.tr,
      TTexts.propertiesLabel.tr,
      TTexts.deals.tr,
      TTexts.locationsLabel.tr,
      TTexts.compareLabel.tr,
      TTexts.supportLabel.tr,
      TTexts.settingsLabel.tr,
      token != null ? TTexts.signOutLabel.tr : TTexts.login.tr,
    ];

    final List<String> listTileIcon = [
      TImage.searchIcon,
      TImage.propertiesIcon,
      TImage.dealsIcon,
      TImage.locationIcon,
      TImage.compareIcon,
      TImage.supportIcon,
      TImage.settingsIcon,
      TImage.signOutIcon,
    ];
    final List<Widget> route = [
      const SearchBottomSheetScreen(
        drawerMenu: true,
      ),
      const SeeAllPropertiesOrAfterSearchScreen(),
      const DealsScreen(),
      const LocationsScreen(),
      const CompareScreen(),
      const SupportAndFeedbackScreen(),
      const SettingsScreen(),
      Container(),
    ];
    return DrawersBackgroundContainer(
      isDrawer: true,

      /// Profile Picture and User name
      child: SizedBox(
        height: TDeviceUtils.getScreenHeight(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: TDeviceUtils.getAppBarHeight(),
            ),

            /// Profile Pic
            const ProfilePic(
              image: TImage.userPNG,
              showCameraIcon: false,
              size: 72,
            ),
            const SizedBox(
              height: TSizes.sm,
            ),
            token != null
                ? Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          /// User Name
                          Text(controller.user.fullName!,
                              style: Theme.of(context).textTheme.bodyLarge!.apply(
                                  color:
                                      dark ? TColors.darkGrey : TColors.primary)),
                          const SizedBox(
                            width: TSizes.sm,
                          ),

                          /// Verified Icon
                          controller.user.emailVerifyStatus == 'Verified'
                              ? SvgPicture.asset(TImage.verifiedIcon)
                              : const SizedBox(),
                        ],
                      ),

                      /// Location
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: HorizontalIconText(
                            isSub: false,
                            icon: TImage.locationIcon,
                            iconColor: dark ? TColors.darkGrey : TColors.primary,
                            title: TTexts.dubai.tr,
                            titleTextStyle: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .apply(
                                    color: dark
                                        ? TColors.darkGrey
                                        : TColors.primary)),
                      ),
                      FittedBox(
                        child: TRatingWidget(
                          ratingBarWidth:
                              TDeviceUtils.getScreenWidth(context) * 0.16,
                          iconSize: TSizes.iconXs,
                          ratingBarHeight: TSizes.md,
                          ratingTextStyle: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .apply(
                                  color:
                                      dark ? TColors.darkGrey : TColors.primary),
                          reviewsTextStyle: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .apply(
                                  color:
                                      dark ? TColors.darkGrey : TColors.primary),
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      Text(
                        TTexts.guestUser.tr,
                        style: Theme.of(context).textTheme.bodyLarge!.apply(
                            color:
                                dark ? TColors.darkFontColor : TColors.primary),
                      ),
                      const SizedBox(
                        height: TSizes.sm,
                      ),
                      PrimaryButton(
                          height: 32,
                          width: 78,
                          radius: TSizes.sm,
                          textStyle: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .apply(
                                  color: dark
                                      ? TColors.darkFontColor
                                      : TColors.white),
                          onPressed: () => Get.to(const LoginScreen()),
                          loading: false.obs,
                          title: TTexts.login.tr),
                    ],
                  ),

            SizedBox(
              height: token != null ? TSizes.spaceBtwSections : TSizes.md,
            ),

            Flexible(
              child: ListLayout(
                padding: const EdgeInsets.all(TSizes.md),
                itemCount: listTileLabel.length,
                separatorHeight: TSizes.sm,
                physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (_, index) => InkWell(
                  onTap: () => index == listTileLabel.length - 1
                      ? token != null
                          ? showDialog(
                              context: context,
                              builder: (context) => const LogOutPopUpForm())
                          : Get.to(() => const LoginScreen())
                      : Get.to(() => route[index]),
                  child: HorizontalIconText(
                    isSub: false,
                    icon: listTileIcon[index],
                    iconSize: TSizes.iconSm,
                    iconColor: dark ? TColors.darkGrey : TColors.primary,
                    title: listTileLabel[index],
                    titleTextStyle: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .apply(color: dark ? TColors.darkGrey : TColors.primary),
                  ),
                ),
              ),
            ),

            const SizedBox(height: TSizes.spaceBtwSections*2,)
          ],
        ),
      ),
    );
  }
}
