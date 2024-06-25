import 'dart:convert';
import 'dart:io';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:http/http.dart';
import 'package:suvastufood/global/error_dialog.dart';
import 'package:suvastufood/global/fullscreen_dialog_loading.dart';
import 'package:suvastufood/services/remote_services.dart';
import 'package:suvastufood/user_side/main_tabs.dart';
import 'package:suvastufood/utils/const.dart';

class LoginUserController extends GetxController {
  final loginFormKey = GlobalKey<FormState>();
  RemoteServices remoteServices = RemoteServices(Client());

  // TextEditingController emailController =
  // TextEditingController(text: "");
  // TextEditingController passwordController =
  // TextEditingController(text: "");
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  String countryCode = '';
  String androidToken = '';
  String iosToken = '';

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    assignToken();
  }

  //getting token for firebase notification
  assignToken() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    if (Platform.isAndroid) {
      androidToken = await messaging.getToken() ?? '';
    } else if (Platform.isIOS) {
      iosToken = await messaging.getToken() ?? '';
    }
  }

  // GetStorage instance for storing user data
  final appData = GetStorage();

  // Function to handle sign-in button click
  void loginUser() async {
    try {
      if (loginFormKey.currentState!.validate()) {
        String email = emailController.text.trim();
        String password = passwordController.text.trim();

        // Show a custom progress dialog
        CustomDialog().show('Please wait...'.tr, dismissOnBgClick: false);

        // Create a request body

        var body = jsonEncode({
          "login_email": email.replaceAll(" ", ""),
          "login_password": password.replaceAll(" ", ""),
          "ios_token": iosToken,
          "android_token": androidToken,
        });

        // Call postService
        final response =
            await remoteServices.postService(url: 'login', body: body);

        // Now you can access the response properties like statusCode and responseBody
        final statusCode = response.statusCode;
        final responseBody = response.responseBody;

        // Use the response data as needed
        if (statusCode == 200) {
          // Store user data
          saveUserData(responseBody: responseBody);
        } else {
          // Handle error
          CustomDialog().hide();

          errorDialog(
            Get.context!,
            responseBody["message"],
            () => Get.back(),
          );
        }
      }
    } catch (e, stackTrace) {
      if (!kIsWeb) {
        FirebaseCrashlytics.instance.recordError(e, stackTrace);
      }
      CustomDialog().hide();

      if (e is SocketException) {
        // Handle socket/network-related error
        errorDialog(
          Get.context!,
          "No internet connection. Please check your network and try again later.",
          () => Get.back(),
        );
      } else {
        // Handle other types of errors
        errorDialog(
          Get.context!,
          "Something went wrong, try again later",
          () => Get.back(),
        );
      }
    }
  }

  saveUserData({var responseBody}) {
    appData.write('id', responseBody['data']['id']);
    appData.write('email', responseBody['data']['email']);
    appData.write('user_role_id', responseBody['data']['user_role_id']);
    appData.write('first_name', responseBody['data']['first_name']);
    appData.write('last_name', responseBody['data']['last_name']);
    appData.write('full_name', responseBody['data']['full_name']);
    appData.write('country_code', responseBody['data']['country_code']);
    appData.write('mobile', responseBody['data']['mobile']);
    appData.write('image', responseBody['data']['image']);
    appData.write('date_of_birth', responseBody['data']['date_of_birth']);
    appData.write('gender', responseBody['data']['gender']);
    appData.write('country', responseBody['data']['country']);

    // Save categoires_interested
    String categoriesInterestedString =
        responseBody['data']['categoires_interested'];
    List<String> integerStrings = categoriesInterestedString
        .replaceAll("[", "")
        .replaceAll("]", "")
        .split(",");
    List<int> categoriesInterested =
        integerStrings.map((str) => int.parse(str.trim())).toList();
    appData.write('categoires_interested', categoriesInterested);

    // Hide the custom dialog
    CustomDialog().hide();
    appData.write('logged_in', true);
    loggedIn = true;
    emailController.clear();
    passwordController.clear();
    Get.offAll(MainTabs());
  }
}
