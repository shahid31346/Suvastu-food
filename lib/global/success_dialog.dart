import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suvastufood/utils/const.dart';

successDialog(
  BuildContext context,
  VoidCallback? onPressed,
  String body, {
  bool? dismissOnBgClick,
  String? buttonText,
}) {
  return showDialog(
    context: context,
    barrierDismissible: dismissOnBgClick ?? true,
    builder: (BuildContext context) {
      final mQ = MediaQuery.of(context).size;

      return AlertDialog(
        backgroundColor: kWhite,
        surfaceTintColor: kWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Set the border radius here
        ),
        title: Center(
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/success_icon.png',
                  height: 70,
                  width: 70,
                  fit: BoxFit.fill,
                )),
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Successful'.tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  color: kBlackColor,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              body,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, color: kBlack54),
            ),
          ],
        ),
        actions: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                  child: Text(
                    buttonText ?? "Okay".tr,
                    style: TextStyle(color: kthirdColor),
                  ),
                  onPressed: onPressed),
            ],
          ),
        ],
      );
    },
  );
}
