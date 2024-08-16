import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widgets/loaders/animation_loader.dart';
import '../../constants/colors.dart';
import '../../constants/image_strings.dart';
import '../../helpers/helper_functions.dart';


/// A utility Class for managing a full-screen loading dialog
class TFullScreenLoader {
  /// open a full-screen loading dialog with a given text and animation
  /// this method doesn't return anything
  ///
  ///  Parameters:
  ///    - text : The text to be displayed in the loading dialog
  ///    - animation : The Lottie animation to be shown

  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      barrierColor: Get.isDarkMode ? TColors.dark : TColors.light,
      builder: (_) => Container(
        decoration: BoxDecoration(
          color: THelperFunctions.isDarkMode(Get.context!)
              ? TColors.dark
              : TColors.white,
        ),
        width: double.infinity,
        height: double.infinity,
        child: TAnimationLoaderWidget(
            text: text,
            animation:
                Get.isDarkMode ? TImage.darkAppLoader : TImage.lightAppLoader),
      ),
    );
  }

  /// Stop the currently open loading dialog
  /// This method doesn't return anything
  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
