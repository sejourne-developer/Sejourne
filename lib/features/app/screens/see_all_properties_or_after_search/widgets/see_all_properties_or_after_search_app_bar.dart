import 'package:sejourne/data/services/exporter.dart';
import 'package:sejourne/features/app/controllers/drawers/drawer_controller.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/texts/horizontal_icon_text.dart';

class SeeAllPropertiesOrAfterSearchAppBar extends StatelessWidget {
  const SeeAllPropertiesOrAfterSearchAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TAppBar(
      /// App bar Title
      title:  Text(TTexts.searchLabel.tr),
      leadingIcon:Get.locale==arabic?TImage.rightArrowIcon: TImage.backArrow,
      actions: [
        /// Filter Button
        TRoundedContainer(
          onPressed: () => MyDrawerController
              .instance.searchScaffoldKey.currentState
              ?.openEndDrawer(),
          width: TSizes.appBarHeight,
          height: TSizes.defaultSpace,
          isGradient: false,
          showBorder: true,
          margin: const EdgeInsets.symmetric(horizontal: TSizes.sm),
          padding: const EdgeInsets.symmetric(horizontal: TSizes.sm),
          radius: TSizes.xs,
          child: FittedBox(
            child: HorizontalIconText(
                iconColor: THelperFunctions.isDarkMode(context)
                    ? TColors.darkIconColor
                    : TColors.primary,
                titleTextStyle: Theme.of(context).textTheme.labelSmall!.apply(
                    color: THelperFunctions.isDarkMode(context)
                        ? TColors.darkFontColor
                        : TColors.primary),
                isSub: false,
                icon: TImage.filterIcon,
                title:TTexts.filterLabel.tr),
          ),
        ),
      ],
    );
  }
}
