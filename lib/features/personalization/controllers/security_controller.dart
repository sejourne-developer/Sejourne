import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/local_storage/storage_utility.dart';

class SecurityController extends GetxController {
  static SecurityController get instance => Get.find();

  final storage=TLocalStorage();
  final hideCurrentPassword = true.obs;
  final hideNewPassword = true.obs;
  final hideConfirmPassword = true.obs;
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmNewPasswordController = TextEditingController();
  GlobalKey<FormState> changePasswordFormKey = GlobalKey<FormState>();

  Rx<int> selectedTwoFactorAuthOption = 0.obs;
  final Rx<bool> twoFactorAuthSwitchButtonValue = false.obs;

  @override
  void onReady() {
    selectedTwoFactorAuthOption.value =
        storage.readData("selectedTwoFactorAuthOption");
    twoFactorAuthSwitchButtonValue.value = storage.readData("Two_factor_Auth");
    super.onReady();
  }
}
