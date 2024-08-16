import 'package:sejourne/common/widgets/login_sing_up_widgets/you_must_login_first.dart';
import 'package:sejourne/data/services/exporter.dart';
import 'package:sejourne/utils/local_storage/storage_utility.dart';

import '../home/widgets/properties.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final token = TLocalStorage().readData("TOKEN");
    return Scaffold(
      resizeToAvoidBottomInset: false,
      endDrawerEnableOpenDragGesture: false,
      body: BackgroundImageContainer(
        child: RefreshIndicator(
          color: TColors.accent,
          backgroundColor: THelperFunctions.isDarkMode(context)
              ? TColors.darkContainer
              : TColors.white,
          onRefresh: () => Future.delayed(
            const Duration(milliseconds: 500),
            () {
              debugPrint("wish List Screen");
            },
          ),
          child: token != null
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      const NetworkCheckerContainer(),

                      /// App Bar
                      Padding(
                        padding: TSpacingStyle.paddingWithAppBarHeight2,
                        child: MainScreensAppBar(
                            leadingIcon: TImage.wishListIcon,
                            title: TTexts.wishListLabel.tr),
                      ),

                      const SizedBox(
                        height: TSizes.md,
                      ),
                        const Properties(),

                      SizedBox(
                        height: TDeviceUtils.getBottomNavigationBarHeight() * 2,
                      ),
                    ],
                  ),
                )
              : YouMustLoginFirst(
                  appBarTitle: TTexts.wishListLabel.tr,
                  appBarIcon: TImage.wishListIcon,
                ),
        ),
      ),
    );
  }
}
