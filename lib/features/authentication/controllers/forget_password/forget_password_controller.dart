import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:sejourne/features/authentication/screens/login/login_screen.dart';
import 'package:sejourne/utils/constants/colors.dart';
import 'package:sejourne/utils/constants/sizes.dart';
import 'package:sejourne/utils/helpers/helper_functions.dart';
import '../../../../data/repositories/authentication_repository/authentication_repository.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/general_popups/loaders.dart';
import '../../screens/password_configration/change_password.dart';
import '../../screens/password_configration/confirmation_code.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  /// Variables
  final enableButton = false.obs;
  final buttonLoading = false.obs;
  final hideNewPassword = true.obs;
  final hideConfirmPassword = true.obs;
  final dark = THelperFunctions.isDarkMode(Get.context!);
  final email = TextEditingController();
  final pinController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> changePasswordFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> optFormKey = GlobalKey<FormState>();
  final focusNode = FocusNode();
  final focusedBorderColor = THelperFunctions.isDarkMode(Get.context!)
      ? TColors.darkPrimaryBorderColor
      : TColors.primary;
  final borderColor = THelperFunctions.isDarkMode(Get.context!)
      ? TColors.darkPrimaryBorderColor
      : TColors.grey;

  final defaultPinTheme = PinTheme(
    width: TSizes.pinSize,
    height: TSizes.pinSize,
    textStyle: Theme.of(Get.context!).textTheme.headlineMedium,
    decoration: BoxDecoration(
      color: THelperFunctions.isDarkMode(Get.context!)
          ? TColors.dark
          : TColors.white,
      borderRadius: BorderRadius.circular(TSizes.sm),
      border: Border.all(
          color: THelperFunctions.isDarkMode(Get.context!)
              ? TColors.darkPrimaryBorderColor
              : TColors.grey),
    ),
  );

  late Timer _timer;
  Rx<int> start = 60.obs;

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  /// Send Reset Password Email
  sendOTPEmail(String email) async {
    try {
      // Start Loading
      buttonLoading.value = true;

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        buttonLoading.value = false;
        //
        // }else{
        return;
      }

      // Form Validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        buttonLoading.value = false;
        return;
      }

      // Send Email to Reset Password
      final response =
          await AuthenticationRepository.instance.sendOTPEmail(email);

      // Remove Loader
      //TFullScreenLoader.stopLoading();
      buttonLoading.value = false;

      if (response['code'] == 200) {
        // Show Success SnackBar
        TLoaders.successSnackBar(
          title: TTexts.confirmationCodeSent.tr,
          message: TTexts.confirmationCodeSentToEmail.tr,
        );

        // Redirect
        Get.to(() => ConfirmationCodeScreen(
              email: email,
            ));
      } else {
        // Show some Generic Error to the user
        THelperFunctions.showAlert(TTexts.errorTitle.tr, response['message']);
      }
    } catch (e) {
      buttonLoading.value = false;

      // Remove Loader
      //TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: TTexts.errorTitle.tr, message: e.toString());
    }
  }

  confirmOTPCode() async {
    try {
      // Start Loading
      buttonLoading.value = true;

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        buttonLoading.value = false;
        //
        // }else{
        return;
      }

      // Form Validation
      if (!optFormKey.currentState!.validate()) {
        buttonLoading.value = false;
        return;
      }

      // Send Email to Reset Password
      final response = await AuthenticationRepository.instance
          .oTPVerification(pinController.text.trim());

      // Remove Loader
      //TFullScreenLoader.stopLoading();
      buttonLoading.value = false;

      if (response['code'] == 200) {
        // Redirect
        Get.to(() => ResetPasswordScreen(
              token: response['data'],
            ));
        // // Show Success SnackBar
        // TLoaders.successSnackBar(
        //     title: 'Confirmation Code Sent',
        //     message: "Confirmation Code Sent to Yor Email".tr);
      } else {
        // Show some Generic Error to the user
        THelperFunctions.showAlert(TTexts.errorTitle.tr, response['message']);
      }
    } catch (e) {
      // Remove Loader
      buttonLoading.value = false;

      //TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: TTexts.errorTitle.tr, message: e.toString());
    }
  }

  changePassword(String token) async {
    try {
      // Start Loading
      buttonLoading.value = true;

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        buttonLoading.value = false;
        //
        // }else{
        return;
      }

      // Form Validation
      if (!changePasswordFormKey.currentState!.validate()) {
        //TFullScreenLoader.stopLoading();
        buttonLoading.value = false;

        return;
      }
      // Send Email to Reset Password
      final response = await AuthenticationRepository.instance
          .resetPassword(confirmPasswordController.text.trim(), token);

      // Remove Loader
      // TFullScreenLoader.stopLoading();
      buttonLoading.value = false;

      if (response['code'] == 200) {
        // Redirect
        Get.to(() => ResetPasswordScreen(
              token: response['data'],
            ));
        // Show Success Screen
        TLoaders.successSnackBar(
            title: TTexts.errorTitle.tr, message: TTexts.passwordChangedSuccessfully.tr);
      } else {
        // Show some Generic Error to the user
        THelperFunctions.showAlert(TTexts.errorTitle.tr, response['message']);
      }

      Get.offAll(() => const LoginScreen());
    } catch (e) {
      // Remove Loader
      buttonLoading.value = false;

      //TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: TTexts.errorTitle.tr, message: e.toString());
    }
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start.value == 0) {
          timer.cancel();
        } else {
          start.value--;
        }
      },
    );
  }
}
