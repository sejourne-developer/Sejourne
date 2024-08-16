import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';
import '../../../utils/device/device_utility.dart';
import '../../../utils/helpers/network_manager.dart';

class NetworkCheckerContainer extends StatelessWidget {
  const NetworkCheckerContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final networkController = Get.find<NetworkManager>();
    return Obx(
      () => AnimatedContainer(
        width: TDeviceUtils.getScreenWidth(context),
        height: networkController.containerHeight.value,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        color: TColors.dark,
        child:networkController.containerHeight.value==0?const SizedBox():Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Icon(
                Icons.wifi_off,
                color: TColors.white,
              ),
              const SizedBox(
                width: TSizes.md,
              ),
              Text(
                TTexts.noInternetConnect.tr,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .apply(color: TColors.white),
              )
            ]),
      ),
    );
  }
}
