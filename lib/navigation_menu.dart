import 'package:sejourne/data/services/exporter.dart';
import 'package:sejourne/features/app/controllers/user/user_controller.dart';
import 'package:sejourne/features/app/screens/wishlist/wishlist.dart';
import 'features/app/controllers/drawers/drawer_controller.dart';
import 'features/app/screens/drawers/home/home_screen_drawer.dart';
import 'features/app/screens/drawers/home/home_screen_search_end_drawer_filter_menu.dart';
import 'features/app/screens/drawers/messages/messages_screen_end_drawer_filter.dart';
import 'features/app/screens/home/home_screen.dart';
import 'features/bookings/screens/myBooking/my_booking.dart';
import 'features/messages/screens/messages/messages.dart';
import 'features/personalization/screens/profile/profile.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({Key? key1}) : super(key: key1);

  @override
  Widget build(BuildContext context) {
    final navController = Get.put(NavigationController());
    Get.lazyPut(()=>MyDrawerController());
    final dark = THelperFunctions.isDarkMode(context);
    final ColorFilter colorFilter = ColorFilter.mode(
        dark ? TColors.darkIconColor : TColors.lightIconColor, BlendMode.srcIn);
    return PopScope(
      canPop: false,
      child: DefaultTabController(
        length: 5,
        child: Scaffold(
          key: MyDrawerController.instance.homeScaffoldKey,
          extendBody: true,
          resizeToAvoidBottomInset: false,
          endDrawerEnableOpenDragGesture: false,
          drawerEnableOpenDragGesture: false,
          drawer: Drawer(
            shape: InputBorder.none,
            width: TDeviceUtils.getScreenWidth(context) * 0.50,
            child: const MenuScreen(),
          ),
          endDrawer: Drawer(
            shape: InputBorder.none,
            width: TDeviceUtils.getScreenWidth(context) * 0.50,
            child: Obx(() => navController.currentPageIndex.value == 0
                ? const HomeScreenSearchEndDrawerFilter()
                : navController.currentPageIndex.value == 3
                ? const MessageScreenEndDrawerFilter()
                : const SizedBox()),
          ),

          bottomNavigationBar: Container(
            height: TDeviceUtils.getBottomNavigationBarHeight(),
            width: double.infinity,
            decoration: BoxDecoration(
                color: dark ? TColors.blackContainer : TColors.white,
                boxShadow: [TShadowStyle.verticalProductShadow],
                borderRadius: const BorderRadiusDirectional.only(
                  topStart: Radius.circular(TSizes.md),
                  topEnd: Radius.circular(TSizes.md),
                )),
            child: TabBar(
              onTap: (pageIndex) {
                NavigationController.instance.currentPageIndex.value =
                    pageIndex;
              },
              tabs: [
                Tab(
                  icon: SvgPicture.asset(
                    TImage.homeIcon,
                    colorFilter: colorFilter,
                  ),
                  text: TTexts.homeLabel.tr,
                ),
                Tab(
                  icon: SvgPicture.asset(
                    TImage.wishListIcon,
                    colorFilter: colorFilter,
                  ),
                  text: TTexts.wishListLabel.tr,
                ),
                Tab(
                  icon: SvgPicture.asset(
                    TImage.bookingsIcon,
                    colorFilter: colorFilter,
                  ),
                  text: TTexts.myBookingsLabel.tr,
                ),
                Tab(
                  icon: SvgPicture.asset(
                    TImage.messagesIcon,
                    colorFilter: colorFilter,
                  ),
                  text: TTexts.messagesLabel.tr,
                ),
                Tab(
                  icon: SvgPicture.asset(
                    TImage.profileIcon,
                    colorFilter: colorFilter,
                  ),
                  text: TTexts.profileLabel.tr,
                ),
              ],
            ),
          ),

          body: const TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              HomeScreen(),
              WishListScreen(),
              MyBookingsScreen(),
              MessagesScreen(),
              ProfileScreen(),
            ],
          ),
          //body: Obx(() => controller.screens[controller.selectedIndex.value]),
        ),
      ),
    );
  }
}

class NavigationController extends GetxController {
  static NavigationController get instance => Get.find();
  final Rx<int> currentPageIndex = 0.obs;

  @override
  void onReady() {
    super.onReady();
    Get.put(UserController());
  }
}
