import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sejourne/common/widgets/appbar/appbar.dart';
import 'package:sejourne/common/widgets/custom_shapes/containers/background_image_container.dart';
import 'package:sejourne/common/widgets/layouts/list_layout.dart';
import 'package:sejourne/features/personalization/controllers/personal_details_controller.dart';
import 'package:sejourne/utils/popups/profile_popups/personal_details_popups/change_birth_date_popup.dart';
import 'package:sejourne/utils/popups/profile_popups/personal_details_popups/change_display_name_popup.dart';
import 'package:sejourne/utils/popups/profile_popups/personal_details_popups/change_email_popup.dart';
import 'package:sejourne/utils/popups/profile_popups/personal_details_popups/change_gender_popup.dart';
import 'package:sejourne/utils/popups/profile_popups/personal_details_popups/change_name_popup.dart';
import 'package:sejourne/utils/popups/profile_popups/personal_details_popups/change_nationality_popup.dart';
import 'package:sejourne/utils/constants/image_strings.dart';
import 'package:sejourne/utils/constants/sizes.dart';
import '../../../../common/widgets/layouts/profile_features_item_list.dart';
import '../../../../data/services/app_variables.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/popups/profile_popups/personal_details_popups/change_phone_popup.dart';

class PersonalDetails extends StatelessWidget {
  const PersonalDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PersonalInformationController());
    List<String> title = [
      TTexts.name.tr,
      TTexts.display.tr,
      TTexts.loginEmailHint.tr,
      TTexts.phone.tr,
      TTexts.bd.tr,
      TTexts.nationality.tr,
      TTexts.gender.tr,
    ];
    List<String> subTitle = [
      "Gasan Mansour",
      "Gasan Mansour",
      "apps@sejourne.ae",
      "+971 4585 0475",
      TTexts.enterBD.tr,
      TTexts.selectCountry.tr,
      TTexts.selectGender.tr,
    ];
    List<String> icons = [
      TImage.userProfileIcon,
      TImage.displayNameIcon,
      TImage.emailIcon,
      TImage.phoneIcon,
      TImage.searchBookingIcon,
      TImage.flagIcon,
      TImage.genderIcon,
    ];
    List<Widget> onPressed = [
      const ChangeNamePopUpForm(),
      const ChangeDisplayNamePopUpForm(),
      const ChangeEmailPopUpForm(),
      const ChangePhonePopUpForm(),
      const ChangeBirthDatePopUpForm(),
      const ChangeNationalityPopUpForm(),
      const ChangeGenderPopUpForm(),
    ];
    return BackgroundImageContainer(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.sm),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// App bar
              TAppBar(
                leadingIcon:Get.locale==arabic?TImage.rightArrowIcon: TImage.backArrow,
                title: Text(TTexts.personalDetailsTitle.tr,style: Theme.of(context).textTheme.headlineSmall,),
              ),
              const SizedBox(
                height: TSizes.sm,
              ),

              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  TTexts.personalDetailsSubTitle.tr,
                  style: Theme.of(context).textTheme.labelMedium!.apply(
                      color: Get.isDarkMode
                          ? TColors.darkFontColor
                          : TColors.darkerGrey),
                ),
              ),

              ListLayout(
                  itemBuilder: (_, index) => ProfileFeaturesItemList(
                        icon: icons[index],
                        title: title[index],
                        onPressed: () => showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return onPressed[index];
                            }),
                        isVerified: index == 2 ? true : false,
                        isPhoneNumber: index==3?true:false,
                        description: index == 2
                            ? TTexts.emailDescription.tr
                            : index == 3
                                ? TTexts.phoneDescription.tr
                                : null,
                        subTitle: subTitle[index],
                      ),
                  itemCount: title.length),
            ],
          ),
        ),
      ),
    ));
  }
}
