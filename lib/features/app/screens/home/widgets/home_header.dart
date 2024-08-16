import 'package:sejourne/data/services/exporter.dart';
import 'package:sejourne/features/app/screens/home/widgets/location_bottom_sheet.dart';
import '../../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../notifications/screens/notification/notification.dart';
import '../../../controllers/drawers/drawer_controller.dart';
import '../../../controllers/search/search_controller.dart';
import '../../map/multiple.dart';
import '../../search/search.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      margin: EdgeInsets.only(
          top: TDeviceUtils.getAppBarHeight(),
          right: TSizes.sm,
          left: TSizes.sm),
      padding: const EdgeInsets.symmetric(
          horizontal: TSizes.md, vertical: TSizes.sm),
      gradient: dark ? TColors.darkLinerGradient : TColors.linerGradient,
      isGradient: true,
      height: TDeviceUtils.getScreenHeight() * 0.18,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          /// Location and menu and notification Icons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  /// Menu Icon
                  TCircularIcon(
                    icon: TImage.menuIcon,
                    onPressed: () {
                      MyDrawerController.instance.homeScaffoldKey.currentState
                          ?.openDrawer();
                      //controller.toggleDrawer();
                    },
                  ),
                  const SizedBox(
                    width: TSizes.md,
                  ),

                  /// Location And Drop Down Menu Column
                  GestureDetector(
                    onTap: () => Get.bottomSheet(
                      backgroundColor: THelperFunctions.isDarkMode(context)?TColors.dark:TColors.light,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadiusDirectional.only(topStart:Radius.circular(TSizes.md),topEnd:Radius.circular(TSizes.md),),

                      ),
                      // barrierColor: Colors.red,
                      ignoreSafeArea: false, // add this// add this
                      SizedBox(
                        height: TDeviceUtils.getScreenHeight() * 0.75,
                        child: const LocationsBottomSheet(),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Location Label
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            TTexts.locationLabel.tr,
                            style:
                                Theme.of(context).textTheme.labelLarge!.apply(
                                      color: dark
                                          ? TColors.darkFontColor
                                          : TColors.white,
                                    ),
                          ),
                        ),

                        /// Locations menu in bottom sheet
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            /// Icon
                            SvgPicture.asset(
                              TImage.homeLocationIcon,
                              width: TSizes.iconXs,
                              height: TSizes.iconXs,
                              colorFilter: ColorFilter.mode(
                                  dark ? TColors.darkIconColor : TColors.white,
                                  BlendMode.srcIn),
                            ),
                            const SizedBox(
                              width: TSizes.xs,
                            ),
                            ConstrainedBox(
                              constraints: BoxConstraints(
                                  minWidth: TSizes.md,
                                  maxWidth:
                                      TDeviceUtils.getScreenWidth(context) *
                                          0.25),
                              child: Obx(
                                () => Text(
                                  SSearchController
                                      .instance.selectedLocationValue.value,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .apply(
                                          color: dark
                                              ? TColors.darkFontColor
                                              : TColors.white),
                                  maxLines: 1,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: TSizes.xs,
                            ),
                            SvgPicture.asset(
                              TImage.arrowDownIcon,
                              height: TSizes.iconSm,
                              width: TSizes.iconSm,
                              colorFilter: ColorFilter.mode(
                                  dark ? TColors.darkIconColor : TColors.white,
                                  BlendMode.srcIn),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              /// Location and notification Icons
              Row(
                children: [
                  /// Map icon
                  TCircularIcon(
                    onPressed: () => Get.to(() => const MapSample()),
                    icon: TImage.mapIcon,
                  ),
                  const SizedBox(
                    width: TSizes.md,
                  ),

                  /// notification Icon
                  TCircularIcon(
                    icon: TImage.notificationIcon,
                    onPressed: () => Get.to(() => const NotificationScreen()),
                  ),
                ],
              ),
            ],
          ),

          /// Search and Filter row
          SizedBox(
            height: 48,
            child: Row(
              children: [
                Expanded(
                    flex: 11,
                    child: TSearchContainer(
                      /// Open bottom sheet
                      onTap: () async => await Get.bottomSheet(
                        backgroundColor: THelperFunctions.isDarkMode(context)?TColors.dark:TColors.light,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.only(topStart:Radius.circular(TSizes.md),topEnd:Radius.circular(TSizes.md),),

                        ),
                        // barrierColor: Colors.red,
                        ignoreSafeArea: false, // add this
                        SizedBox(
                            height: TDeviceUtils.getScreenHeight() * 0.75,
                            child: const SearchBottomSheetScreen()),
                      ),
                      text: TTexts.searchLabel.tr,
                      padding: EdgeInsets.zero,
                    )),
                const SizedBox(
                  width: TSizes.sm,
                ),

                /// Filter Icon
                Expanded(
                  flex: 2,
                  child: TRoundedContainer(
                    onPressed: () {
                      // controller.toggleEndDrawer();
                      //controller.openEndDrawer();
                      MyDrawerController.instance.homeScaffoldKey.currentState
                          ?.openEndDrawer();
                    },
                    padding: const EdgeInsets.all(TSizes.md - 2),
                    backgroundColor:
                        dark ? TColors.blackContainer : TColors.light,
                    isGradient: false,
                    showBorder: true,
                    radius: TSizes.sm,
                    width: TSizes.iconLg,
                    height: 44,
                    child: SvgPicture.asset(
                      TImage.filterIcon,
                      colorFilter: ColorFilter.mode(
                          dark ? TColors.darkIconColor : TColors.primary,
                          BlendMode.srcIn),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
