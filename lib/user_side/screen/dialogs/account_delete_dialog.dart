import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:iconsax/iconsax.dart';
import 'package:suvastufood/global/resuable_button.dart';
import 'package:suvastufood/utils/const.dart';

void accountDeleteDialog(BuildContext context) {

    final mQ = MediaQuery.of(context).size;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),

                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: mQ.height * 0.025),
                    Align(
                      alignment:
                      Alignment.center,
                      child: Container(
                        decoration: BoxDecoration(
                            color: kDangerColor.withOpacity(0.1),

                            shape: BoxShape.circle

                        ),
                        child: Padding(
                          padding:  EdgeInsets.all(26.0),
                          child: Icon(
                            CupertinoIcons.delete,
                            color: kDangerColor,
                            size: 60,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: mQ.height * 0.04),
                    Align(
                      alignment:
                      Alignment.center,
                      child: Text(

                        'Attention',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: mQ.height * 0.01),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Are you sure you want to delete your account',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w500, color: kBlack54),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: mQ.height * 0.05),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        Center(
                          child: SizedBox(
                            width: mQ.width * 0.33,
                            height: 50,
                            child: ResuableButton(
                                text: "Yes".tr,
                                onPressed: () {

                                },
                                color: kSecondaryMain),
                          ),
                        ),

                        SizedBox(width: mQ.width * 0.02),
                        SizedBox(
                          width: mQ.width * 0.33,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              side: BorderSide(color: Colors.red),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              'No',
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ),

                      ],
                    ),
                    SizedBox(height: mQ.height * 0.028),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }