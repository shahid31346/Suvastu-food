import 'dart:ui';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ChangeLanguageController extends GetxController {
  RxString selectedLanguage = "en".obs;

  String get language => selectedLanguage.value;
  final appData = GetStorage();

  @override
  void onInit() {
    super.onInit();
    loadLanguage();
    // Retrieve the saved language from GetStorFFage when the controller initializes
    selectedLanguage.value = appData.read('language') ?? "en";
  }

  loadLanguage() {
    String? savedLanguage = appData.read('language');
    if (savedLanguage != null) {
      selectedLanguage.value = savedLanguage;
    }
  }

  changeLanguage(String language) {
    selectedLanguage.value = language;

    Get.updateLocale(Locale(language));
    // Save the selected language to GetStorage
    appData.write('language', language);

    print(appData.read('countryCode'));
  }
}
