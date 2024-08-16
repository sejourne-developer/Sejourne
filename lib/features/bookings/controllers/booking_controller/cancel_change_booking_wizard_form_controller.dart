import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CancelChangeBookingWizardFormController extends GetxController {
  static CancelChangeBookingWizardFormController get instance => Get.find();

  TextEditingController reservationController =TextEditingController();
  final pageController = PageController(keepPage: false);
  Rx<int> currentPageIndex = 0.obs;
  final Rx<int> selectOption = 0.obs;
  final Rx<String> checkInDateString = DateTime.now().toString().split(" ")[0].obs;
  final Rx<String> checkOutDateString = DateTime.now().add(const Duration(days: 4)).toString().split(" ")[0].obs;
  final Rx<String> adultsString = "2".obs;
  final Rx<String> childrenString = "1".obs;
  final Rx<String> totalString = "3".obs;
  var checkInDate = DateTime.now().add(const Duration(days: 1)).obs;
  var checkOutDate = DateTime.now().add(const Duration(days: 4)).obs;
  Rx<int> selectedReasonOption = 0.obs;

  /// Update Current Index when Page Scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;

  /// Update Current Index & Jump to the next page
  void nextPage() {
    if (currentPageIndex.value == 4) {
      // final storage=GetStorage();
      //
      // if(kDebugMode){
      //   print('========================== GET STORAGE NEXT BUTTON ========================== ');
      //   print(storage.read("isFirstTime"));
      // }
      //
      // storage.write("isFirstTime", false);
      //
      // if(kDebugMode){
      //   print('========================== GET STORAGE NEXT BUTTON ========================== ');
      //   print(storage.read("isFirstTime"));
      // }
      //Get.offAll(()=>const LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.animateToPage(page,
          duration: const Duration(milliseconds: 500), curve: Curves.easeInOutSine);
    }
  }

  void back() {
    int page = currentPageIndex.value - 1;
    pageController.animateToPage(page,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOutSine);
  }
}
