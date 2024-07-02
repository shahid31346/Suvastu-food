import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:suvastufood/global/circle_button.dart';
import 'package:suvastufood/global/resuable_button.dart';
import 'package:suvastufood/user_side/screen/auth_screens/login_with_email.dart';
import 'package:suvastufood/utils/const.dart';

class PasswordChangeSuccessScreen extends StatefulWidget {
  const PasswordChangeSuccessScreen({super.key});

  @override
  State<PasswordChangeSuccessScreen> createState() => _PasswordChangeSuccessScreenState();
}

class _PasswordChangeSuccessScreenState extends State<PasswordChangeSuccessScreen> {
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
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                          Container(
                            decoration: BoxDecoration(
                                color: kPrimary.withOpacity(0.1),

                                shape: BoxShape.circle

                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(26.0),
                              child: Icon(
                                Icons.shopping_basket,
                                color: kPrimary,
                                size: 60,
                              ),
                            ),
                          ),
                          Text(
                            "Password Changed".tr,
                            style: TextStyle(
                                color: kPrimary,
                                fontSize: 30,
                                letterSpacing: 0.3,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: mQ.height * 0.005),
                          Text(
                            "Your password has been changed\nsuccessfully".tr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: kGrey,
                              fontSize: 14,
                              letterSpacing: 0.3,
                            ),
                          ),

                          SizedBox(height: mQ.height * 0.04),
                          Center(
                            child: SizedBox(
                              width: mQ.width * 0.85,
                              height: mQ.height * 0.060,
                              child: ResuableButton(
                                  text: "Back to Login".tr,
                                  onPressed: () {

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
