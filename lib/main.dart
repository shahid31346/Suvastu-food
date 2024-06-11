// import 'package:counter_app/firebase_options.dart';
// import 'package:counter_app/utils/const.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:suvastufood/firebase_options.dart';
import 'package:suvastufood/user_side/screen/auth_screens/get_started_screen.dart';
import 'package:suvastufood/user_side/screen/auth_screens/login_screen.dart';
import 'package:suvastufood/utils/const.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
     options: DefaultFirebaseOptions.currentPlatform,
  );
   await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Khuraki',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: kPrimary),
        useMaterial3: true,
        fontFamily: 'Poppins',
      ),
      debugShowCheckedModeBanner: false,
      home: GetStartedScreen(),
    );
  }
}

////
