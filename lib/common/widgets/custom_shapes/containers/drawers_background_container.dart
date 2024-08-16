import '../../../../data/services/exporter.dart';
import '../../texts/horizontal_icon_text.dart';
import 'circular_container.dart';

class DrawersBackgroundContainer extends StatelessWidget {
  const DrawersBackgroundContainer(
      {super.key, this.child, this.isDrawer = false});

  final Widget? child;
  final bool isDrawer;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      height: double.infinity,
      color: dark ? TColors.black : TColors.white,
      child: SingleChildScrollView(
        child: Stack(
          children: [
            /// footer background image
            PositionedDirectional(
              bottom: 10,
              start: 10,
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: TDeviceUtils.getBottomNavigationBarHeight()),
                child: Image.asset(
                  dark
                      ? TImage.drawerDarkBackground
                      : TImage.drawerLightBackground,
                  fit: BoxFit.cover,
                  // height: 800,
                  // width: 100,
                ),
              ),
            ),

            /// upper Circle
            PositionedDirectional(
              top: -300,
              start: -TDeviceUtils.getScreenWidth(context) * 0.29,
              child: TCircularContainer(
                backgroundColor: dark ? TColors.dark : TColors.primary,
                padding: TSizes.defaultSpace,
                child:isDrawer?const SizedBox(): Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: FittedBox(
                    // height: 56,
                    // width: 72,
                    child: HorizontalIconText(
                      iconColor: THelperFunctions.isDarkMode(context)
                          ? TColors.darkIconColor
                          : TColors.white,
                      titleTextStyle: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .apply(
                              color: THelperFunctions.isDarkMode(context)
                                  ? TColors.darkFontColor
                                  : TColors.white),
                      isSub: false,
                      iconSize: TSizes.iconSm,
                      icon: TImage.filterIcon,
                      title: TTexts.filterLabel.tr,
                    ),
                  ),
                ),
              ),
            ),

            /// footer Circle
            PositionedDirectional(
              bottom: -300,
              start: -TDeviceUtils.getScreenWidth(context) * 0.29,
              child: TCircularContainer(
                backgroundColor: dark ? TColors.dark : TColors.primary,
                padding: TSizes.spaceBtwSections,
                child: Align(
                  alignment: AlignmentDirectional.topCenter,
                  child: Text(
                    TTexts.copyRight.tr,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .apply(color: TColors.white),
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),

            Padding(
              padding: EdgeInsetsDirectional.only(
                  top: isDrawer ? 0 : TSizes.spaceBtwSections * 4,
                  bottom: isDrawer ? 0 : TSizes.spaceBtwSections * 5,
                  start: TSizes.sm,
                  end: TSizes.sm),
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
