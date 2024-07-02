import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';
import 'package:suvastufood/global/auth_social_buttons.dart';
import 'package:suvastufood/global/auth_textfield.dart';
import 'package:suvastufood/global/circle_button.dart';
import 'package:suvastufood/global/password_textfield.dart';
import 'package:suvastufood/global/resuable_button.dart';
import 'package:suvastufood/user_side/controller/auth_controller/login_controller.dart';
import 'package:suvastufood/user_side/screen/auth_screens/forgot_password_screen.dart';
import 'package:suvastufood/user_side/screen/auth_screens/login_with_email.dart';
import 'package:suvastufood/user_side/screen/dialogs/password_changed_dialog.dart';

import 'package:suvastufood/utils/const.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  bool passwordVisibility = false;

  LoginUserController loginUserController = Get.put(LoginUserController());

  @override
  Widget build(BuildContext context) {
    final mQ = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kBgColor,
      body: SafeArea(
        child: Container(
          height: mQ.height,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Form(
                  // key: loginController.formKey,
                  child: AutofillGroup(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 12,
                            ),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: CircleButton(
                                icon: Icons.arrow_back,
                                onPressed: () {
                                  Get.back();
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: mQ.height * 0.015),
                          Text(
                            "Reset password".tr,
                            style: TextStyle(
                                color: kPrimary,
                                fontSize: 30,
                                letterSpacing: 0.3,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: mQ.height * 0.005),
                          Text(
                            "Type new password".tr,
                            style: TextStyle(
                              color: kGrey,
                              fontSize: 14,
                              letterSpacing: 0.3,
                            ),
                          ),
                          SizedBox(height: mQ.height * 0.04),
                          PasswordTextField(
                            controller: loginUserController.passwordController,
                            hintText: 'Password'.tr,
                            validators: (String? value) {
                              if (value!.isEmpty) {
                                return 'Password required'.tr;
                              }
                              return null;
                            },
                            prefixIcon: Iconsax.lock,
                            autofillHints: const [AutofillHints.password],
                          ),
                          SizedBox(height: mQ.height * 0.02),
                          PasswordTextField(
                            controller: loginUserController.passwordController,
                            hintText: 'Confirm password'.tr,
                            validators: (String? value) {
                              if (value!.isEmpty) {
                                return 'Confirm password required'.tr;
                              }
                              return null;
                            },
                            prefixIcon: Iconsax.lock,
                            autofillHints: const [AutofillHints.password],
                          ),
                          SizedBox(height: mQ.height * 0.04),
                          Center(
                            child: SizedBox(
                              width: mQ.width * 0.85,
                              height: mQ.height * 0.060,
                              child: ResuableButton(
                                  text: "Reset Password".tr,
                                  onPressed: () {
                                  passwordChangedDialog(context);
                                  },
                                  color: kPrimary),
                            ),
                          ),
                          SizedBox(
                            height: mQ.height * 0.05,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 20,
                right: 0,
                height: mQ.height * 0.1, // Adjust the height as needed
                child: CustomPaint(
                  painter: AuthShape1(),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 20,
                right: 0,
                height: mQ.height * 0.1, // Adjust the height as needed
                child: CustomPaint(
                  painter: AuthShape2(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
