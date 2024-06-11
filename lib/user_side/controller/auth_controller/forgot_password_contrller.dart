import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'dart:io';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:suvastufood/global/error_dialog.dart';
import 'package:suvastufood/global/fullscreen_dialog_loading.dart';
import 'package:suvastufood/global/success_dialog.dart';
import 'package:suvastufood/services/remote_services.dart';

class ForgotPasswordController extends GetxController {
  final forgotPasswordFormKey = GlobalKey<FormState>();
  RemoteServices remoteServices = RemoteServices(Client());

  // TextEditingController emailController =
  //     TextEditingController(text: "");
  TextEditingController emailController = TextEditingController();
  // GetStorage instance for storing user data
  final appData = GetStorage();

  // Function to handle sign-in button click
  void forgotPasswordSend() async {
    try {
      if (forgotPasswordFormKey.currentState!.validate()) {

        // Show a custom progress dialog

        CustomDialog().show('Please wait...'.tr, dismissOnBgClick: false);

        // Create a request body

        var body = jsonEncode({
          "email": emailController.text.trim(),
          "": '',
        });

        // Call postService
        final response = await remoteServices.postService(
            url: 'forget_password', body: body);

        // Now you can access the response properties like statusCode and responseBody
        final statusCode = response.statusCode;
        final responseBody = response.responseBody;

        // Use the response data as needed
        if (statusCode == 200) {
          Get.back();
          successDialog(
            Get.context!,
            () {
              Get.back();
            },
            responseBody["message"],
            dismissOnBgClick: false,
          );
          // Store user data
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
}
