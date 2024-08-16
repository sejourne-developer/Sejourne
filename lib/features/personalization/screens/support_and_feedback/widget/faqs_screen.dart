import 'package:flutter_easy_faq/flutter_easy_faq.dart';
import 'package:sejourne/common/widgets/appbar/appbar.dart';
import 'package:sejourne/common/widgets/layouts/list_layout.dart';
import '../../../../../data/services/exporter.dart';

class FAQsScreen extends StatelessWidget {
  const FAQsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RxList<String> question = [
      TTexts.faqsQuestion1.tr,
      TTexts.faqsQuestion2.tr,
      TTexts.faqsQuestion3.tr,
      TTexts.faqsQuestion4.tr,
      TTexts.faqsQuestion5.tr,
    ].obs;
    RxList<String> answer = [
      TTexts.faqsAnswer1.tr,
      TTexts.faqsAnswer2.tr,
      TTexts.faqsAnswer3.tr,
      TTexts.faqsAnswer4.tr,
      TTexts.faqsAnswer5.tr,
    ].obs;
    return Scaffold(
      body: BackgroundImageContainer(
          child: SingleChildScrollView(
            child: Column(
                    children: [
             TAppBar(
              title: Text(TTexts.faqsTitle.tr),
              leadingIcon:Get.locale==arabic?TImage.rightArrowIcon: TImage.backArrow,
            ),
            ListLayout(
              itemCount: question.length,
              padding: const EdgeInsetsDirectional.all(TSizes.sm),
              separatorHeight: TSizes.sm,
              itemBuilder: (_, index) => Obx(
                () => EasyFaq(
                  backgroundColor: THelperFunctions.isDarkMode(context)
                      ? TColors.dark
                      : TColors.white,
                  questionTextStyle: Theme.of(context).textTheme.bodyLarge,
                  anserTextStyle: Theme.of(context).textTheme.bodyMedium,
                  question: question[index],
                  answer: answer[index],
                ),
              ),
            ),
                    ],
                  ),
          )),
    );
  }
}

// () => FAQ(
//   question: question[index],
//   answer: answer[index],
//   queStyle: Theme.of(context).textTheme.bodyLarge,
//   ansStyle: Theme.of(context).textTheme.bodyMedium,
//   showDivider: false,
//   ansDecoration: BoxDecoration(
//       color: THelperFunctions.isDarkMode(context)
//           ? TColors.dark
//           : TColors.white,
//       border: Border.all(
//           color: THelperFunctions.isDarkMode(context)
//               ? TColors.darkPrimaryBorderColor
//               : TColors.lightPrimaryBorderColor),
//       borderRadius:
//           const BorderRadius.all(Radius.circular(TSizes.sm))),
//   queDecoration: BoxDecoration(
//       color: THelperFunctions.isDarkMode(context)
//           ? TColors.dark
//           : TColors.white,
//       border: Border.all(
//           color: THelperFunctions.isDarkMode(context)
//               ? TColors.darkPrimaryBorderColor
//               : TColors.lightPrimaryBorderColor),
//       borderRadius:
//           const BorderRadius.all(Radius.circular(TSizes.sm))),
// ),
