import 'package:sejourne/data/services/exporter.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.onBoardingDescription,
  });

  final String image, title, subTitle, onBoardingDescription;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        SizedBox(
          height: TDeviceUtils.getAppBarHeight(),
        ),
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: dark ? TColors.darkFontColor : TColors.white),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        Padding(
          padding: EdgeInsetsDirectional.symmetric(
              horizontal: TDeviceUtils.getScreenWidth(context) * 0.25),
          child: Text(
            subTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: dark ? TColors.darkFontColor : TColors.white),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: TDeviceUtils.getScreenHeight() * 0.05,
        ),
        SizedBox(
          height: TDeviceUtils.getScreenHeight() * 0.5,
          child: SvgPicture.asset(
            image,
            fit: BoxFit.fill,
          ),
        ),
        const SizedBox(
          height: TSizes.spaceBtwSections,
        ),
        Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: TSizes.xl),
          child: Text(
            onBoardingDescription,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: dark ? TColors.darkFontColor : TColors.black),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
