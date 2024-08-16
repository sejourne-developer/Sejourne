import 'dart:async';
import 'dart:io';

import 'package:permission_handler/permission_handler.dart';
import 'package:pinput/pinput.dart';

import '../../../data/services/exporter.dart';

class SettingsController extends GetxController {
  static SettingsController get instance => Get.find();

  final locationPermission = false.obs;
  final enableButton = false.obs;
  final buttonLoading = false.obs;
  final showOtpForm = false.obs;
  final pinController = TextEditingController();
  GlobalKey<FormState> optFormKey = GlobalKey<FormState>();

  final focusNode = FocusNode();
  final focusedBorderColor = THelperFunctions.isDarkMode(Get.context!)
      ? TColors.darkPrimaryBorderColor
      : TColors.primary;
  final borderColor = THelperFunctions.isDarkMode(Get.context!)
      ? TColors.darkPrimaryBorderColor
      : TColors.grey;

  final defaultPinTheme = PinTheme(
    width: TSizes.pinSize,
    height: TSizes.pinSize,
    textStyle: Theme
        .of(Get.context!)
        .textTheme
        .headlineMedium,
    decoration: BoxDecoration(
      color: THelperFunctions.isDarkMode(Get.context!)
          ? TColors.dark
          : TColors.white,
      borderRadius: BorderRadius.circular(TSizes.sm),
      border: Border.all(
          color: THelperFunctions.isDarkMode(Get.context!)
              ? TColors.darkPrimaryBorderColor
              : TColors.grey),
    ),
  );

  late Timer _timer;
  Rx<int> start = 60.obs;

  List<bool> permissionValue = [];
  List<Permission> permissionKey = [
    Permission.location,
    Permission.camera,
    Permission.contacts,
    Platform.isAndroid ? Permission.storage : Permission.photos,
    Permission.microphone,
    Permission.notification,
    Permission.calendarWriteOnly,
  ];

  @override
  void onReady() async {
    for (int i = 0; i<permissionKey.length;i++) {
      final status = await permissionKey[i].status;
      permissionValue.addIf(status.isGranted, true);
      permissionValue.addIf(status.isDenied, false);
    }
    super.onReady();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (start.value == 0) {
          timer.cancel();
        } else {
          start.value--;
        }
      },
    );
  }
}
