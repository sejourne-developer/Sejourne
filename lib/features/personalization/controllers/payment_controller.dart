import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController {
  static PaymentController get instance => Get.find();

  final nameOnCard = TextEditingController(); // Controller for first name input
  final cardNum = TextEditingController(); // Controller for last name input
  final cvv = TextEditingController(); // Controller for email input
  final exDate = TextEditingController(); // Controller for email input

  final rePassword = TextEditingController(); // Controller for password input
  GlobalKey<FormState> linkCardForm =
      GlobalKey<FormState>(); // Form key for form validation
}
