import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sejourne/utils/constants/colors.dart';
import 'package:sejourne/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../app/screens/map/multiple.dart';
import '../../../../notifications/screens/notification/notification.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(
        children: [
          SvgPicture.asset(
            TImage.profileIcon,
            height: TSizes.iconMd,
            colorFilter: ColorFilter.mode(
                THelperFunctions.isDarkMode(context)
                    ? TColors.darkIconColor
                    : TColors.lightIconColor,
                BlendMode.srcIn),
          ),
          const SizedBox(
            width: TSizes.md,
          ),
          Text(
            TTexts.profileLabel,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ],
      ),

      /// Location and notification Icons
      Row(
        children: [
          /// Location icon
          TCircularIcon(
            icon: TImage.mapIcon,
            onPressed: () => Get.to(() => const MapSample()),
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
    ]);
  }
}
