// import 'package:counter_app/firebase_options.dart';
// import 'package:counter_app/utils/const.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:suvastufood/firebase_options.dart';
import 'package:suvastufood/user_side/main_tabs.dart';
import 'package:suvastufood/user_side/screen/auth_screens/get_started_screen.dart';
import 'package:suvastufood/user_side/screen/deals_screens/deals_screen.dart';
import 'package:suvastufood/user_side/screen/onboarding_screen/onboarding_screen.dart';
import 'package:suvastufood/user_side/screen/orders_screen/write_review_screen.dart';
import 'package:suvastufood/user_side/screen/profile_screens/profile_screen.dart';
import 'package:suvastufood/user_side/screen/restaurant_flow/checkout_screen.dart';
import 'package:suvastufood/user_side/screen/restaurant_flow/mycart_screen.dart';
import 'package:suvastufood/user_side/screen/restaurant_flow/order_status_screen.dart';
import 'package:suvastufood/user_side/screen/restaurant_flow/review_orders_screen.dart';
import 'package:suvastufood/utils/const.dart';
import 'package:suvastufood/utils/translation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final appData = GetStorage();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Khuraki',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: kPrimary),
        useMaterial3: true,
        fontFamily: 'Poppins', //
      ),
      translations: Languages(), // Language translations
      locale:
          Locale(appData.read('language') ?? 'en'), // Default locale is English
      fallbackLocale: Locale('en_US'), // Fallback locale is English
      debugShowCheckedModeBanner: false,

      home: OnboardingScreen(),
    );
  }
}
