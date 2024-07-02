import 'dart:ui';

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
import 'package:suvastufood/user_side/screen/auth_screens/register_screen.dart';
import 'package:suvastufood/utils/const.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {

  LoginUserController loginUserController = Get.put(LoginUserController());
  final appData = GetStorage();

  @override
  Widget build(BuildContext context) {
    final mQ = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kBgColor,
      appBar: AppBar(
        backgroundColor: kBgColor,
        centerTitle: true,
        title: Text(
          'Edit Profile'.tr,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            // key: loginController.formKey,
            child: AutofillGroup(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: mQ.height * 0.04),
                       Stack(
                         clipBehavior: Clip.none,
                           children: [
                           Container(
                             height: mQ.height * 0.12,
                             width: mQ.width * 0.3,
                             decoration: BoxDecoration(
                               shape: BoxShape.circle,
                                image: DecorationImage(image: AssetImage('assets/food2.png', ), fit: BoxFit.fill,

                            )
                             ),
                            

                           ),
                             Positioned(
                               bottom: 0,
                               right: 10,
                               child: ClipRRect(
                                 borderRadius: BorderRadius.circular(300),
                                 child: BackdropFilter(
                                   filter: ImageFilter.blur(
                                     sigmaX: 5.0,
                                     sigmaY: 5.0,
                                   ),
                                   child: Container(

                                     decoration: BoxDecoration(
                                       shape: BoxShape.circle
                                     ),
                                     child:  Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: Icon(
                                       Icons.add,
                                       color: kWhite,
                                       size: 30,
                                     ),
                                   ),
                                 ),)
                               ), ),
                         ],
                       ),

                    SizedBox(height: mQ.height * 0.04),
                    AuthTextField(
                      prefixIcon: Icons.email_outlined,
                      controller: loginUserController.emailController,
                      inputType: TextInputType.name,
                      hintText: 'Full name'.tr,
                      validators: (String? value) {
                        if (value!.isEmpty) {
                          return 'Full name required'.tr;
                        }
                        return null;
                      },
                      autofillHints: const [AutofillHints.email],
                    ),
                    SizedBox(height: mQ.height * 0.02),


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
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey
                                  .withOpacity(0.2), // Shadow color
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
                          // registerUserController
                          //     .phoneNumberController.text = phone.number;
                          // registerUserController.countryCode =
                          //     phone.countryCode;
                        },
                        // controller:
                        // registerUserController.phoneNumberController,
                        validator: (PhoneNumber? value) async {
                          if (value!.number.isEmpty) {
                            return 'Phone number required'.tr;
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: mQ.height * 0.1,),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        width: mQ.width * 0.85,
                        height: 50,
                        child: ResuableButton(
                            text: "Update".tr,
                            onPressed: () {
                            },
                            color: kSecondaryMain),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


