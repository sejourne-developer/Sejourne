import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_info/flutter_app_info.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sejourne/data/repositories/authentication_repository/authentication_repository.dart';
import 'package:sejourne/utils/constants/colors.dart';
import 'firebase_options.dart';
import 'myapp.dart';

/// ========= Entry Point Of Flutter App ----------
Future<void> main() async {
  /// -- Widgets Binding
  //final WidgetsBinding widgetBinding=
  WidgetsFlutterBinding.ensureInitialized();

  /// -- GetX Local Storage
  await GetStorage.init();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );

  /// -- initialize Firebase & Authentication Repository
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => Get.put(AuthenticationRepository()));

  TColors.linerGradient;

  // Load all The Material Design / Theme / Localizations / Bindings
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) async {
    runApp(
      AppInfo(
        data: await AppInfoData.get(),
        child: const MyApp(),
      ),
    );
  });
}
