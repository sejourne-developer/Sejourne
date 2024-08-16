import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalInformationController extends GetxController {
  static PersonalInformationController get instance => Get.find();

  final firstnameEditingController =
      TextEditingController(); // Controller for first name input
  final lastnameEditingController =
      TextEditingController(); // Controller for last name input
  final displayNameEditingController =
      TextEditingController(); // Controller for last name input
  final emailEditingController =
      TextEditingController(); // Controller for email input
  final phoneEditingController =
      TextEditingController(); // Controller for phone input
  final countryTextController =
      TextEditingController(); // Controller for country input

  var countryList=codes;
  late List<CountryCode>? elements;

  /// Default.
  var countryPicker = const FlCountryCodePicker(localize: true,

      favorites:  ['US', 'PH', 'AU', 'JP'],
      filteredCountries: CountryLocalizations.supportedLocales,);



  CountryCode? countryCode;
  final hasMaxLengthError = false.obs;
  final showBirthDateCalender = false.obs;

  final Rx<int> genderSelect = 0.obs;

  GlobalKey<FormState> changeNameForm =
      GlobalKey<FormState>(); // Form key for form validation
  GlobalKey<FormState> displayNameForm =
      GlobalKey<FormState>(); // Form key for form validation
  GlobalKey<FormState> emailForm =
      GlobalKey<FormState>();

  @override
  void onReady() {
    List<Map<String, dynamic>> jsonList = countryList;
     elements =
    jsonList.map((json) => CountryCode.fromMap(json)).toList();
  } // Form key for form validation




}
