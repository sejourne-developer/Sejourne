import 'package:flutter/foundation.dart';
import 'package:flutter_emoji_feedback/flutter_emoji_feedback.dart';
import 'package:sejourne/data/services/exporter.dart';

import '../../../../common/widgets/texts/section_header.dart';
import '../../general_popups/primary_popup_container.dart';

class FeedbackPopup extends StatelessWidget {
  const FeedbackPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryPopupContainer(
      headIcon: TImage.feedBackIcon,
      title: TTexts.submitFeedbackTitle.tr,
      subTitle: TTexts.submitFeedbackSubTitle.tr,
      buttonText: TTexts.submitLabel.tr,
      onPressed: () {
        Get.back();
      },
      child: Form(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.md),
          child: Column(
            children: [
              TSectionHeading(
                title: TTexts.howDoWeDoLabel.tr,
                showActionButton: false,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: EmojiFeedback(
                  customLabels: [
                    TTexts.terribleLabel.tr,
                    TTexts.badLabel.tr,
                    TTexts.goodLabel.tr,
                    TTexts.veryGoodLabel.tr,
                    TTexts.awesomeLabel.tr,
                  ],
                  animDuration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  inactiveElementScale: 0.5,
                  initialRating: 3,
                  inactiveElementBlendColor: Colors.transparent,
                  elementSize: TDeviceUtils.getScreenWidth(context) * 0.12,
                  onChanged: (value) {
                    if (kDebugMode) {
                      print(value);
                    }
                  },
                ),
              ),
              const SizedBox(
                height: TSizes.md,
              ),
              TSectionHeading(
                title: TTexts.comment.tr,
                showActionButton: false,
              ),
              const SizedBox(
                height: TSizes.sm,
              ),
              TextFormField(
                // controller: controller.exDate,
                maxLines: 5,
                expands: false,
                decoration: InputDecoration(
                    labelText: "${TTexts.writeYourThoughtsLabel.tr} !",
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
