import 'dart:convert';
import 'dart:io';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:suvastufood/global/error_dialog.dart';
import 'package:suvastufood/global/fullscreen_dialog_loading.dart';
import 'package:suvastufood/global/success_dialog.dart';
import 'package:suvastufood/services/remote_services.dart';

class RegisterUserController extends GetxController {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  String otpText = '';
  String countryCode = '';
  RemoteServices remoteServices = RemoteServices(Client());
  final appData = GetStorage();
  String androidToken = '';
  String iosToken = '';
  RxBool clearText = false.obs;
  RxBool termAndCondition = false.obs;
  final registerFormKey = GlobalKey<FormState>();

  void termAndConditiontoggle() =>
      termAndCondition.value = termAndCondition.value ? false : true;

  @override
  void onInit() {
    super.onInit();
    assignToken();
  }

  assignToken() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    if (Platform.isAndroid) {
      androidToken = await messaging.getToken() ?? '';
    } else if (Platform.isIOS) {
      iosToken = await messaging.getToken() ?? '';
    }
  }

  void registerUser() async {
    try {
      if (registerFormKey.currentState!.validate()) {
        CustomDialog().show('Please wait...'.tr, dismissOnBgClick: false);

        var body = jsonEncode({
          "first_name": firstNameController.text.trim(),
          "last_name": lastNameController.text,
          "mobile": phoneNumberController.text,
          "country_code": countryCode,
          "email": emailController.text.trim(),
          "password": passwordController.text.trim(),
          "confirm_password": confirmPasswordController.text.trim(),
          "ios_token": iosToken,
          "andriod_token": androidToken,
        });

        final response =
            await remoteServices.postService(url: 'sign_up', body: body);

        final statusCode = response.statusCode;
        final responseBody = response.responseBody;

        CustomDialog().hide();

        if (statusCode == 200) {
          // Assuming the OTP has been sent successfully
          successDialog(
            Get.context!,
            () {
              Get.back();
            },
            responseBody["message"],
            dismissOnBgClick: false,
          );
          // Get.to(VerifyRegisterScreen());
        } else {
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
        errorDialog(
          Get.context!,
          "No internet connection. Please check your network and try again later.",
          () => Get.back(),
        );
      } else {
        errorDialog(
          Get.context!,
          "Something went wrong, try again later",
          () => Get.back(),
        );
      }
    }
  }

  void verifyOtp() async {
    clearText.value = false;
    try {
      CustomDialog().show('Verifying OTP...', dismissOnBgClick: false);

      var body = jsonEncode({
        "first_name": firstNameController.text,
        "last_name": lastNameController.text,
        "mobile": phoneNumberController.text,
        "country_code": countryCode,
        "email": emailController.text,
        "password": passwordController.text,
        "confirm_password": confirmPasswordController.text,
        "otp": otpText,
        "ios_token": iosToken,
        "andriod_token": androidToken,
      });
      print(body);
      final response =
          await remoteServices.postService(url: 'verify_sign_up', body: body);

      final statusCode = response.statusCode;
      final responseBody = response.responseBody;

      CustomDialog().hide();

      if (statusCode== 200) {
        successDialog(
          Get.context!,
          () {
            Get.back();
            Get.back();
          },
          'Your account has been created successfully',
          dismissOnBgClick: false,
        );
        // Get.to(LoginUserScreen());
      } else {
        errorDialog(
          Get.context!,
          responseBody["message"],
          () => Get.back(),
        );
      }
    } catch (e, stackTrace) {
      clearText.value = true;
      if (!kIsWeb) {
        FirebaseCrashlytics.instance.recordError(e, stackTrace);
      }
      CustomDialog().hide();

      if (e is SocketException) {
        errorDialog(
          Get.context!,
          "No internet connection. Please check your network and try again later.",
          () => Get.back(),
        );
      } else {
        clearText.value = true;
        errorDialog(
          Get.context!,
          "Something went wrong, try again later",
          () => Get.back(),
        );
      }
    }
  }
}
