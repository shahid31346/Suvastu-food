import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:suvastufood/utils/const.dart';

errorDialog(BuildContext context, String body, final VoidCallback onPressed,
    {String? buttonText, bool? barrier, Color? iconColor}) {
  return showDialog(
    context: context,
    barrierDismissible: barrier ?? true,
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
                  'assets/cancel_icon.png',
                  // height: 70,
                  // width: 70,
                  fit: BoxFit.fill,
                )),
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // const SizedBox(
            //   height: 11,
            // ),
            Text(
              'Alert',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              body,
              textAlign: TextAlign.center,
              style:
                  const TextStyle(fontSize: 14, color: kBlack54, height: 1.5),
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
