import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:suvastufood/global/resuable_button.dart';
import 'package:suvastufood/utils/const.dart';

void showCancelOrderDialog(BuildContext context) {
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment:
                    Alignment.center,
                    child: Container(
                      decoration: BoxDecoration(
                          color: kPrimary.withOpacity(0.1),

                          shape: BoxShape.circle

                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.info,
                          color: kPrimary,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: mQ.height * 0.02),
                  Align(
                    alignment:
                    Alignment.center,
                    child: Text(

                      'Are You Sure You Want To\nCancel Your Order ?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                      'Reason of cancellation',

                      style: kTextFieldTitle
                  ),
                  SizedBox(height: mQ.height* 0.005,),
                  TextFormField(
                    maxLines: 3,
                    style: TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.3),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.transparent,
                      isDense: true,
                      hintStyle: TextStyle(
                          color: Colors.grey[400]!,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                      hintText: 'Type here...',
                      border: const OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[200]!, width: 0.5),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kPrimary, width: 0.5),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      Center(
                        child: SizedBox(
                          width: mQ.width * 0.35,
                          height: 50,
                          child: ResuableButton(
                              text: "Yes".tr,
                              onPressed: () {},
                              color: kSecondaryMain),
                        ),
                      ),
                      SizedBox(
                        width: mQ.width * 0.35,
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
                  SizedBox(height: mQ.height * 0.01),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}