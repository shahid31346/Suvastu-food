import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:suvastufood/global/auth_social_buttons.dart';
import 'package:suvastufood/global/auth_textfield.dart';
import 'package:suvastufood/global/circle_button.dart';
import 'package:suvastufood/global/password_textfield.dart';
import 'package:suvastufood/global/resuable_button.dart';
import 'package:suvastufood/user_side/controller/auth_controller/login_controller.dart';
import 'package:suvastufood/user_side/main_tabs.dart';
import 'package:suvastufood/user_side/screen/auth_screens/forgot_password_screen.dart';
import 'package:suvastufood/user_side/screen/auth_screens/login_screen.dart';
import 'package:suvastufood/user_side/screen/auth_screens/register_screen.dart';
import 'package:suvastufood/utils/const.dart';

class LoginWithPhoneScreen extends StatefulWidget {
  const LoginWithPhoneScreen({super.key});

  @override
  State<LoginWithPhoneScreen> createState() => _LoginWithPhoneScreenState();
}

class _LoginWithPhoneScreenState extends State<LoginWithPhoneScreen> {
  bool passwordVisibility = false;
  final appData = GetStorage();

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
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey
                                        .withOpacity(0.1), // Shadow color
                                    blurRadius: 14,
                                    spreadRadius: 3,
                                    offset: Offset(
                                        0, 4), // Bottom and right-side shadow
                                  ),
                                ]),
                            child: IntlPhoneField(
                              textAlign: appData.read('language') == 'ur'
                                  ? TextAlign.right
                                  : TextAlign.left,

                              showCountryFlag: true,
                              flagsButtonPadding: const EdgeInsets.all(4),
                              dropdownIconPosition: IconPosition.trailing,
                              dropdownIcon: Icon(
                                Icons.keyboard_arrow_down,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .color!
                                    .withOpacity(0.85),
                              ),

                              style: TextStyle(
                                fontSize: 14,
                              ),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: kWhite,
                                isDense: true,
                                hintStyle: TextStyle(
                                    color: Colors.grey[400]!,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                                hintText: "Phone number".tr,
                                border: const OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey[300]!, width: 0.5),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: kPrimary, width: 0.5),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              inputFormatters: [
                                FilteringTextInputFormatter
                                    .digitsOnly, // Allow only digits (0-9)
                              ],
                              initialCountryCode: 'FI',
                              //autovalidateMode: AutovalidateMode.disabled,
                              onCountryChanged: (value) {
                                // loginController.maxPhoneNumberLength = value.maxLength;
                                // loginController.phoneNoControllerwithoutCode.text = '';
                                // loginController.phoneNoController.text = '';
                              },
                              onChanged: (phone) {
                                loginUserController.phoneNumberController.text =
                                    phone.number;
                                loginUserController.countryCode =
                                    phone.countryCode;
                              },
                              controller:
                                  loginUserController.phoneNumberController,
                              validator: (PhoneNumber? value) async {
                                if (value!.number.isEmpty) {
                                  return 'Phone number required'.tr;
                                }
                                return null;
                              },
                            ),
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
                                height: 50,
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
                                height: mQ.height * 0.05,
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
