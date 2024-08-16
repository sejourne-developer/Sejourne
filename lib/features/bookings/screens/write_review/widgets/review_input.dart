import 'package:flutter/foundation.dart';
import 'package:sejourne/data/services/exporter.dart';
import '../../../../../common/widgets/buttons/primary_button.dart';
import '../../../../../utils/validators/validation.dart';
import '../../../controllers/write_review/write_review_controller.dart';
import 'add_photo.dart';
import 'icon_and_rating_bar.dart';

class ReviewInput extends StatelessWidget {
  const ReviewInput({
    super.key,
    this.showBackButton = true,
    required this.icon,
    required this.title,
    required this.textEditingController,
    this.onPressed,
    required this.images,
    required this.formStateKey,
    required this.ratingText,
    required this.ratingValue,
  });

  final String icon, title;
  final bool showBackButton;
  final RxList images;
  final TextEditingController textEditingController;
  final VoidCallback? onPressed;
  final GlobalKey<FormState> formStateKey;
  final Rx<String> ratingText;
  final Rx<double> ratingValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        /// Icon and rating
        IconAndRatingBar(
          title: title,
          icon: icon,
          ratingText: ratingText,
          ratingValue: ratingValue,
        ),

        const SizedBox(
          height: TSizes.md,
        ),

        /// text field
        Form(
          key: formStateKey,
          child: TextFormField(
            maxLines: 5,
            controller: textEditingController,
            decoration: InputDecoration(
              fillColor: THelperFunctions.isDarkMode(context)
                  ? TColors.darkContainer
                  : TColors.softGrey,
              hintText: "${TTexts.writeYourCommentAbout.tr} $title...",
            ),
            textInputAction: TextInputAction.done,
            onFieldSubmitted: (value) {
              FocusScope.of(context).unfocus();
              if (kDebugMode) {
                print("Go button is clicked");
              }
            },
            onEditingComplete: () => {},
            validator: (value) => TValidator.validateEmptyText(title, value!),
          ),
        ),
        const SizedBox(
          height: TSizes.md,
        ),

        /// add review photo
        AddPhoto(
          images: images,
        ),

        const SizedBox(
          height: TSizes.md,
        ),

        PrimaryButton(
            loading: false.obs,
            title: TTexts.sContinue.tr,
            onPressed: onPressed),

        showBackButton
            ? TextButton(
                onPressed: () => WriteReviewController.instance.backPage(),
                style: TextButton.styleFrom(
                    alignment: AlignmentDirectional.center),
                child: Text(
                  TTexts.backLabel.tr,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
