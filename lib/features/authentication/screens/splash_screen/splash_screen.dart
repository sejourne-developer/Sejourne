import 'package:sejourne/data/services/exporter.dart';

import '../../../../common/widgets/custom_shapes/containers/signin_signup_background_image_container.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SigninSignupBackgroundImageContainer(
        child: Center(
          child: Image.asset(
            THelperFunctions.isDarkMode(context)
                ? TImage.darkAppLogoPNG
                : TImage.lightAppLogoPNG,
            height: TDeviceUtils.getScreenHeight() * 0.080,
            width: TDeviceUtils.getScreenWidth(context) * 0.65,
          ),
        ),
      ),
    );
  }
}
