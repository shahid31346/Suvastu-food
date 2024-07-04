import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:suvastufood/global/circle_button.dart';
import 'package:suvastufood/user_side/screen/auth_screens/get_started_screen.dart';
import 'package:suvastufood/utils/const.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  final changePasswordFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final mQ = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kBgColor,
      appBar: AppBar(
        backgroundColor: kBgColor,
        centerTitle: true,
        title: Text(
          'Privacy policy'.tr,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                child: Text(
                  '''Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,Lorem Ipsum has been  Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,Lorem Ipsum has been  Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, ''',
                  style: TextStyle(color: kGrey, fontSize: 16),
                ),
              ),
              SizedBox(
                height: mQ.height * 0.04,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: kBgColor,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            children: [
              TextButton.icon(
                onPressed: () {
                  changeLanguageBottomSheet(context);
                },
                label: Text('English', style: TextStyle(color: kDangerColor)),
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  color: kDangerColor,
                ),
                iconAlignment: IconAlignment.end,
              ),
              Spacer(),
              TextButton.icon(
                onPressed: () {
                  // Handle language selection
                },
                label: Text('Share', style: TextStyle(color: kDangerColor)),
                icon: Icon(
                  Icons.share,
                  color: kDangerColor,
                ),
                iconAlignment: IconAlignment.end,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
