import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:suvastufood/user_side/screen/dialogs/account_delete_dialog.dart';
import 'package:suvastufood/user_side/screen/profile_screens/setting_screens/privacy_policy_screen.dart';
import 'package:suvastufood/user_side/screen/profile_screens/setting_screens/terms_and_condition_screen.dart';
import 'package:suvastufood/utils/const.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    final mQ = MediaQuery.of(context).size;
    
    return  Scaffold(
      backgroundColor: kBgColor,
      appBar: AppBar(
        backgroundColor: kBgColor,
        centerTitle: true,
        title: Text(
          'Setting'.tr,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            children: [
              ListTileWidget(context, text: 'Language', onListPressed: (){}),
              ListTileWidget(context, text: 'Term & Conditions', onListPressed: (){Get.to(TermsAndConditionsScreen());}),
              ListTileWidget(context, text: 'Privacy Policy', onListPressed: (){Get.to(PrivacyPolicyScreen());}),
              ListTileWidget(context, text: 'Rate Us', onListPressed: (){}),
              ListTileWidget(context, text: 'Share App', onListPressed: (){}),
              ListTileWidget(context, text: 'About', onListPressed: (){}),
              Row(
                children: [
                  Expanded(

                    child: InkWell(
                      onTap: (){
                        accountDeleteDialog(context);
                      },
                      child: Text(

                        "Delete Account".tr,
                        style: TextStyle(
                            height: 2.5,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600,
                            color: kDangerColor
                        ),
                      ),
                    ),)
                ],
              ),




            ],
          )
        ),
      ),
    );
  }
  Widget ListTileWidget(BuildContext context, {required String text, VoidCallback? onListPressed}) {
    final mQ = MediaQuery.of(context).size;
    return
      Column(
        children: [
          Row(
            children: [
              Expanded(

                child: InkWell(
                  onTap: onListPressed,
                  child: Text(

                    text.tr,
                    style: TextStyle(
                        height: 2.5,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                        color: kBlackColor
                    ),
                  ),
                ),)
            ],
          ),
          SizedBox(height: mQ.height * 0.005,),
          Divider(color: kGrey.withOpacity(0.2),)
        ],
      );


  }
}
