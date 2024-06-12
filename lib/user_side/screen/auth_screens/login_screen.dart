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
import 'package:suvastufood/user_side/main_tabs.dart';
import 'package:suvastufood/user_side/screen/auth_screens/forgot_password_screen.dart';
import 'package:suvastufood/user_side/screen/auth_screens/register_screen.dart';
import 'package:suvastufood/utils/const.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                            "Login with Phone".tr,
                            style: TextStyle(
                                color: kPrimary,
                                fontSize: 30,
                                letterSpacing: 0.3,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: mQ.height * 0.005),
                          Text(
                            "Lets get started".tr,
                            style: TextStyle(
                              color: kGrey,
                              fontSize: 14,
                              letterSpacing: 0.3,
                            ),
                          ),
                          SizedBox(height: mQ.height * 0.04),
                          AuthTextField(
                            prefixIcon: Icons.email_outlined,
                            controller: loginUserController.emailController,
                            inputType: TextInputType.emailAddress,
                            hintText: 'Email'.tr,
                            validators: (String? value) {
                              if (value!.isEmpty) {
                                return 'Email required'.tr;
                              } else if (!value.contains('@')) {
                                return 'Invalid Email'.tr;
                              }
                              return null;
                            },
                            autofillHints: const [AutofillHints.email],
                          ),
                          SizedBox(height: mQ.height * 0.02),
                          PasswordTextField(
                            controller: loginUserController.passwordController,
                            hintText: '********',
                            validators: (String? value) {
                              if (value!.isEmpty) {
                                return 'Password required'.tr;
                              }
                              return null;
                            },
                            prefixIcon: Iconsax.lock,
                            autofillHints: const [AutofillHints.password],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                style: TextButton.styleFrom(),
                                child: Text(
                                  "Forgot Password?".tr,
                                  style: TextStyle(
                                      color: kPrimary,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                                onPressed: () {
                                  Get.to(const ForgotPasswordScreen());
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: mQ.height * 0.04),
                          Column(
                            children: [
                              SizedBox(
                                width: mQ.width * 0.85,
                                height: mQ.height * 0.060,
                                child: ResuableButton(
                                    text: "Login".tr,
                                    onPressed: () {
                                      // loginController.signupUser(context);
                                      // final appData = GetStorage();
                                      // appData.write('logged_in', true);
                                      // loggedIn = true;

                                      Get.offAll(MainTabs());
                                    },
                                    color: kPrimary),
                              ),

                              SizedBox(
                                height: mQ.height * 0.05,
                              ),
                              AuthSocialButtons(
                                onApplePressed: () {},
                                onGooglePressed: () {},
                              ),

                              SizedBox(
                                height: mQ.height * 0.07,
                              ),
                              //if don't have an account then go to sign up
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Dont have an account? ".tr,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13.5,
                                        color: kBlack54),
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                        padding: EdgeInsets.zero,
                                        minimumSize: const Size(50, 50),
                                        tapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        alignment: Alignment.centerLeft),
                                    child: Text(
                                      "Sign up".tr,
                                      style:
                                          TextStyle(color: Color(0XFF68B39F)),
                                    ),
                                    onPressed: () {
                                      FocusScope.of(context).unfocus();

                                      Get.to(() => const RegisterScreen());
                                    },
                                  ),
                                ],
                              ),
                            ],
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

class AuthShape1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color(0xFFB4D1CF)
      ..style = PaintingStyle.fill;

    final double controlPointHeight =
        size.height * 1; // Adjust the control point height here
    final double widthFactor =
        0.2; // Adjust the width factor (0.4 means 40% of the original width)

    final path = Path()
      ..moveTo(size.width * (0.4 - widthFactor), size.height)
      ..lineTo(size.width * (0.5 + widthFactor), size.height)
      ..lineTo(size.width * (0.75 + widthFactor), controlPointHeight)
      ..arcToPoint(
        Offset(size.width * (0.78 - widthFactor), controlPointHeight),
        radius: Radius.circular(size.width * widthFactor),
        clockwise: false,
      )
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class AuthShape2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color(0xFFFCC8C9)
      ..style = PaintingStyle.fill;

    final double controlPointHeight =
        size.height * 1; // Adjust the control point height here
    final double widthFactor =
        0.2; // Adjust the width factor (0.4 means 40% of the original width)

    final path = Path()
      ..moveTo(size.width * (0.4 - widthFactor), size.height)
      ..lineTo(size.width * (0.5 + widthFactor), size.height)
      ..lineTo(size.width * (1.2 + widthFactor), controlPointHeight)
      ..arcToPoint(
        Offset(size.width * (1.05 - widthFactor), controlPointHeight),
        radius: Radius.circular(size.width * widthFactor),
        clockwise: false,
      )
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
