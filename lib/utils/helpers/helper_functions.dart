import 'dart:async';
import 'dart:io';

import 'package:app_settings/app_settings.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sejourne/utils/constants/colors.dart';
import 'package:sejourne/utils/constants/sizes.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../constants/text_strings.dart';

class THelperFunctions {
  static Color? getColor(String value) {
    if (value == 'Green') {
      return Colors.green;
    } else if (value == 'Red') {
      return Colors.red;
    } else if (value == 'Blue') {
      return Colors.blue;
    } else if (value == 'Pink') {
      return Colors.pink;
    } else if (value == 'Grey') {
      return Colors.grey;
    } else if (value == 'Purple') {
      return Colors.purple;
    } else if (value == 'Black') {
      return Colors.black;
    } else if (value == 'White') {
      return Colors.white;
    } else if (value == 'Brown') {
      return Colors.brown;
    } else if (value == 'Teal') {
      return Colors.teal;
    } else if (value == 'Indigo') {
      return Colors.indigo;
    }
    if (value == 'Yellow') {
      return Colors.yellow;
    } else {
      return null;
    }
  }

  static void showSnackBar(String message) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  /// Upload Rating Image From Geller
  static Future<File?> uploadPicture(ImageSource imageSource) async {
    final ImagePicker picker = ImagePicker();
    final XFile? img = await picker.pickImage(
      source: imageSource, // alternatively, use ImageSource.gallery
      maxWidth: 400,
    );
    if (img == null) return null;
    final imgFile = File(img.path); // convert it to a Dart:io file
    if (kDebugMode) {
      print("success");
    }
    return imgFile;
  }


  static void showAlert(String title, String message) {
    showDialog(
        context: Get.context!,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            shape: OutlineInputBorder(
                borderRadius:
                    const BorderRadius.all(Radius.circular(TSizes.md)),
                borderSide: BorderSide(
                  color: THelperFunctions.isDarkMode(context)
                      ? TColors.darkPrimaryBorderColor
                      : TColors.lightPrimaryBorderColor,
                )),
            backgroundColor: THelperFunctions.isDarkMode(context)
                ? TColors.darkContainer
                : TColors.white,
            alignment: Alignment.center,
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child:  Text(TTexts.ok.tr),
              ),
            ],
          );
        });
  }

  // static void showLogoutAlert() {
  //   showDialog(
  //       context: Get.context!,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           title: const Icon(
  //             Iconsax.info_circle,
  //             size: TSizes.appBarHeight,
  //             color: TColors.primary,
  //           ),
  //           alignment: Alignment.center,
  //           content: RichText(
  //             maxLines: 2,
  //             textAlign: TextAlign.center,
  //             text: TextSpan(
  //               text: "${TTexts.signOutLabel.tr}\n",
  //               style: Theme.of(context).textTheme.titleLarge,
  //               children: <TextSpan>[
  //                 TextSpan(
  //                     text: TTexts.areYouSureYouWantToLogout.tr,
  //                     style: Theme.of(context).textTheme.bodyMedium),
  //               ],
  //             ),
  //           ),
  //           actionsAlignment: MainAxisAlignment.center,
  //           actions: [
  //             Column(
  //               crossAxisAlignment: CrossAxisAlignment.center,
  //               children: [
  //                 TRoundedContainer(
  //                   isGradient: true,
  //                   radius: TSizes.cardRadiusMd,
  //                   gradient: TColors.linerGradient2,
  //                   width: double.infinity,
  //                   child: ElevatedButton(
  //                     onPressed: () async {
  //                       var isSignedIn = await GoogleSignIn().isSignedIn();
  //                       if (isSignedIn) await GoogleSignIn().signOut();
  //                       FirebaseAuth.instance.signOut();
  //                       DBManager().logout();
  //                       Get.offAll(() => const LoginScreen());
  //                     }, //controller.logout(),
  //                     child:  Text(TTexts.signOutLabel.tr),
  //                   ),
  //                 ),
  //                 const SizedBox(
  //                   height: TSizes.defaultSpace,
  //                 ),
  //                 SizedBox(
  //                   width: double.infinity,
  //                   height: 48,
  //                   child: OutlinedButton(
  //                     onPressed: () => Navigator.of(context).pop(),
  //                     child:  Text(TTexts.cancelLabel.tr),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ],
  //         );
  //       });
  // }

  static void showGeneralAlert(
    String title,
    String subTitle,
    String head,
  ) async {
    //final controller=Get.put(LoginController());
    showDialog(
        context: Get.context!,
        builder: (BuildContext context) {
          return AlertDialog(
            title: FittedBox(
              child: Text(
                title,
                textAlign: TextAlign.center,
              ),
            ),
            alignment: Alignment.center,
            content: Text(
                textAlign: TextAlign.start,
                subTitle,
                style: Theme.of(context).textTheme.bodyMedium),
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text('No, Thank You')),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: TSizes.defaultSpace,
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        AppSettings.openAppSettings(
                            type: AppSettingsType.location);
                      },
                      child: const FittedBox(
                          fit: BoxFit.scaleDown, child: Text('Go to Settings')),
                    ),
                  ),
                ],
              ),
            ],
          );
        });
  }

  static Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      THelperFunctions.showGeneralAlert(TTexts.locationServiceTitle.tr,
          TTexts.locationServiceSubTitle.tr, "Sejourne App");
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        THelperFunctions.showGeneralAlert(TTexts.locationServiceDeniedTitle.tr,
            TTexts.locationServicesDeniedRequiresSubTitle.tr, "Sejourne App");

        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      THelperFunctions.showGeneralAlert(
          TTexts.locationServiceDeniedPermanentlyTitle.tr,
          TTexts.locationServiceDeniedPermanentlySubTitle.tr,
          "Sejourne App");

      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  static Future<PermissionStatus> requestPermission(
      {required Permission permission}) async {
    final status = await permission.status;
    if (status.isGranted) {
      debugPrint("${permission.toString()} is already Granted");
    } else if (status.isDenied) {
      if (await permission.request().isGranted) {
        debugPrint("${permission.toString()}Permission Granted");
      } else {
        debugPrint("${permission.toString()} Denied");
      }
    } else {
      debugPrint("${permission.toString()} Denied");
    }
    if (status.isLimited) {}
    if (status.isPermanentlyDenied) {}
    if (status.isRestricted) {}
    return status;
  }




  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  static String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}...';
    }
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Size screenSize() {
    return MediaQuery.of(Get.context!).size;
  }

  static double screenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  static double screenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }

  static String getFormattedDate(DateTime date,
      {String format = 'dd MMM yyyy'}) {
    return DateFormat(format).format(date);
  }

  static List<T> removeDuplicates<T>(List<T> list) {
    return list.toSet().toList();
  }

  static List<Widget> wrapWidgets(List<Widget> widgets, int rowSize) {
    final wrappedList = <Widget>[];
    for (var i = 0; i < widgets.length; i += rowSize) {
      final rowChildren = widgets.sublist(
          i, i + rowSize > widgets.length ? widgets.length : i + rowSize);
      wrappedList.add(Row(
        children: rowChildren,
      ));
    }
    return wrappedList;
  }

  static String dateSelection(DateRangePickerSelectionChangedArgs args) {
    String selectedDate = '';
    if (args.value is PickerDateRange) {
      selectedDate =
          '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
          ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
      debugPrint("######################## Selected Date Range $selectedDate");
    } else if (args.value is DateTime) {
      selectedDate = args.value.toString();
      debugPrint("######################## Selected Date single $selectedDate");
    } else if (args.value is List<DateTime>) {
      selectedDate = args.value.length.toString();
      debugPrint("######################## Selected Date list $selectedDate");
    } else {
      selectedDate = args.value.length.toString();
      debugPrint("######################## Selected Date else $selectedDate");
    }
    return selectedDate;
  }
}
