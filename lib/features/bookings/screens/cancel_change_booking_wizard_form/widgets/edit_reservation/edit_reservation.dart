import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sejourne/common/widgets/layouts/list_layout.dart';

import '../../../../../../common/widgets/buttons/primary_button.dart';
import '../../../../../../common/widgets/layouts/profile_features_item_list.dart';
import '../../../../../../common/widgets/texts/section_heading_with_edit_Icon.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/image_strings.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/text_strings.dart';
import '../../../../../../utils/helpers/helper_functions.dart';
import '../../../../controllers/booking_controller/cancel_change_booking_wizard_form_controller.dart';

class EditReservation extends StatelessWidget {
  const EditReservation({
    super.key,
    this.onContinuePressed,
    this.onBackPressed,
  });

  final VoidCallback? onContinuePressed, onBackPressed;

  @override
  Widget build(BuildContext context) {
    final controller = CancelChangeBookingWizardFormController.instance;
    final darkMode = THelperFunctions.isDarkMode(context);
    List<String> buttons = [
      TTexts.changeReservationTitle.tr,
      TTexts.cancelReservationTitle.tr
    ];
    List<String> subTitle = [
      TTexts.changeReservationSubTitle.tr,
      TTexts.cancelReservationSubTitle.tr
    ];
    List<String> icons = [
      TImage.changeReservationIcon,
      TImage.cancelReservationIcon
    ];
    return Column(
      children: [
        Text(
          TTexts.editReservation.tr,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SectionHeadingWithEditIcon(
          title: TTexts.selectOptionLabel.tr,
          showEditButton: false,
          onPressed: () {},
        ),
        ListLayout(
          itemCount: 2,
          padding: EdgeInsets.zero,
          itemBuilder: (_, index) => Obx(
            () => InkWell(
              onTap: () => controller.selectOption.value = index,
              child: Container(
                padding: EdgeInsets.zero,
                margin: const EdgeInsetsDirectional.only(bottom: TSizes.md),
                decoration: BoxDecoration(
                  color: Get.isDarkMode ? TColors.darkContainer : TColors.white,
                  border: controller.selectOption.value == index
                      ? Border.all(width: 2, color: TColors.accent)
                      : null,
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
                child: ProfileFeaturesItemList(
                  icon: icons[index],
                  title: buttons[index],
                  isVerified: false,
                  showEditButton: false,
                  subTitle: subTitle[index],
                  margin: EdgeInsets.zero,
                ),
              ),
            ),
          ),
        ),
        const Spacer(),
        PrimaryButton(
          loading: false.obs,
          title: TTexts.sContinue.tr,
          onPressed: onContinuePressed,
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        TextButton(
            onPressed: onBackPressed,
            child: Text(
              TTexts.keepReservation.tr,
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: darkMode ? TColors.darkFontColor : TColors.darkGrey),
            )),
        const SizedBox(
          height: TSizes.spaceBtwSections,
        ),
      ],
    );
  }
}
