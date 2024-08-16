import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pinput/pinput.dart';
import 'package:sejourne/features/app/controllers/user/user_controller.dart';
import '../../../../data/repositories/authentication_repository/authentication_repository.dart';
import '../../../../data/services/exporter.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/local_storage/storage_utility.dart';
import '../../../../utils/popups/general_popups/loaders.dart';
import '../../../../utils/popups/general_popups/verify_email_popup.dart';
import '../../../authentication/screens/permissions/permissions.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  final storage=TLocalStorage();
  final carousalCurrentIndex = 0.obs;
  final expandedListCarousalCurrentIndex = 0.obs;
   late Timer timer;
  Rx<int> start = 60.obs;

  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }
  void updateExpandPageIndicator(index) {
    expandedListCarousalCurrentIndex.value = index;
  }


// int propCurrentIndex = 0;
// void find(int index, int length) {
  //   for (int i = 0; i < length; i++) {
  //     if (i == index) {
  //       propCurrentIndex = i;
  //     }
  //   }
  // }

  final verifyLater = false.obs;
  final enableButton = false.obs;
  final buttonLoading = false.obs;
  final verified = false.obs;
  final pinController = TextEditingController();
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


  @override
  void onReady() {
    super.onReady();
    screenRedirect();
  }

  /// Function to show Relevant screen
  screenRedirect() async {
    // local storage
    if (kDebugMode) {
      print(
          '========================== GET STORAGE LOGIN REPO ========================== ');
      print(storage.readData("isPermissionsFirstTime"));
    }
    GetStorage().writeIfNull("isPermissionsFirstTime", true);
    if (kDebugMode) {
      print(storage.readData("isPermissionsFirstTime"));
    }
    // check if it's the first time launching the app
    storage.readData("isPermissionsFirstTime") == true
        ? showDialog(
        context: Get.context!,
        builder: (BuildContext context) {
          return const PermissionsScreen();
        }) // Show Permissions dialog
        : null; // don't
    update();
  }

  /// Function to send otp to verify user email account
  sendEmailVerificationOTPCodeToEmail(int sessionUserId) async {
    try {
      // Start Loading
      buttonLoading.value = true;

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        buttonLoading.value = false;
        return;
      }

      // Send Email to Reset Password
      final response =
      await AuthenticationRepository.instance.sendEmailVerificationOTPCodeToEmail(sessionUserId);
      // Remove Loader
      //TFullScreenLoader.stopLoading();
      buttonLoading.value = false;
      if (response['code'] == 200) {
        // Show Success SnackBar
        showDialog(
            context: Get.context!,
            builder: (context) => const VerifyEmailPopup());

      } else {
        // Show some Generic Error to the user
        THelperFunctions.showAlert(TTexts.errorTitle.tr, response['message']);
      }
    } catch (e) {
      buttonLoading.value = false;

      // Remove Loader
      TLoaders.errorSnackBar(title: TTexts.errorTitle.tr, message: e.toString());
    }
  }


  /// Function to confirm the otp code
  emailOTPVerificationCode() async {
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
          .emailOTPVerificationCode(pinController.text.trim(),UserController.instance.user.id);

      // Remove Loader
      //TFullScreenLoader.stopLoading();
      buttonLoading.value = false;

      if (response['code'] == 200) {
        UserController.instance.fetchUserRecord();
        verified.value=true;
        verifyLater.value=true;
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

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
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
