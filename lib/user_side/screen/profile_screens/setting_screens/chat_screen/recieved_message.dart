import 'dart:math' as math; // import this

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:suvastufood/user_side/screen/profile_screens/setting_screens/chat_screen/custom_shape.dart';

class ReceivedMessageScreen extends StatelessWidget {
  final String message;
  ReceivedMessageScreen({
    Key? key,
    required this.message,
  }) : super(key: key);
  final appData = GetStorage();

  @override
  Widget build(BuildContext context) {
    final messageTextGroup = Flexible(
        child: Row(
      mainAxisAlignment: appData.read('language') == 'ur'
          ? MainAxisAlignment.start
          : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationY(math.pi),
          child: CustomPaint(
            painter: CustomShape(Colors.grey[300]!),
          ),
        ),
        Flexible(
          child: Container(
            padding: EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.only(
                topLeft: appData.read('language') == 'ur'
                    ? Radius.circular(18)
                    : Radius.zero,
                topRight: appData.read('language') == 'ur'
                    ? Radius.zero
                    : Radius.circular(18),
                bottomLeft: Radius.circular(18),
                bottomRight: Radius.circular(18),
              ),
            ),
            child: Text(
              message,
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),
          ),
        ),
      ],
    ));

    return Padding(
      padding: EdgeInsets.only(
          right: appData.read('language') == 'ur' ? 16 : 50.0,
          left: appData.read('language') == 'ur' ? 50 : 16.0,
          top: 5,
          bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          SizedBox(height: 30),
          messageTextGroup,
        ],
      ),
    );
  }
}
