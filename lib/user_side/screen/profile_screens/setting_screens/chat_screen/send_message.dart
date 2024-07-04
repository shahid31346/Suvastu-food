import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:suvastufood/user_side/screen/profile_screens/setting_screens/chat_screen/custom_shape.dart';

class SentMessageScreen extends StatelessWidget {
  final String message;
  SentMessageScreen({
    Key? key,
    required this.message,
  }) : super(key: key);
  final appData = GetStorage();
  @override
  Widget build(BuildContext context) {
    final messageTextGroup = Flexible(
        child: Row(
      mainAxisAlignment: appData.read('language') == 'ur'
          ? MainAxisAlignment.end
          : MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.cyan[900],
              borderRadius: BorderRadius.only(
                topLeft: appData.read('language') == 'ur'
                    ? Radius.zero
                    : Radius.circular(18),
                topRight: appData.read('language') == 'ur'
                    ? Radius.circular(18)
                    : Radius.zero,
                bottomLeft: Radius.circular(18),
                bottomRight: Radius.circular(18),
              ),
            ),
            child: Text(
              message,
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
        ),
        CustomPaint(painter: CustomShape(Colors.cyan[900]!)),
      ],
    ));

    return Padding(
      padding: EdgeInsets.only(
          right: appData.read('language') == 'ur' ? 50 : 16.0,
          left: appData.read('language') == 'ur' ? 16 : 50.0,
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
