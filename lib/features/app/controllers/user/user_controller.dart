import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:sejourne/utils/constants/image_strings.dart';
import 'package:sejourne/utils/local_storage/storage_utility.dart';
import '../../../../utils/local_storage/loacal_db.dart';
import '../../../../utils/popups/general_popups/loaders.dart';
import '../../../authentication/models/user/user_model.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();


  final profileLoading = false.obs;
  var isLoading = false.obs;
  String imageURL = TImage.user;
  final imageLoading = false.obs;
  final isFileImage = false.obs;
   String? token ;
  UserModel user = UserModel.empty();

  //final userRepository = Get.put(UserRepository());
  final Rx<File?> fileImage = File("").obs;

  @override
  void onReady() async{
    super.onReady();
    await fetchUserRecord();
  }

  /// Fetch User Record
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      if (kDebugMode) {
        print("######################################### $token");
      }
      token=  TLocalStorage().readData("TOKEN");
      if (kDebugMode) {
        print("######################################### $token");
      }

      if(token != null){
        user = await DBManager().fetchUserData();
        if (kDebugMode) {
          print(user.userName.toString());
          print(user.fullName.toString());
          print(user.email.toString());
          print(user.image.toString());
        }
      }
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      profileLoading.value = false;
    }
  }

  /// Upload Profile Image From Geller
// void uploadUserProfilePicture(ImageSource imageSource) async {
//   try {
//     final pickedFile = await ImagePicker().pickImage(source: imageSource);
//     isLoading(true);
//     if (pickedFile != null) {
//       var response = await userRepository.uploadImage(pickedFile.path);
//
//       if (response.statusCode == 200) {
//         //TFullScreenLoader.stopLoading();
//         //get image url from api response
//         //fetchUserRecord();
//         imageURL = response.data["data"];
//         TLoaders.successSnackBar(
//             title: "${AppLocale.of(Get.context!).getTranslated("congrats")}",
//             message: "${AppLocale.of(Get.context!).getTranslated("imageSuccess")}");
//         // Get.snackbar('Success', 'Image uploaded successfully',
//         //     margin: const EdgeInsets.only(top: 5, left: 10, right: 10));
//       } else if (response.statusCode == 401) {
//         //Get.offAllNamed('/sign_up');
//       } else {
//         Get.snackbar("${AppLocale.of(Get.context!).getTranslated("failed")}", 'Error Code: ${response.statusCode}',
//             margin: const EdgeInsets.only(top: 5, left: 10, right: 10));
//       }
//     } else {
//       //TFullScreenLoader.stopLoading();
//       TLoaders.warningSnackBar(
//           title: "${AppLocale.of(Get.context!).getTranslated("failed")}", message: "${AppLocale.of(Get.context!).getTranslated("noImage")}");
//       // Get.snackbar('Failed', 'Image not selected',
//       //     margin: const EdgeInsets.only(top: 5, left: 10, right: 10));
//     }
//   } finally {
//     isLoading(false);
//   }
// }
}
