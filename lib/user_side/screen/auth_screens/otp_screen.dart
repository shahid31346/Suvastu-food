import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';
import 'package:suvastufood/global/auth_social_buttons.dart';
import 'package:suvastufood/global/auth_textfield.dart';
import 'package:suvastufood/global/circle_button.dart';
import 'package:suvastufood/global/password_textfield.dart';
import 'package:suvastufood/global/resuable_button.dart';
import 'package:suvastufood/user_side/controller/auth_controller/forgot_password_contrller.dart';
import 'package:suvastufood/user_side/controller/auth_controller/login_controller.dart';
import 'package:suvastufood/user_side/controller/auth_controller/register_controller.dart';
import 'package:suvastufood/user_side/screen/auth_screens/login_screen.dart';
import 'package:suvastufood/user_side/screen/auth_screens/register_screen.dart';
import 'package:suvastufood/user_side/screen/auth_screens/reset_password_screen.dart';
import 'package:suvastufood/utils/const.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  RegisterUserController registerUserController =
      Get.put(RegisterUserController());

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
                            "OTP",
                            style: TextStyle(
                                color: kPrimary,
                                fontSize: 30,
                                letterSpacing: 0.3,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: mQ.height * 0.005),
                          Text(
                            "We've send the code to your email".tr,
                            style: TextStyle(
                              color: kGrey,
                              fontSize: 14,
                              letterSpacing: 0.3,
                            ),
                          ),
                          SizedBox(height: mQ.height * 0.04),
                          Obx(() {
                            return SizedBox(
                              height: mQ.height * 0.065,
                              child: OtpTextField(
                                numberOfFields: 5,
                                borderColor: kPrimary,
                                borderWidth: 1,

                                fieldWidth: mQ.width * 0.12,

                                focusedBorderColor: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.5),
                                clearText:
                                    registerUserController.clearText.value,
                                showFieldAsBox: true,
                                textStyle: kSubTitle,
                                fillColor: kWhite,
                                filled: true,
                                borderRadius: BorderRadius.circular(8),

                                onSubmit: (String verificationCode) {
                                  registerUserController.otpText =
                                      verificationCode;
                                  registerUserController.verifyOtp();
                                  //set clear text to clear text from all fields
                                }, // end onSubmit
                              ),
                            );
                          }),
                          SizedBox(height: mQ.height * 0.08),
                          Center(
                            child: SizedBox(
                              width: mQ.width * 0.5,
                              height: mQ.height * 0.060,
                              child: ResuableButton(
                                  text: "Verify",
                                  onPressed: () {
                                    // loginController.signupUser(context);
                                    // final appData = GetStorage();
                                    // appData.write('logged_in', true);
                                    // loggedIn = true;

                                    Get.offAll(ResetPasswordScreen());
                                  },
                                  color: kPrimary),
                            ),
                          ),
                          Center(
                            child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Resend OTP",
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: kPrimary,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12),
                                )),
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
