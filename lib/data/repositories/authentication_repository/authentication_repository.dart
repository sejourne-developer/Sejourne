import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sejourne/features/authentication/screens/onBoarding/onBoarding_settings_screen/on_boarding_app_settings_screen.dart';
import 'package:sejourne/features/authentication/screens/onBoarding/onboarding_screens/onboarding.dart';
import '../../../features/app/controllers/user/user_controller.dart';
import '../../../navigation_menu.dart';
import '../../../utils/constants/api_constants.dart';
import '../../../utils/http/http_client.dart';
import '../../../utils/local_storage/storage_utility.dart';
import '../../../utils/popups/general_popups/loaders.dart';
import '../../services/exporter.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  bool alreadyLog = false;
  final removeSplash = false.obs;
  final storage=TLocalStorage();
  // final _token = storage.readData('TOKEN');
  final Rx<int> themeSelect = 0.obs;
  final Rx<String> themeSelectText = "Light".obs;


  static Rx<String> selectedAppLanguage = "${TTexts.english.tr} - ENG".obs;
  static final selectedAppCurrency= "${TTexts.aed.tr} - ${TTexts.aed.tr}".obs;



  /// Called from main.dart on app
  @override
  void onReady() {
    Get.put(UserController());
    super.onReady();
    final value = storage.readData("SELECTED_LANGUAGE");
    if (value == "AR") {
      selectedAppLanguage.value ="${TTexts.arabic.tr} - AR";
      Get.updateLocale(arabic);
    } else if (value == "FR") {
      selectedAppLanguage.value = "${TTexts.french.tr} - FR";
      Get.updateLocale(french);
    } else {
      selectedAppLanguage.value = "${TTexts.english.tr} - ENG";
      Get.updateLocale(english);
    }
    if (storage.readData("DARK_THEME_MODE") != null) {
      if (storage.readData("DARK_THEME_MODE")) {
        themeSelect.value = 1;
        themeSelectText.value="Dark Mode";
        Get.changeThemeMode(ThemeMode.dark);
      } else {
        themeSelect.value = 0;
        themeSelectText.value="Light Mode";
        Get.changeThemeMode(ThemeMode.light);
      }
    } else {
      Get.changeThemeMode(ThemeMode.system);
    }

    // Remove the splash screen
    Timer(const Duration(seconds: 3), () {
      removeSplash.value = true;
      screenRedirect();
    });
  }

  /// Function to show Relevant screen
  screenRedirect() async {
    GetStorage().writeIfNull("isOnBoardingAppSettingsScreenFirstTime", true);
    GetStorage().writeIfNull("isOnBoardingScreenFirstTime", true);
    // local storage
    if (kDebugMode) {
      print(
          '========================== GET STORAGE AUTH REPO ========================== ');
      print(storage.readData("isOnBoardingAppSettingsScreenFirstTime"));
      print(storage.readData("isOnBoardingScreenFirstTime"));
    }

    // if the user's Already login is . navigate to the main Navigation Menu
    // if (_token != null) {
    //   Get.to(() => const NavigationMenu());
    // }

    // check if it's the OnBoarding App Settings Screen First time after launching the app
    // else
      if (storage.readData("isOnBoardingAppSettingsScreenFirstTime")) {
      Get.to(() =>
          const OnBoardingAppSettingsScreen()); // Redirect to onBoarding App Settings screen if it's the first time
    }
    // check if it's the OnBoarding Screen First time after launching the app
    else if (storage.readData("isOnBoardingScreenFirstTime")) {
      Get.to(() =>
          const OnBoardingScreen()); // Redirect to onBoarding screen if it's the first time
    } else {
      Get.to(() => const NavigationMenu());
    }
    update();
  }

/* ------------------------------  Email & Password sing-in -------------------------------- */

  /// [EmailAuthentication] - LOGIN
  Future<Map<String, dynamic>> loginWithEmailAndPassword(
    String email,
    String password,
  ) async {
    var headers = {'Content-Type': 'application/json'};
    try {
      Map body = {'email': email, 'password': password};
      final response =
          await THttpHelper.post(ApiConstants.loginEndPoint, body, headers);
      if (kDebugMode) {
        print("response is : \n$response");
      }
      return response;
    } catch (error) {
      Get.back();
      THelperFunctions.showAlert("Error", error.toString());
      throw Exception('Failed to load data.');
    }
  }

//
  /// [EmailAuthentication] - REGISTER
  Future<Map<String, dynamic>> registerWithEmailAndPassword(
      String firstName,
      String lastName,
      String email,
      String password,
      String confirmPassword,
      String? phone) async {
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };
    try {
      Map body = {
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'number': phone,
        'password': password,
        "password_confirmation": confirmPassword
      };
      final response =
          await THttpHelper.post(ApiConstants.registerEndPoint, body, headers);
      if (kDebugMode) {
        print("response is : \n$response");
      }
      return response;
    } catch (error) {
      //TFullScreenLoader.stopLoading();
      throw Exception('Failed to load data.');
    }
  }
  /// [EmailAuthentication] - Email Verification send Otp code
  Future<Map<String, dynamic>> sendEmailVerificationOTPCodeToEmail(int sessionUserId) async {
    var headers = {'Content-Type': 'application/json'};
    try {
      Map body = {
        'session_user_id': sessionUserId,
      };
      final response = await THttpHelper.post(
          ApiConstants.otpVerifyEmailCodeEndPoint, body, headers);
      if (kDebugMode) {
        print("response is : \n$response");
      }
      return response;
    } catch (error) {
      Get.back();
      THelperFunctions.showAlert("Error", error.toString());
      throw Exception('Failed to load data.');
    }
  }
  /// [OTPVerification] - Email Verification otp code
  Future<Map<String, dynamic>> emailOTPVerificationCode(String otp,int sessionUserId) async {
    var headers = {'Content-Type': 'application/json'};
    try {
      Map body = {
        'session_user_id': sessionUserId,
        'code': otp,
      };
      final response = await THttpHelper.post(
          ApiConstants.emailValidateCodeEndPoint, body, headers);
      if (kDebugMode) {
        print("response is : \n$response");
      }
      return response;
    } catch (error) {
      Get.back();
      THelperFunctions.showAlert("Error", error.toString());
      throw Exception('Failed to load data.');
    }
  }

  /// [OTPVerification] - OTP Verification
  Future<Map<String, dynamic>> oTPVerification(String otp) async {
    var headers = {'Content-Type': 'application/json'};
    try {
      Map body = {
        'code': otp,
      };
      final response = await THttpHelper.post(
          ApiConstants.validateCodeEndPoint, body, headers);
      if (kDebugMode) {
        print("response is : \n$response");
      }
      return response;
    } catch (error) {
      Get.back();
      THelperFunctions.showAlert("Error", error.toString());
      throw Exception('Failed to load data.');
    }
  }

  /// [EmailAuthentication] - Forget Password
  Future<Map<String, dynamic>> sendOTPEmail(String email) async {
    var headers = {'Content-Type': 'application/json'};
    try {
      Map body = {
        'email': email,
      };
      final response = await THttpHelper.post(
          ApiConstants.forgetPasswordEndPoint, body, headers);
      if (kDebugMode) {
        print("response is : \n$response");
      }
      return response;
    } catch (error) {
      Get.back();
      THelperFunctions.showAlert("Error", error.toString());
      throw Exception('Failed to load data.');
    }
  }

  /// [ResetPassword] - change User password
  Future<Map<String, dynamic>> resetPassword(
      String password, String token) async {
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    try {
      Map body = {'password': password, 'token': token};
      final response = await THttpHelper.post(
          ApiConstants.resetPasswordEndPoint, body, headers);
      if (kDebugMode) {
        print("response is : \n$response");
      }
      return response;
    } catch (error) {
      Get.back();
      THelperFunctions.showAlert("Error", error.toString());
      throw Exception('Failed to load data.');
    }
  }

/* ------------------------------  ./end Federated identity & social sing-in -------------------------------- */

  /// [LogoutUser] - Valid for any authentication
  Future<Map<String, dynamic>> logout() async {
    try {
      final headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${TLocalStorage().readData("TOKEN")}',
      };
      final response =
          await THttpHelper.get(ApiConstants.logoutEndPoint, headers);
      if (kDebugMode) {
        print("response is : \n$response");
      }
      return response;
    } catch (error) {
      Get.back();
      THelperFunctions.showAlert("Error", error.toString());
      throw Exception('Failed to load data.');
    }
  }

  /// [GoogleAuthentication] - GOOGLE
  Future<UserCredential> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

     // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;

      //Create a new Credential
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      // Once signed in, return UserCredential
      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      debugPrint("==================== Google Credential ===============${userCredential.user?.email}");

      //googleEmailCheck(userAccount!.email);

      return userCredential;
    } catch (e) {
      TLoaders.errorSnackBar(title: TTexts.errorTitle.tr, message: TTexts.somethingWentWrong.tr);
      throw Exception("");
    }
  }

  Future<Map<String, dynamic>> googleEmailCheck(String userEmail) async {
    var headers = {'Content-Type': 'application/json'};
    try {
      Map body = {
        'email': userEmail,
      };
      final response = await THttpHelper.post(
          ApiConstants.googleEmailCheckEndPoint, body, headers);
      if (kDebugMode) {
        print("response is : \n$response");
      }
      return response;
    } catch (error) {
      Get.back();
      THelperFunctions.showAlert("Error", error.toString());
      throw Exception('Failed to load data.');
    }
  }
}
