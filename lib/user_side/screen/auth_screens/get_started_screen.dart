import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:suvastufood/global/auth_social_buttons.dart';
import 'package:suvastufood/global/elevated_button.dart';
import 'package:suvastufood/user_side/controller/auth_controller/logout_contoller.dart';
import 'package:suvastufood/user_side/controller/change_language_controller/change_language_controller.dart';
import 'package:suvastufood/user_side/screen/auth_screens/login_screen.dart';
import 'package:suvastufood/utils/const.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  bool _switchValue = false;

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
              height: mQ.height * 0.04,
            ),
            Container(
              height: mQ.height * 0.44,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(26.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: InkWell(
                        onTap: () {
                          _changeLanguageBottomSheet(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withOpacity(0.4),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.language, color: kPrimary),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
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
                      "Signup or Login".tr,
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
                      "Select your preferred method to Continue".tr,
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

///////////
//////////
//////////CHANGE LANGUAGE BOTTOM SHEET
void _changeLanguageBottomSheet(BuildContext context) {
  ChangeLanguageController changeLanguageController =
      Get.put(ChangeLanguageController());
  final appData = GetStorage();

  showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext context) => CupertinoActionSheet(
      title: Text(
        'Change Language',
        style: const TextStyle(fontSize: 20),
      ),
      message: Text('Select the language you want to change'),
      actions: <CupertinoActionSheetAction>[
        CupertinoActionSheetAction(
          isDefaultAction: true,
          onPressed: () {
            changeLanguageController.changeLanguage('en');

            Navigator.pop(context); // Close the action sheet
          },
          child: Text(
            'English',
            style: TextStyle(color: kPrimary),
          ),
        ),
        CupertinoActionSheetAction(
          isDestructiveAction: true,
          onPressed: () {
            changeLanguageController.changeLanguage('ur');
            Navigator.pop(context); // Close the action sheet
          },
          child: Text(
            'Urdu',
            style: TextStyle(color: Colors.black87),
          ),
        ),
      ],
      cancelButton: TextButton(
        child: Text(
          'cancel',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        onPressed: () {
          Get.back();
        },
      ),
    ),
  );
}
