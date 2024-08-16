import 'package:animate_do/animate_do.dart';
import '../../../../../common/widgets/icons/dotted_circle_border_icon.dart';
import '../../../common/widgets/buttons/primary_button.dart';
import '../../../common/widgets/custom_shapes/containers/onboarding_background_container.dart';
import '../../../data/services/exporter.dart';
import '../../constants/enums.dart';

class PrimaryPopupContainer extends StatelessWidget {
  const PrimaryPopupContainer({
    super.key,
    required this.headIcon,
    required this.title,
    required this.subTitle,
    required this.buttonText,
    this.onPressed,
    this.child,
    this.showButton = true,
    this.showCancelButton = true,
    this.subTitleTextStyle,
    this.loading,
    this.animation = AnimationType.elasticIn,
  });

  final String headIcon, title, subTitle, buttonText;
  final VoidCallback? onPressed;
  final Widget? child;
  final bool showButton;
  final bool showCancelButton;
  final TextStyle? subTitleTextStyle;
  final Rx<bool>? loading;
  final AnimationType animation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: animationWidget(animation),
    );
  }

  Widget animationWidget(AnimationType animation) {
    switch (animation) {
      case AnimationType.fadeIn:
        return FadeIn(
          duration: const Duration(milliseconds: 500),
          child: body(Get.context!),
        );
      case AnimationType.fadeOut:
        return FadeOut(
          duration: const Duration(milliseconds: 500),
          child: body(Get.context!),
        );
      case AnimationType.bounceInDown:
        return BounceInDown(
          duration: const Duration(milliseconds: 500),
          child: body(Get.context!),
        );
      case AnimationType.elasticIn:
        return ElasticIn(
          duration: const Duration(milliseconds: 500),
          child: body(Get.context!),
        );
      case AnimationType.slideInDown:
        return SlideInDown(
          duration: const Duration(milliseconds: 500),
          child: body(Get.context!),
        );
      case AnimationType.flipInX:
        return FlipInX(
          duration: const Duration(milliseconds: 500),
          child: body(Get.context!),
        );
      case AnimationType.zoomIn:
        return ZoomIn(
          duration: const Duration(milliseconds: 500),
          child: body(Get.context!),
        );
      case AnimationType.jelloIn:
        return JelloIn(
          duration: const Duration(milliseconds: 500),
          child: body(Get.context!),
        );
      case AnimationType.dance:
        return Dance(
          duration: const Duration(milliseconds: 500),
          child: body(Get.context!),
        );
      case AnimationType.spinPerfect:
        return SpinPerfect(
          duration: const Duration(milliseconds: 500),
          child: body(Get.context!),
        );
      case AnimationType.bounceInUp:
        return BounceInUp(
          duration: const Duration(milliseconds: 500),
          child: body(Get.context!),
        );
    }
  }

  Center body(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Center(
      child: TRoundedContainer(
        constraints: BoxConstraints(
            maxHeight: TDeviceUtils.getScreenHeight() * 0.84, minHeight: 56),
        width: double.infinity,
        // height: double.infinity,
        showBorder: false,
        margin: const EdgeInsets.symmetric(
            vertical: TSizes.appBarHeight, horizontal: TSizes.md),
        child: ClipRRect(
          borderRadius:
              const BorderRadiusDirectional.all(Radius.circular(TSizes.md)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                /// upper Circle
                Stack(
                  children: [
                    OnBoardingBackgroundContainer(
                      radius: TSizes.md,
                      height: TDeviceUtils.getScreenHeight() * 0.20,
                      child: const SizedBox(),
                    ),
                    Align(
                      alignment: AlignmentDirectional.topCenter,
                      child: DottedCircleBorderIcon(
                        icon: headIcon,
                        iconSize: TSizes.pinSize,
                        //borderColor: TColors.darkPrimaryBorderColor,
                      ),
                    ),
                  ],
                ),

                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  height: TSizes.sm,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.symmetric(
                      horizontal: TSizes.spaceBtwSections),
                  child: Text(
                    subTitle,
                    textAlign: TextAlign.center,
                    style: subTitleTextStyle ??
                        Theme.of(context).textTheme.labelMedium!.apply(
                            color: dark
                                ? TColors.darkFontColor
                                : TColors.darkGrey),
                  ),
                ),

                child ?? const SizedBox(),

                showButton
                    ? Column(
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.all(TSizes.md),
                            child: PrimaryButton(
                              onPressed: onPressed,
                              title: buttonText,
                              loading: loading ?? false.obs,
                            ),
                          ),
                          showCancelButton
                              ? TextButton(
                                  onPressed: () => Get.back(),
                                  child: Text(
                                    TTexts.cancelLabel.tr,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ))
                              : const SizedBox()
                        ],
                      )
                    : const SizedBox()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
