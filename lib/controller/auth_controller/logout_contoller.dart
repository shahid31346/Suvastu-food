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
import 'package:suvastufood/services/remote_services.dart';
import 'package:suvastufood/utils/const.dart';


class LogoutUserController extends GetxController {
  RemoteServices remoteServices = RemoteServices(Client());
  RxBool isLoadingLogout = false.obs;

  // GetStorage instance for storing user data
  final appData = GetStorage();

  // Function to handle sign-in button click
  void logoutUser() async {
    isLoadingLogout.value = true;
    try {
      // Create a request body

      var body = jsonEncode({
        "user_id": appData.read('id'),
        "apikey": '999930',
      });

      // Call postService
      final response =
          await remoteServices.postService(url: 'logout', body: body);

      // Now you can access the response properties like statusCode and responseBody
      final statusCode = response.statusCode;
      final responseBody = response.responseBody;

      // Use the response data as needed
      if (statusCode == 200) {
        isLoadingLogout.value = false;
        loggedIn = false;
        appData.write('id', '');
        appData.write('email', 'email@example.com');
        appData.write('user_role_id', '');
        appData.write('first_name', '');
        appData.write('last_name', '');
        appData.write('full_name', 'Username');
        appData.write('country_code', '');
        appData.write('mobile', '');
        appData.write('image', '');
        appData.write('date_of_birth', '');
        appData.write('gender', '');
        appData.write('country', '');
        // Get.offAll(LoginUserScreen());
      } else {
        isLoadingLogout.value = false;

        // Handle error
      }
    } catch (e, stackTrace) {
      if (!kIsWeb) {
        FirebaseCrashlytics.instance.recordError(e, stackTrace);
      }

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
}
