import 'package:sejourne/data/repositories/authentication_repository/authentication_repository.dart';
import 'package:sejourne/data/services/exporter.dart';
import '../../../local_storage/storage_utility.dart';
import '../../general_popups/primary_popup_container.dart';

class ChangeThemePopUp extends StatelessWidget {
  const ChangeThemePopUp({super.key});

  @override
  Widget build(BuildContext context) {
    final storage=TLocalStorage();
    final controller = AuthenticationRepository.instance;
    return Material(
      color: Colors.transparent,
      child: PrimaryPopupContainer(
        headIcon: TImage.themeIcon,
        title: TTexts.changeTheme.tr,
        subTitle: TTexts.selectTheme.tr,
        buttonText: TTexts.saveLabel.tr,
        onPressed: () {
          Get.back();
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: TSizes.md, vertical: TSizes.md),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Get.changeThemeMode(ThemeMode.light);
                      controller.themeSelect.value = 0;
                      controller.themeSelectText.value=TTexts.lightMode.tr;
                      storage.saveData('DARK_THEME_MODE', false);
                    },
                    child: Obx(
                      () => Container(
                          width: TDeviceUtils.getScreenWidth(context) * 0.40,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: controller.themeSelect.value == 1
                                  ? null
                                  : Border.all(width: 2, color: Colors.blue),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                              boxShadow: [
                                TShadowStyle.horizontalProductShadow
                              ]),
                          child: SvgPicture.asset(
                              fit: BoxFit.fill, TImage.lightThemeImage)),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.changeThemeMode(ThemeMode.dark);
                      storage.saveData('DARK_THEME_MODE', true);
                      controller.themeSelect.value = 1;
                      controller.themeSelectText.value=TTexts.darkMode.tr;
                    },
                    child: Obx(
                      () => Container(
                          width: TDeviceUtils.getScreenWidth(context) * 0.40,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: controller.themeSelect.value == 1
                                  ? Border.all(width: 2, color: Colors.blue)
                                  : null,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                              boxShadow: [
                                TShadowStyle.horizontalProductShadow
                              ]),
                          child: SvgPicture.asset(
                            fit: BoxFit.fill,
                            TImage.darkThemeImage,
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
