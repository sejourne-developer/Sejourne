import 'package:sejourne/common/widgets/custom_shapes/containers/onboarding_background_container.dart';
import 'package:sejourne/data/services/exporter.dart';
import 'package:sejourne/features/authentication/screens/onBoarding/onboarding_screens/widgets/onboarding_dot_navigation.dart';
import 'package:sejourne/features/authentication/screens/onBoarding/onboarding_screens/widgets/onboarding_next_button.dart';
import 'package:sejourne/features/authentication/screens/onBoarding/onboarding_screens/widgets/onboarding_page.dart';

import '../../../controllers/onboarding/onboarding_controller.dart';
import 'widgets/onboarding_skip.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: Stack(
        children: [
          const OnBoardingBackgroundContainer(
            child: SizedBox(),
          ),

          /// Horizontal Scrollable Pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: [
              OnBoardingPage(
                image: dark
                    ? TImage.darkOnboardingImage1
                    : TImage.lightOnboardingImage1,
                title: TTexts.onBoardingTitle1.tr,
                subTitle: TTexts.onBoardingSubTitle1.tr,
                onBoardingDescription: TTexts.onBoardingDescription1.tr,
              ),
              OnBoardingPage(
                image: dark
                    ? TImage.darkOnboardingImage2
                    : TImage.lightOnboardingImage2,
                title: TTexts.onBoardingTitle2.tr,
                subTitle: TTexts.onBoardingSubTitle2.tr,
                onBoardingDescription: TTexts.onBoardingDescription2.tr,
              ),
              OnBoardingPage(
                image: dark
                    ? TImage.darkOnboardingImage3
                    : TImage.lightOnboardingImage3,
                title: TTexts.onBoardingTitle3.tr,
                subTitle: TTexts.onBoardingSubTitle3.tr,
                onBoardingDescription: TTexts.onBoardingDescription3.tr,
              ),
              OnBoardingPage(
                image: dark
                    ? TImage.darkOnboardingImage4
                    : TImage.lightOnboardingImage4,
                title: TTexts.onBoardingTitle4.tr,
                subTitle: TTexts.onBoardingSubTitle1.tr,
                onBoardingDescription: TTexts.onBoardingDescription4.tr,
              ),
              OnBoardingPage(
                image: dark
                    ? TImage.darkOnboardingImage5
                    : TImage.lightOnboardingImage5,
                title: TTexts.onBoardingTitle5.tr,
                subTitle: TTexts.onBoardingSubTitle5.tr,
                onBoardingDescription: TTexts.onBoardingDescription5.tr,
              ),
            ],
          ),

          /// Skip Button
          const OnBoardingSkip(),

          /// Dot Navigation SmoothPageIndicator
          const OnBoardingDotNavigation(),

          /// Circular Button
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}
