import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../utils/constants/api_constants.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../../../utils/http/http_client.dart';
import '../../../utils/local_storage/storage_utility.dart';

/// Repository class for user-related operations
class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer ${TLocalStorage().readData("TOKEN")}',
  };

  /// Function to fetch user details based on user ID.
  Future<Map<String, dynamic>> fetchUserDetails() async {
    try {
      final response =
          await THttpHelper.get(ApiConstants.profileEndPoint, headers);
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
