import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sejourne/features/app/controllers/user/user_controller.dart';
import 'package:sejourne/utils/local_storage/loacal_db.dart';
import 'package:sejourne/utils/local_storage/storage_utility.dart';
import '../../../../data/repositories/authentication_repository/authentication_repository.dart';
import '../../../../navigation_menu.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/general_popups/full_screen_loader.dart';
import '../../../../utils/popups/general_popups/loaders.dart';
import '../../screens/login/login_screen.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  /// Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final storage=TLocalStorage();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  //final userController = Get.put(UserController());

  @override
  void onReady() {
    emailController.text = storage.readData('REMEMBER_ME_EMAIL') ?? "";
    passwordController.text = storage.readData('REMEMBER_ME_PASSWORD') ?? "";
    super.onReady();
  }

  @override
  void onInit() {
    //if(localStorage.read('REMEMBER_ME_EMAIL').toString().isNotEmpty&&localStorage.read('REMEMBER_ME_PASSWORD').toString().isEmpty){
    emailController.text = storage.readData('REMEMBER_ME_EMAIL') ?? "";
    passwordController.text = storage.readData('REMEMBER_ME_PASSWORD') ?? "";
    super.onInit();
  }



  /// -- Email and Password SignIn
  Future<void> emailAndPasswordSignIn(String email, String password) async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog('', TImage.loader);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        TLoaders.warningSnackBar(
            title: 'Connection Error', message: "Check Internet Connection");
        return;
      }

      // Form Validation
      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Save Data
      if (rememberMe.value) {
        storage.saveData('REMEMBER_ME_EMAIL', email);
        storage.saveData('REMEMBER_ME_PASSWORD', password);
      }

      // Login user using EMail & Password Authentication
      final response = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email, password);

      // Remove Loader
      TFullScreenLoader.stopLoading();

      if (response['code'] == 200) {
        // Save User Token
        storage.saveData('TOKEN', response["data"]['token']);
        debugPrint(response["data"]['token'].toString());
        DBManager().saveCustomApi(response);
       await UserController.instance.fetchUserRecord();
        // Redirect

        Get.offAll(() => const NavigationMenu());

        TLoaders.successSnackBar(
            title: 'Welcome !', message: response['message'].toString());
      } else {
        // Show some Generic Error to the user
        THelperFunctions.showAlert(TTexts.errorTitle.tr, response['message']);
      }
    } catch (e) {
      // TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  /// -- User Logout
  Future<void> logout() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
          '', Get.isDarkMode ? TImage.darkAppLoader : TImage.lightAppLoader);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        //   TFullScreenLoader.stopLoading();
        //
        // }else{
        return;
      }

      // Save Data
      if (rememberMe.value) {
        storage.removeData('REMEMBER_ME_EMAIL');
        storage.removeData('REMEMBER_ME_PASSWORD');
      }

      // Login user using EMail & Password Authentication
      final response = await AuthenticationRepository.instance.logout();

      // Remove Loader
      TFullScreenLoader.stopLoading();

      if (response['code'] == 200) {
        // Save User Token

        // Redirect
        Get.offAll(() => const LoginScreen());
        TLoaders.successSnackBar(
            title: 'Success !',
            message: response["body"]['message'].toString());
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

  /// -- Google SignIn Authentication
  Future<void> googleSignIn() async {
    try {
      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TLoaders.warningSnackBar(
            title: 'Connection Error', message: "Check Internet Connection");
        return;
      }

      // Google Authentication
      final userCredential = await AuthenticationRepository.instance.signInWithGoogle();


      if (userCredential.user != null) {
        if (kDebugMode) {
          print(userCredential.user);
        }
        // Start Loading
        TFullScreenLoader.openLoadingDialog('', TImage.loader);

        // Save Data
        if (rememberMe.value) {
          storage.saveData('REMEMBER_ME_EMAIL', userCredential.user!.email);
          storage.saveData('REMEMBER_ME_PASSWORD', userCredential.user!.uid);
        }

        // Email Check if exist or not in DB
        final response = await AuthenticationRepository.instance.googleEmailCheck(userCredential.user!.email!);

        if (response['message'] == 'Email already exist.') {
          // Login user using EMail & Password Authentication
          final response = await AuthenticationRepository.instance.loginWithEmailAndPassword(
              userCredential.user!.email!, userCredential.user!.uid);
          THelperFunctions.showAlert("Email already exist.", userCredential.user!.email!);

          // Remove Loader
          TFullScreenLoader.stopLoading();
          if (response['code'] == 200) {
            // Save User Token
            storage.saveData('TOKEN', response["data"]['token']);
            debugPrint(response["data"]['token'].toString());

            DBManager().saveCustomApi(response);
            await UserController.instance.fetchUserRecord();
            TFullScreenLoader.stopLoading();

            // Redirect
            Get.offAll(() => const NavigationMenu());
            NavigationController.instance.refresh();

            TLoaders.successSnackBar(
                title: 'Welcome !', message: response['message'].toString());
          } else {
            TFullScreenLoader.stopLoading();
            // Show some Generic Error to the user
            THelperFunctions.showAlert(
                TTexts.errorTitle.tr, response['message']);
          }
        } else if (response['code'] == 312) {
          TFullScreenLoader.stopLoading();
          THelperFunctions.showAlert("Faild.", userCredential.user!.email!);
        } else {
          // Register user & save in DB
          final response = await AuthenticationRepository.instance.registerWithEmailAndPassword(
            userCredential.user!.displayName!.split(" ")[0],
            userCredential.user!.displayName!.split(" ")[1],
            userCredential.user!.email!,
            userCredential.user!.uid,
            userCredential.user!.uid,
            "",
          );
          THelperFunctions.showAlert(
              "Success Email Sing Up.", userCredential.user!.email!);

          if (response["code"] == 200) {
            final response = await AuthenticationRepository.instance.loginWithEmailAndPassword(
                userCredential.user!.email!, userCredential.user!.uid);
            // Remove Loader
            TFullScreenLoader.stopLoading();
            if (response['code'] == 200) {
              // Save User Token
              storage.saveData('TOKEN', response["data"]['token']);
              debugPrint(response["data"]['User'].toString());
              DBManager().saveCustomApi(response);
              await UserController.instance.fetchUserRecord();
              // Redirect
              TFullScreenLoader.stopLoading();
              Get.offAll(() => const NavigationMenu());
              NavigationController.instance.refresh();
              TLoaders.successSnackBar(
                  title: 'Welcome !', message: response['message'].toString());
            } else {
              TFullScreenLoader.stopLoading();

              // Show some Generic Error to the user
              THelperFunctions.showAlert(
                  TTexts.errorTitle.tr, response['message']);
            }
          } else {
            TFullScreenLoader.stopLoading();

            // Show some Generic Error to the user
            THelperFunctions.showAlert(
                TTexts.errorTitle.tr, response['message']);
          }
        }
      } else {
        TLoaders.errorSnackBar(title: TTexts.errorTitle.tr, message: TTexts.somethingWentWrong.tr);
      }
    } catch (e) {
      // Remove Loader
      // TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
