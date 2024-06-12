import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:suvastufood/global/auth_social_buttons.dart';
import 'package:suvastufood/global/elevated_button.dart';
import 'package:suvastufood/user_side/screen/auth_screens/login_screen.dart';
import 'package:suvastufood/utils/const.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mQ = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: mQ.height,
        width: mQ.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
              kOrange.withOpacity(0.2), // Apply blend color
              BlendMode.softLight,
            ),
            opacity: 0.6,
            image: const AssetImage(
              "assets/image_5.png",
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: mQ.height * 0.48,
            ),
            Container(
              height: mQ.height * 0.52,
              width: mQ.width,
              decoration: BoxDecoration(
                color: kWhite,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Signup or Login",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          letterSpacing: 0.3,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Select your preferred method to Continue",
                      style: TextStyle(
                        color: Colors.black87.withOpacity(0.7),
                        fontSize: 14,
                        //letterSpacing: 0.3,
                      ),
                    ),
                    SizedBox(height: mQ.height * 0.04),
                    SizedBox(
                      width: mQ.width,
                      height: mQ.height * 0.065,
                      child: CustomElevatedButton(
                        onPressed: () {
                          Get.to(LoginScreen());
                          //Get.back();
                          // Get.toNamed(AppRoutes.emailLogin);
                        },
                        text: 'Continue with email'.tr,
                        textColor: Colors.grey[600],
                        iconData: FontAwesomeIcons.solidEnvelope,
                        iconColor: kPrimary,
                        borderColor: Colors.grey.withOpacity(0.2),
                      ),
                    ),
                    SizedBox(height: mQ.height * 0.02),
                    SizedBox(
                      width: mQ.width,
                      height: mQ.height * 0.065,
                      child: CustomElevatedButton(
                        onPressed: () {
                          // Get.back();
                        },
                        text: 'Continue with phone'.tr,
                        textColor: Colors.grey[600],
                        iconData: FontAwesomeIcons.mobileButton,
                        iconColor: kPrimary,
                        backgroundColor: Theme.of(context).primaryColor,
                        borderColor: Colors.grey.withOpacity(0.2),
                      ),
                    ),
                    SizedBox(height: mQ.height * 0.04),
                    AuthSocialButtons(
                      onApplePressed: () {},
                      onGooglePressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
