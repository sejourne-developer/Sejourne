import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:sejourne/data/services/exporter.dart';


/// Manages the Network connectivity status and provides methods to check and handle connectivity changes.
class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;
  final containerHeight = 0.0.obs;

  /// initialize the network manager and set up a stream to continually check the connection status.
  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    _connectionStatus.value = result;
    if (_connectionStatus.value == ConnectivityResult.none) {
      containerHeight.value=56;
      // Get.rawSnackbar(
      //     messageText: Text(
      //       TTexts.noInternetConnect.tr,
      //       style: Theme.of(Get.context!).textTheme.labelMedium!.apply(color: TColors.white),
      //     ),
      //     duration: const Duration(days: 60),
      //     icon: const Icon(
      //       Icons.wifi_off,
      //       color: TColors.white,
      //       size: TSizes.iconSm,
      //     ),
      //     isDismissible: false,
      //     backgroundColor: TColors.darkContainer,
      //     margin: EdgeInsets.zero,
      //     padding: EdgeInsets.zero,
      //     snackStyle: SnackStyle.FLOATING,
      //     snackPosition: SnackPosition.TOP
      // );
      // Get.closeCurrentSnackbar();
      // TLoaders.warningSnackBar(title: TTexts.noInternetConnect.tr,duration: const Duration(days: 1));
    } else {
      containerHeight.value=0;
      // TLoaders.successSnackBar(
      //     title: TTexts.internetConnectRestored, icon: Iconsax.info_circle);
    }
  }

  /// Check the internet connection status.
  /// Returns 'true' if connected 'false' otherwise.
  Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();
      if (result == ConnectivityResult.none) {
        return false;
      } else {
        return true;
      }
    } on PlatformException catch (_) {
      return false;
    }
  }

  /// Dispose or close the active connectivity stream
  @override
  void onClose() {
    super.onClose();
    _connectivitySubscription.cancel();
  }
}
