import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:sejourne/features/authentication/models/user/user_model.dart';
import 'package:sejourne/utils/local_storage/storage_utility.dart';
import '../constants/text_strings.dart';

class DBManager {
   final storage = TLocalStorage();

  Future<void> saveCustomApi(Map<String, dynamic> response) async {
    debugPrint(response["data"]['User'].toString());

    saveUserData(response);
  }

  // get Data to Database
  Future<void> saveUserData(Map<String, dynamic> response) async {
    storage.saveData(LocalDBStrings.loginUser, response['data']['User']);
  }




  Future<UserModel> fetchUserData() async {
    UserModel model = UserModel.empty();
    var data = storage.readData(LocalDBStrings.loginUser);
    debugPrint(data.toString());
    try {
      if (data != null) {
        //var decodedData = jsonDecode(data);
        model = UserModel.fromJson(data);
      } else {
        if (kDebugMode) {
          print("object");
        }
        //Get.offAll(()=> WalkThroughScreen());
      }
    } catch (e) {
      debugPrint(" fetchUserData catch:$e");
    }
    return model;
  }

  logout()async {
   await storage.removeData("TOKEN");
   await storage.removeData(LocalDBStrings.loginUser);
   await  storage.removeData("REMEMBER_ME_PASSWORD");
  }
}
