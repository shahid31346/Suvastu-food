import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:suvastufood/global/resuable_button.dart';
import 'package:suvastufood/user_side/main_tabs.dart';
import 'package:suvastufood/utils/const.dart';

void showOrderSuccessDialog(BuildContext context) {
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
                  ),
                  SizedBox(height: mQ.height * 0.04),
                  Align(
                    alignment:
                    Alignment.center,
                    child: Text(

                      'Order Placed Successfully',
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
                            'Your order has been successfully placed, Enjoy your meal!',
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
                            'View Order',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                      SizedBox(width: mQ.width * 0.02),
                      Center(
                        child: SizedBox(
                          width: mQ.width * 0.33,
                          height: 50,
                          child: ResuableButton(
                              text: "Home".tr,
                              onPressed: () {
                                Get.offAll(MainTabs());
                              },
                              color: kSecondaryMain),
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