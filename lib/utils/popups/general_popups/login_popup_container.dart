import 'package:sejourne/common/widgets/texts/horizontal_title_sub_title_widget.dart';
import 'package:sejourne/data/services/exporter.dart';
import '../../../features/authentication/screens/login/widgets/login_form.dart';

class LoginPopUpContainer extends StatelessWidget {
  const LoginPopUpContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: TRoundedContainer(
          constraints: BoxConstraints(
              maxHeight: TDeviceUtils.getScreenHeight() * 0.84, minHeight: 56),
          width: double.infinity,
          showBorder: false,
          margin: const EdgeInsets.symmetric(
              vertical: TSizes.appBarHeight, horizontal: TSizes.md),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsetsDirectional.all(TSizes.md),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    height: TSizes.md,
                  ),

                  HorizontalTitleSubTitleWidget(
                      title: TTexts.loginTitle.tr,
                      subTitle: TTexts.loginSubTitle.tr,),

                  /// Login Form
                  const TLoginForm(isPopup: true,),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
