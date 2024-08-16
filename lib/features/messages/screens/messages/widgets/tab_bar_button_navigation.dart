import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/custom_shapes/containers/status_container.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../controllers/messages/messages_controller.dart';

class TabBarButton extends StatelessWidget {
  const TabBarButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MessagesController());
    return SizedBox(
      height: 56,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: TSizes.sm, vertical: TSizes.md),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Obx(
            () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      controller.tabBarButtonClicked(0);
                    },
                    child: StatusContainer(
                      padding: const EdgeInsetsDirectional.symmetric(
                          horizontal: TSizes.md),
                      isGradient: controller.isGra1.value,
                      textStyle: controller.isGra1.value
                          ? Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .apply(color: Colors.white)
                          : null,
                      backgroundColor: Colors.white,
                      label: TTexts.allLabel.tr,
                    ),
                  ),
                  const SizedBox(
                    width: TSizes.xs,
                  ),
                  InkWell(
                    onTap: () {
                      controller.tabBarButtonClicked(1);
                    },
                    child: StatusContainer(
                      padding: const EdgeInsetsDirectional.symmetric(
                          horizontal: TSizes.md),
                      isGradient: controller.isGra2.value,
                      textStyle: controller.isGra2.value
                          ? Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .apply(color: Colors.white)
                          : null,
                      backgroundColor: Colors.white,
                      label: TTexts.openLabel.tr,
                    ),
                  ),
                  const SizedBox(
                    width: TSizes.xs,
                  ),
                  InkWell(
                    onTap: () {
                      controller.tabBarButtonClicked(2);
                    },
                    child: StatusContainer(
                      padding: const EdgeInsetsDirectional.symmetric(
                          horizontal: TSizes.md),
                      isGradient: controller.isGra3.value,
                      textStyle: controller.isGra3.value
                          ? Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .apply(color: Colors.white)
                          : null,
                      backgroundColor: Colors.white,
                      label: TTexts.snoozedLabel.tr,
                    ),
                  ),
                  const SizedBox(
                    width: TSizes.xs,
                  ),
                  InkWell(
                    onTap: () {
                      controller.tabBarButtonClicked(3);
                    },
                    child: StatusContainer(
                      padding: const EdgeInsetsDirectional.symmetric(
                          horizontal: TSizes.md),
                      isGradient: controller.isGra4.value,
                      textStyle: controller.isGra4.value
                          ? Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .apply(color: Colors.white)
                          : null,
                      backgroundColor: Colors.white,
                      label: TTexts.closedLabel.tr,
                    ),
                  ),
                  const SizedBox(
                    width: TSizes.xs,
                  ),
                  InkWell(
                    onTap: () {
                      controller.tabBarButtonClicked(4);
                    },
                    child: StatusContainer(
                      padding: const EdgeInsetsDirectional.symmetric(
                          horizontal: TSizes.md),
                      isGradient: controller.isGra5.value,
                      textStyle: controller.isGra5.value
                          ? Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .apply(color: Colors.white)
                          : null,
                      backgroundColor: Colors.white,
                      label: TTexts.archivedLabel.tr,
                    ),
                  ),
                  const SizedBox(
                    width: TSizes.xs,
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
