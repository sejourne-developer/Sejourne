import 'package:sejourne/data/services/exporter.dart';
import 'package:sejourne/features/app/controllers/user/user_controller.dart';
import 'package:sejourne/features/app/screens/deals/deals.dart';
import 'package:sejourne/features/app/screens/home/widgets/email_verification_widget.dart';
import 'package:sejourne/features/app/screens/home/widgets/home_header.dart';
import 'package:sejourne/features/app/screens/home/widgets/location_list.dart';
import 'package:sejourne/features/app/screens/home/widgets/promo_slider.dart';
import 'package:sejourne/features/app/screens/home/widgets/properties.dart';
import 'package:sejourne/features/app/screens/locations/locations.dart';
import 'package:sejourne/features/app/screens/see_all_properties_or_after_search/see_all_properties_or_after_search.dart';
import 'package:sejourne/utils/local_storage/storage_utility.dart';

import '../../../../common/widgets/texts/section_header.dart';
import '../../controllers/home/home_controller.dart';
import '../../controllers/search/search_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    Get.put(SSearchController());
    final userController = UserController.instance;
    final token = TLocalStorage().readData('TOKEN');
    return Scaffold(
      body: BackgroundImageContainer(
        child: RefreshIndicator(
          color: TColors.accent,
          backgroundColor: THelperFunctions.isDarkMode(context)
              ? TColors.darkContainer
              : TColors.white,
          onRefresh: () => Future.delayed(
            const Duration(milliseconds: 500),
            () {
              debugPrint("Home Screen");
            },
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const NetworkCheckerContainer(),

                /// Header
                const HomeHeader(),

                /// Email Verification Container
                token != null
                    ? userController.user.emailVerifyStatus == 'Verified'
                        ? const SizedBox()
                        : const EmailVerificationWidget()
                    : const SizedBox(),

                /// special for you title
                Padding(
                  padding: const EdgeInsetsDirectional.symmetric(
                      horizontal: TSizes.sm),
                  child: TSectionHeading(
                    title: TTexts.specialForYouLabel.tr,
                    textColor: TColors.darkGrey,
                    onPressed: () => Get.to(() => const DealsScreen()),
                  ),
                ),

                /// -- Promo Slider
                const TPromoSlider(
                  banners: [
                    TImage.promoBanner1,
                    TImage.promoBanner2,
                    TImage.promoBanner3,
                  ],
                ),

                /// location title
                Padding(
                  padding: const EdgeInsets.all(TSizes.sm),
                  child: TSectionHeading(
                    title: TTexts.locationLabel.tr,
                    // onPressed: () => TFullScreenLoader.openLoadingDialog(
                    //     'Logging you in...', TImage.loader),
                    onPressed: () => Get.to(() => const LocationsScreen()),
                  ),
                ),

                /// location list
                const LocationList(),

                /// Properties title
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: TSizes.sm),
                  child: TSectionHeading(
                    title: TTexts.propertiesLabel.tr,
                    onPressed: () => Get.to(
                        () => const SeeAllPropertiesOrAfterSearchScreen()),
                  ),
                ),

                /// Properties List
                const Properties(),

                SizedBox(
                  height: TDeviceUtils.getBottomNavigationBarHeight() * 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
