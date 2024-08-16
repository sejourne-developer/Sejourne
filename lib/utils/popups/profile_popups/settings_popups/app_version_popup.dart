import 'package:flutter_app_info/flutter_app_info.dart';
import 'package:sejourne/data/services/exporter.dart';
import '../../general_popups/primary_popup_container.dart';

class AppVersionPopUp extends StatelessWidget {
  const AppVersionPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final info = AppInfo.of(context);
    return PrimaryPopupContainer(
      headIcon: TImage.appVersionIcon,
      title: TTexts.appVersionTitle.tr,
      subTitle: TTexts.appVersionSubTitle.tr,
      buttonText: TTexts.checkUpdate.tr,
      onPressed: () {
        Get.back();
      },
      child: Padding(
        padding: const EdgeInsetsDirectional.all(TSizes.md),
        child: Column(
          children: [
            //Text(info.package.appName,style: Theme.of(context).textTheme.bodyLarge,),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            Text(
              "${TTexts.version.tr} @${info.package.versionWithoutBuild.toString()}",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: dark ? TColors.darkFontColor : TColors.grey2),
            ),
          ],
        ),
      ),
    );
  }
}
