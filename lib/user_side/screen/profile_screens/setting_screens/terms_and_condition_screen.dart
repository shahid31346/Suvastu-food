import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:suvastufood/utils/const.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      appBar: AppBar(
        backgroundColor: kBgColor,
        centerTitle: true,
        title: Text(
          'Terms & Condition'.tr,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        ),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Text(
          '''Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,Lorem Ipsum has been  Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,Lorem Ipsum has been  Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, ''',

          style: TextStyle(fontSize: 14.0, color: kGrey),
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
                  // Handle language selection
                },
                label: Text('English', style: TextStyle(color: kDangerColor)),
                  icon: Icon(Icons.keyboard_arrow_down, color: kDangerColor,),
                iconAlignment: IconAlignment.end,
              
              ),
              Spacer(),
              TextButton.icon(
                onPressed: () {
                  // Handle language selection
                },
                label: Text('Share', style: TextStyle(color: kDangerColor)),
                icon: Icon(Icons.share, color: kDangerColor,),
                iconAlignment: IconAlignment.end,

              ),
            ],
          ),
        ),
      ),
    );
  }
}