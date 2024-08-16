import 'package:get/get.dart';
import 'package:sejourne/localization/languages/arabic.dart';
import 'package:sejourne/localization/languages/english.dart';
import 'package:sejourne/localization/languages/french.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'fr_FR': French.french,
        'en_US': English.english,
        'ar_AR': Arabic.arabic,
        // Add more languages here
      };
}
