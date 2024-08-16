import '../../../data/services/exporter.dart';

class LoginSignUpHeader extends StatelessWidget {
  const LoginSignUpHeader(
      {super.key, required this.title, required this.subTitle});

  final String title, subTitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// Logo
          Image.asset(
            THelperFunctions.isDarkMode(context)
                ? TImage.darkAppLogoPNG
                : TImage.lightAppLogoPNG,
            height: TDeviceUtils.getScreenHeight() * 0.08,
            width: TDeviceUtils.getScreenWidth(context) * 0.5,
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),

          /// title
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(
            height: TSizes.sm,
          ),

          /// SubTitle
          Center(
            child: Text(
              textAlign: TextAlign.center,
              subTitle,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .apply(color: TColors.darkGrey),
            ),
          ),
        ],
      ),
    );
  }
}
