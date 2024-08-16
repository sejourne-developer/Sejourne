import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sejourne/utils/constants/text_strings.dart';

class SSearchController extends GetxController {
  static SSearchController get instance => Get.find();
  Rx<double> currentHeight = 0.0.obs;
  final Rx<String> selectedLocationValue = "".obs;

  String? selectedValue;
  final enableDepartDate = false.obs;
  String selectedDate = "";
  final advanceOptionText = "".obs;
  var checkInDate = DateTime.now().add(const Duration(days: 1)).obs;
  var checkOutDate = DateTime.now().add(const Duration(days: 1)).obs;
  final arriveDate = TextEditingController();
  final departDate = TextEditingController();
  final guests = TextEditingController();
  GlobalKey<FormState> bookingsFormKey = GlobalKey<FormState>();

  @override
  void onReady() {
    selectedLocationValue.value = TTexts.dropDownLabel.tr;
    super.onReady();
  }


  @override
  void onClose() {
    arriveDate.dispose();
    departDate.dispose();
    guests.dispose();
  }

  // height on change when clicked on the header
  void expandOnChanged(double expandedHeight) {
    bool isExpanded = currentHeight.value == expandedHeight;
    currentHeight.value = isExpanded ? 0 : expandedHeight;
  }
}
