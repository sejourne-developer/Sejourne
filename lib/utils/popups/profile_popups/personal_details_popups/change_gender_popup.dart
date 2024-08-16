import 'package:sejourne/data/services/exporter.dart';

import '../../../../common/widgets/icons/dotted_circle_border_icon.dart';
import '../../../../features/personalization/controllers/personal_details_controller.dart';
import '../../general_popups/primary_popup_container.dart';

class ChangeGenderPopUpForm extends StatelessWidget {
  const ChangeGenderPopUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = PersonalInformationController.instance;
    return Material(
      color: Colors.transparent,
      child: PrimaryPopupContainer(
        headIcon: TImage.genderIcon,
        title: TTexts.changeGender.tr,
        subTitle: TTexts.changeYourGender.tr,
        buttonText: TTexts.updateLabel.tr,
        onPressed: () {
          Get.back();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: TSizes.md, vertical: TSizes.md),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(
                () => InkWell(
                  onTap: () => controller.genderSelect.value = 0,
                  child: Container(
                      padding: const EdgeInsetsDirectional.symmetric(
                          vertical: TSizes.md),
                      width: TDeviceUtils.getScreenWidth(context) * 0.40,
                      decoration: BoxDecoration(
                          color: Get.isDarkMode
                              ? TColors.darkContainer
                              : TColors.white,
                          border: controller.genderSelect.value == 1
                              ? null
                              : Border.all(width: 2, color: Colors.blue),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                          boxShadow: [TShadowStyle.horizontalProductShadow]),
                      child: Column(children: [
                        const SizedBox(
                          height: 120,
                          width: 120,
                          child: DottedCircleBorderIcon(
                            icon: TImage.maleIcon,
                            iconSize: TSizes.iconLg,
                            borderColor: TColors.darkPrimaryBorderColor,
                          ),
                        ),
                        Text(TTexts.male.tr)
                      ])),
                ),
              ),
              Obx(
                () => InkWell(
                  onTap: () => controller.genderSelect.value = 1,
                  child: Container(
                      padding: const EdgeInsetsDirectional.symmetric(
                          vertical: TSizes.md),
                      width: TDeviceUtils.getScreenWidth(context) * 0.40,
                      decoration: BoxDecoration(
                          color: Get.isDarkMode
                              ? TColors.darkContainer
                              : TColors.white,
                          border: controller.genderSelect.value == 1
                              ? Border.all(width: 2, color: TColors.accent)
                              : null,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                          boxShadow: [TShadowStyle.horizontalProductShadow]),
                      child: Column(children: [
                        const SizedBox(
                          height: 120,
                          width: 120,
                          child: DottedCircleBorderIcon(
                            icon: TImage.femaleIcon,
                            iconSize: TSizes.iconLg,
                            borderColor: TColors.darkPrimaryBorderColor,
                          ),
                        ),
                        Text(TTexts.female.tr)
                      ])),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
