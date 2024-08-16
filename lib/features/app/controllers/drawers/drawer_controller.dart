import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_button/group_button.dart';

import '../product_details/product_details_controller.dart';
import '../user/user_controller.dart';


class MyDrawerController extends GetxController {
  static MyDrawerController get instance => Get.find();

  final groupButtonController = GroupButtonController();

  final enableDepartDate = false.obs;
  final isEndDrawerOpen = false.obs;
  var selectedDate = "";
  var checkInDate = DateTime.now().add(const Duration(days: 1)).obs;
  var checkOutDate = DateTime.now().add(const Duration(days: 4)).obs;
  final checkInDateController = TextEditingController();
  final checkOutDateController = TextEditingController();
  final guests = TextEditingController();
  final Rx<double> priceRangeStart = 100.0.obs;
  final Rx<double> priceRangeEnd = 700.0.obs;
  final Rx<double> rating = 3.0.obs;

  final apartmentCheckBox = false.obs;
  final villaCheckBox = false.obs;
  final cabinCheckBox = false.obs;
  final houseCheckBox = false.obs;

  final studioCheckBox = false.obs;
  final bR1CheckBox = false.obs;
  final bR2CheckBox = false.obs;
  final bR3CheckBox = false.obs;
  final bR4CheckBox = false.obs;
  final bR5CheckBox = false.obs;

  final swimmingPoolCheckBox = false.obs;
  final parkingPoolCheckBox = false.obs;
  final petCheckBox = false.obs;
  final gymCheckBox = false.obs;

  final priorityCheckBox = false.obs;
  final newestCheckBox = false.obs;
  final oldestCheckBox = false.obs;

  final openCheckBox = false.obs;
  final snoozedCheckBox = false.obs;
  final closedCheckBox = false.obs;
  final archivedCheckBox = false.obs;
  final closeCheckBox = false.obs;

  final supportCheckBox = false.obs;
  final acceptedCheckBox = false.obs;
  final canceledCheckBox = false.obs;
  final inquiryCheckBox = false.obs;
  final pendingCheckBox = false.obs;

  final TextEditingController minPriceController = TextEditingController();
  final TextEditingController maxPriceController = TextEditingController();
  final TextEditingController minimumRatingController = TextEditingController();

  GlobalKey<FormState> filterBookingsFormKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> homeScaffoldKey = GlobalKey();
  GlobalKey<ScaffoldState> searchScaffoldKey = GlobalKey();

  @override
  void onReady() async {
    super.onReady();
    checkInDateController.text = checkInDate.toString().split(" ")[0];
    checkOutDateController.text = checkOutDate.toString().split(" ")[0];
    // minPriceController.text = "Min Price";
    // maxPriceController.text = "Max Price";
    minimumRatingController.text = "Minimum rating";
   await UserController.instance.fetchUserRecord();
    Get.put(ProductDetailsController());
  }


}
