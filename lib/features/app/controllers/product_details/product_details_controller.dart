import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/image_strings.dart';

class ProductDetailsController extends GetxController with GetSingleTickerProviderStateMixin {
  static ProductDetailsController get instance => Get.find();

  final enableDepartDate = false.obs;

  var selectedDate = "";
  var checkInDate = DateTime.now().add(const Duration(days: 1)).obs;
  var checkOutDate = DateTime.now().add(const Duration(days: 1)).obs;

  final checkInDateText = TextEditingController();
  final checkOutDateText = TextEditingController();
  final guestText = TextEditingController();
  final favorite = false.obs;
  late dynamic darkMapStyle = TImage.darkMapStyle.obs;

  Rx<int> adultsCounter = 0.obs;
  Rx<int> childrenCounter = 0.obs;
  Rx<int> totalCounter = 0.obs;
  Rx<int> selectedPetOption = 0.obs;

  void total() {
    totalCounter.value = adultsCounter.value + childrenCounter.value;
  }

  /// Variables
  final imagePageController = PageController();
  Rx<int> currentImagePageIndex = 0.obs;

  /// Update Current Index when Page Scroll
  void updatePageIndicator(index) => currentImagePageIndex.value = index;

  /// Jump to the specific dot selected page
  void imageNavigationClick(index) {
    currentImagePageIndex.value = index;
    imagePageController.jumpToPage(index);
  }

  /// Update Current Index & Jump to the next page
  void nextImagePage(int last) {
    debugPrint(currentImagePageIndex.value.toString());
    if (currentImagePageIndex.value == last) {
      currentImagePageIndex.value = 0;
      int page = currentImagePageIndex.value;
      imagePageController.jumpToPage(page);
    } else {
      int page = currentImagePageIndex.value + 1;
      imagePageController.jumpToPage(page);
    }
  }

  /// Update Current Index & Jump to the last page
  void prevImagePage() {
    debugPrint(currentImagePageIndex.value.toString());
    debugPrint(currentImagePageIndex.value.toString());
    if (currentImagePageIndex.value == 0) {
    } else {
      int page = currentImagePageIndex.value - 1;
      imagePageController.jumpToPage(page);
    }
  }


  @override
  void onInit() {
    super.onInit();
    _loadMapStyles();
  }

  Future _loadMapStyles() async {
    darkMapStyle = await rootBundle.loadString(TImage.darkMapStyle);
  }
}
