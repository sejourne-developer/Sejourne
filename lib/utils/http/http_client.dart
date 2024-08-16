import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' as controller;
import 'package:http/http.dart' as http;
import '../constants/text_strings.dart';
import '../helpers/helper_functions.dart';

class THttpHelper {
  static const String _baseUrl = 'https://new.sejourne.ae/api/mobile';

  static Future<Map<String, dynamic>> get(
      String endpoint, dynamic headers) async {
    final response = await http
        .get(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: headers,
    )
        .timeout(const Duration(minutes: 10), onTimeout: () {
      return http.Response(
          'Error', 408); // Request Timeout response status code
    });
    return _handleResponse(response);
  }

  static Future<Map<String, dynamic>> post(
    String endpoint,
    dynamic data,
    dynamic headers,
  ) async {
    final response = await http
        .post(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: headers,
      //headers: {'Content-Type':'application/json'},
      body: jsonEncode(data),
    )
        .timeout(const Duration(minutes: 10), onTimeout: () {
      return http.Response(
          'Error', 408); // Request Timeout response status code
    });
    return _handleResponse(response);
  }

  static Future<dynamic> uploadImage(
    String endpoint,
    dynamic data,
    dynamic headers,
  ) async {
    try {
      FormData formData = FormData.fromMap(
          {"file": await MultipartFile.fromFile(data, filename: "file")});
      Response response = await Dio()
          .post(
        '$_baseUrl/$endpoint',
        data: formData,
        options: Options(headers: headers),
      )
          .timeout(const Duration(minutes: 10), onTimeout: () {
        THelperFunctions.showAlert(TTexts.errorTitle.tr, "Request time out");
        throw Exception("request time out");
      });
      return response;
    } on DioException catch (e) {
      return e.response;
    }
  }

  static Future<Map<String, dynamic>> put(String endpoint, dynamic data) async {
    final response = await http
        .put(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    )
        .timeout(const Duration(minutes: 10), onTimeout: () {
      return http.Response(
          'Error', 408); // Request Timeout response status code
    });
    return _handleResponse(response);
  }

  static Future<Map<String, dynamic>> delete(String endpoint) async {
    final response = await http
        .delete(Uri.parse('$_baseUrl/$endpoint'))
        .timeout(const Duration(minutes: 10), onTimeout: () {
      return http.Response(
          'Error', 408); // Request Timeout response status code
    });
    return _handleResponse(response);
  }

  static Map<String, dynamic> _handleResponse(http.Response response) {
    if (response.statusCode == 408) {
      THelperFunctions.showAlert(TTexts.errorTitle.tr, "Request time out");
      throw Exception("Request time out");
    } else {
      if (kDebugMode) {
        print(response.body);
        print(response.statusCode);
      }
      return json.decode(response.body);
    }
  }

  sendNot() async {
    var headersList = {
      'Accept': '*/*',
      'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
      'Content-Type': 'application/json',
      'Authorization':
          'key=AAAAjuqWvAU:APA91bFC6m5sG2HiqCRpC-TCDgSMzFB4FVR5CrAnpocDPPJmaI9OwP255vfn-v1Mxi50eUSN50wczdnzUkcpQuRxEZtQLvYxOX7uBcbdvKmpZHKUFvyT9lVKPoCWbRhVgr7BdEXw4rNx'
    };
    var url = Uri.parse('https://fcm.googleapis.com/fcm/send');

    var body = {
      "to":
          "caV21YadQym_BT4Gp4RpcO:APA91bGJ7ORnzJdTBe4Vm13ZHiVxCWcGtAPJG_5_B6QrqFk106B5Ca2cWhm1ug3VqOF5vjtDBgMkVNwS1Tni4l2xNYShMjjA1itr70xKIkeMqz-ItZzSb1qgkAgSe2xvGSh1laCKlHFd",
      "notification": {"title": "Hi Gasan", "body": "Welcome"}
    };

    var req = http.Request('POST', url);
    req.headers.addAll(headersList);
    req.body = json.encode(body);

    var res = await req.send();
    //final resBody = await res.stream.bytesToString();

    if (res.statusCode >= 200 && res.statusCode < 300) {
      //print(resBody);
    } else {
      //print(res.reasonPhrase);
    }
  }
}
