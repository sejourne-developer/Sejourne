import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sejourne/features/authentication/models/slug_model.dart';
import 'package:sejourne/navigation_menu.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/local_storage/storage_utility.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();
  final storage=TLocalStorage();

  /// Variables
  final pageController = PageController(); // onboarding pages Page controller
  Rx<int> currentPageIndex = 0.obs;
  final darkBorder = false.obs;
  final lightBorder = true.obs;
  final Rx<String> langSelectedValue =
      "${english.value.title?.tr.toString()} - ${english.value.symbol.toString()}"
          .obs;
  final Rx<String> currencySelectedValue =
      "${aed.value.title?.tr.toString()} - ${aed.value.symbol.toString()}".obs;

  static Rx<SlugModel> english =
      SlugModel(title: TTexts.english.tr, slug: "ENG", symbol: "UK").obs;
  static Rx<SlugModel> arabic =
      SlugModel(title: TTexts.arabic.tr, slug: "AR", symbol: "UAE").obs;
  static Rx<SlugModel> french =
      SlugModel(title: TTexts.french.tr, slug: "FR", symbol: "FR").obs;

  final List<String> languageDropDownItems = [
    "${english.value.title?.tr.toString()} - ${english.value.symbol.toString()}",
    "${french.value.title?.tr.toString()} - ${french.value.symbol.toString()}",
    "${arabic.value.title?.tr.toString()} - ${arabic.value.symbol.toString()}",
  ];

  static Rx<SlugModel> aed =
      SlugModel(title: "AED", slug: "aed", symbol: "إ.د").obs;
  static Rx<SlugModel> usd =
      SlugModel(title: "USD", slug: "usd", symbol: "\$").obs;

  final List<String> currencyDropDownItems = [
    "${aed.value.title.toString()} - ${aed.value.symbol.toString()}",
    "${usd.value.title.toString()} - ${usd.value.symbol.toString()}",
  ];

  /// Update Current Index when Page Scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;

  /// Jump to the specific dot selected page
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

  /// Update Current Index & Jump to the next page
  void nextPage() {
    if (currentPageIndex.value == 4) {
      if (kDebugMode) {
        print(
            '========================== GET STORAGE NEXT BUTTON ========================== ');
        print(storage.readData("isOnBoardingScreenFirstTime"));
      }

      storage.saveData("isOnBoardingScreenFirstTime", false);

      if (kDebugMode) {
        print(
            '========================== GET STORAGE NEXT BUTTON ========================== ');
        print(storage.readData("isOnBoardingScreenFirstTime"));
      }
      Get.offAll(() => const NavigationMenu());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.animateToPage(page,
          duration: const Duration(seconds: 1), curve: Curves.easeInOut);
    }
  }

  /// Update Current Index & Jump to the last page
  void skipPage() {

    if (kDebugMode) {
      print(
          '========================== GET STORAGE SKIP BUTTON ========================== ');
      print(storage.readData("isOnBoardingScreenFirstTime"));
    }

    storage.saveData("isOnBoardingScreenFirstTime", false);

    if (kDebugMode) {
      print(
          '========================== GET STORAGE SKIP BUTTON ========================== ');
      print(storage.readData("isOnBoardingScreenFirstTime"));
    }
    Get.offAll(() => const NavigationMenu());
  }
}
