import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sejourne/navigation_menu.dart';

import '../../../../data/repositories/authentication_repository/authentication_repository.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/local_storage/loacal_db.dart';
import '../../../../utils/popups/general_popups/full_screen_loader.dart';
import '../../../../utils/popups/general_popups/loaders.dart';


class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  /// Variables
  final hidePassword = true.obs; // Observable for hiding / showing password
  final hideRePassword = true.obs; // Observable for hiding / showing password
  final privacyPolicy = false.obs; // Observable for Privacy Policy acceptance
  final firstNameController =
      TextEditingController(); // Controller for first name input
  final lastNameController =
      TextEditingController(); // Controller for last name input
  final emailController = TextEditingController(); // Controller for email input
  final phoneController = TextEditingController(); // Controller for phone input
  final passwordController =
      TextEditingController(); // Controller for password input
  final rePasswordController =
      TextEditingController(); // Controller for password input
  GlobalKey<FormState> signupFormKey =
      GlobalKey<FormState>(); // Form key for form validation

  ///  -- SIGNUP
  Future<void> signup(
    String firstName,
    String lastName,
    String email,
    String password,
    String confirmPassword,
    String phone,
  ) async {
    // signupFormKey.currentState!.validate();
    // Get.focusScope!.unfocus();
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
          'We are processing your information...', TImage.loader);

      // CheckInternet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();

        // }else{
        return;
      }

      // Form Validation

      if (!signupFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        //
        // }else{
        return;
      }

      // // Privacy Policy Check
      if (!privacyPolicy.value) {
        //print("===========================************* yes");
        TLoaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message:
              'in order to create account, you must have to read and accept the Privacy & Terms of Use.',
        );
        TFullScreenLoader.stopLoading();
        return;
      }

      // Register user in the Firebase Authentication & save user data in the Firebase
      final response = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(firstName, lastName, email,
              confirmPassword, confirmPassword, phone);

      TFullScreenLoader.stopLoading();

      if (response["code"] == 200) {
        final response = await AuthenticationRepository.instance
            .loginWithEmailAndPassword(email, password);
        // Remove Loader
        TFullScreenLoader.stopLoading();
        if (response['code'] == 200) {
          // Save User Token
          GetStorage().write('TOKEN', response["data"]['token']);
          debugPrint(response["data"]['user']);
          DBManager().saveCustomApi(response);
          // Redirect
          Get.offAll(() => const NavigationMenu());
          TLoaders.successSnackBar(
              title: 'Welcome !', message: response['message'].toString());
        } else {
          // Show some Generic Error to the user
          THelperFunctions.showAlert(TTexts.errorTitle.tr, response['message']);
        }
      } else {
        // Show some Generic Error to the user
        THelperFunctions.showAlert(TTexts.errorTitle.tr, response['message']);
      }
    } catch (e) {
      TFullScreenLoader.stopLoading();
      // Show some Generic Error to the user
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
