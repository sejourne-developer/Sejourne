import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sejourne/common/widgets/texts/section_header.dart';
import 'package:sejourne/utils/constants/image_strings.dart';

import '../../../constants/sizes.dart';
import '../../../constants/text_strings.dart';
import '../../general_popups/primary_popup_container.dart';

class SupportPopup extends StatelessWidget {
  const SupportPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryPopupContainer(
      headIcon: TImage.supportIcon2,
      title: TTexts.contactSupportTitle.tr,
      subTitle: TTexts.contactSupportSubTitle.tr,
      buttonText: TTexts.submitLabel.tr,
      onPressed: () {
        Get.back();

      },
      child: Form(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.md),
          child: Column(
            children: [
              // const TSectionHeading(title: "Enter your Email Address?",showActionButton: false,),
              // const SizedBox(
              //   height: TSizes.spaceBtwInputField,
              // ),
              // /// Email
              // TextFormField(
              //   //controller: controller.emailController,
              //   decoration:  InputDecoration(
              //     labelText: TTexts.loginEmailHint.tr,
              //   ),
              //   validator: (value) => TValidator.validateEmail(value),
              // ),
              // const SizedBox(
              //   height: TSizes.spaceBtwInputField,
              // ),

               TSectionHeading(
                title: TTexts.describeYouIssueLabel.tr,
                showActionButton: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwInputField,
              ),
              TextFormField(
                // controller: controller.exDate,
                maxLines: 5,
                expands: false,
                decoration:  InputDecoration(
                    labelText: "${TTexts.describeYouIssueLabel.tr} !",
                    alignLabelWithHint: true),
                // validator: (value) =>
                //     TValidator.validateEmptyText("Street Address", value),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
