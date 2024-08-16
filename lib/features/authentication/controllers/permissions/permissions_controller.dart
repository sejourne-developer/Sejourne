import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/local_storage/storage_utility.dart';

class PermissionsController extends GetxController {
  static PermissionsController get instance => Get.find();

  final storage=TLocalStorage();

  /// Variables
  final carousalCurrentIndex = 0.obs;
  CarouselControllerImpl carouselControllerImpl = CarouselControllerImpl();

  @override
  void onReady() {
    if (storage.readData("carousalCurrentIndex") != null) {
      carousalCurrentIndex.value =storage.readData("carousalCurrentIndex");
    }
    super.onReady();
  }

  /// Update Current Index when Page Scroll
  void updatePageIndicator(index) => carousalCurrentIndex.value = index;

  /// Update Current Index & Jump to the next page
  void allow(String key) {
    if (carousalCurrentIndex.value == 3) {
      if (kDebugMode) {
        print(
            '========================== GET STORAGE NEXT BUTTON ========================== ');
        print(storage.readData("isPermissionsFirstTime"));
      }

      storage.saveData("carousalCurrentIndex", carousalCurrentIndex.value);
      storage.saveData("isPermissionsFirstTime", false);
      storage.saveData(key, true);

      if (kDebugMode) {
        print(
            '========================== GET STORAGE NEXT BUTTON ========================== ');
        print(storage.readData("isPermissionsFirstTime"));
      }
      Navigator.of(Get.context!).pop();
    } else {
      storage.saveData(key, true);
      int page = carousalCurrentIndex.value + 1;
      updatePageIndicator(page);
      carouselControllerImpl.animateToPage(
        page,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOutSine,
      );
      storage.saveData("carousalCurrentIndex", page);
    }
  }

  /// Update Current Index & Jump to the last page
  void deny(String key) {
    if (carousalCurrentIndex.value == 3) {
      if (kDebugMode) {
        print(
            '========================== GET STORAGE DENY BUTTON ========================== ');
        print(storage.readData("isPermissionsFirstTime"));
      }

      storage.saveData("carousalCurrentIndex", carousalCurrentIndex.value);
      storage.saveData("isPermissionsFirstTime", false);
      storage.saveData(key, false);

      if (kDebugMode) {
        print(
            '========================== GET STORAGE DENY BUTTON ========================== ');
        print(storage.readData("isPermissionsFirstTime"));
      }
      Navigator.of(Get.context!).pop();
      // Get.offAll(()=>const LoginScreen());
    } else {
      storage.saveData(key, false);
      int page = carousalCurrentIndex.value + 1;
      updatePageIndicator(page);
      carouselControllerImpl.animateToPage(
        page,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOutSine,
      );
      storage.saveData("carousalCurrentIndex", page);
    }
  }
}
