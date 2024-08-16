import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DocumentsController extends GetxController {
  static DocumentsController get instance => Get.find();

  /// passport variables
  final passportFirstNameController = TextEditingController();
  final passportLastNameController = TextEditingController();
  final passportExpiryDateController = TextEditingController();
  GlobalKey<FormState> addPassportFormKey = GlobalKey<FormState>();
  final isPassportFileImage = false.obs;
  final Rx<File?> passportFileImage = File("").obs;

  /// id variables
  final idFirstNameController = TextEditingController();
  final idLastNameController = TextEditingController();
  final idExpiryDateController = TextEditingController();
  GlobalKey<FormState> addIdFormKey = GlobalKey<FormState>();
  final isIDFileImage = false.obs;
  final Rx<File?> idFileImage = File("").obs;

  /// driving License variables
  final drivingLicenseFirstNameController = TextEditingController();
  final drivingLicenseLastNameController = TextEditingController();
  final drivingLicenseExpiryDateController = TextEditingController();
  GlobalKey<FormState> addDrivingLicenseFormKey = GlobalKey<FormState>();
  final isDrivingLicenseFileImage = false.obs;
  final Rx<File?> drivingLicenseFileImage = File("").obs;

  /// visa variables
  final visaFirstNameController = TextEditingController();
  final visaLastNameController = TextEditingController();
  final visaExpiryDateController = TextEditingController();
  GlobalKey<FormState> addVisaFormKey = GlobalKey<FormState>();
  final isVisaFileImage = false.obs;
  final Rx<File?> visaFileImage = File("").obs;
}
