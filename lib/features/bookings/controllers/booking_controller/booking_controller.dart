import 'package:get/get.dart';


class BookingController extends GetxController {
  static BookingController get instance => Get.find();


  final isGra1 = true.obs;
  final isGra2 = false.obs;
  final isGra3 = false.obs;
  final isGra4 = false.obs;
  Rx<int> currentPageIndex = 0.obs;

  /// Jump to the specific dot selected page
  void tabBarButtonClicked(index) {
    currentPageIndex.value = index;
    if (index == 0) {
      isGra1.value = true;
      isGra2.value = false;
      isGra3.value = false;
      isGra4.value = false;
    } else if (index == 1) {
      isGra1.value = false;
      isGra2.value = true;
      isGra3.value = false;
      isGra4.value = false;
    } else if (index == 2) {
      isGra1.value = false;
      isGra2.value = false;
      isGra3.value = true;
      isGra4.value = false;
    } else if (index == 3) {
      isGra1.value = false;
      isGra2.value = false;
      isGra3.value = false;
      isGra4.value = true;
    }
  }
}
