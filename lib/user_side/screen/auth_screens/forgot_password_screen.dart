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
import 'package:suvastufood/user_side/controller/auth_controller/forgot_password_contrller.dart';
import 'package:suvastufood/user_side/controller/auth_controller/login_controller.dart';
import 'package:suvastufood/user_side/screen/auth_screens/login_screen.dart';
import 'package:suvastufood/user_side/screen/auth_screens/register_screen.dart';
import 'package:suvastufood/utils/const.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  ForgotPasswordController forgotPasswordController =
      Get.put(ForgotPasswordController());

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
                            "Forgot password",
                            style: TextStyle(
                                color: kPrimary,
                                fontSize: 30,
                                letterSpacing: 0.3,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: mQ.height * 0.005),
                          Text(
                            "Let's get started",
                            style: TextStyle(
                              color: kGrey,
                              fontSize: 14,
                              letterSpacing: 0.3,
                            ),
                          ),
                          SizedBox(height: mQ.height * 0.04),
                          AuthTextField(
                            prefixIcon: Icons.email_outlined,
                            controller:
                                forgotPasswordController.emailController,
                            inputType: TextInputType.emailAddress,
                            hintText: 'Email',
                            validators: (String? value) {
                              if (value!.isEmpty) {
                                return 'Email required';
                              } else if (!value.contains('@')) {
                                return 'Invalid Email';
                              }
                              return null;
                            },
                            autofillHints: const [AutofillHints.email],
                          ),
                          SizedBox(height: mQ.height * 0.08),
                          Center(
                            child: SizedBox(
                              width: mQ.width * 0.5,
                              height: mQ.height * 0.060,
                              child: ResuableButton(
                                  text: "Send Code",
                                  onPressed: () {
                                    // loginController.signupUser(context);
                                    // final appData = GetStorage();
                                    // appData.write('logged_in', true);
                                    // loggedIn = true;

                                    // Get.offAll(Confirmation_screen());
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
