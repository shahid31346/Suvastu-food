import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:suvastufood/utils/const.dart';

class AuthSocialButtons extends StatelessWidget {
  VoidCallback onGooglePressed, onApplePressed;

  AuthSocialButtons(
      {super.key, required this.onApplePressed, required this.onGooglePressed});

  @override
  Widget build(BuildContext context) {
    final mQ = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Container(
                height: 1.0, // Height of the vertical line
                color: Colors.grey[300], // Color of the vertical line
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                "or",
                style: TextStyle(fontSize: 13.5, color: Colors.black54),
              ),
            ),
            Expanded(
              child: Container(
                height: 1.0, // Height of the horizontal line
                color: Colors.grey[300], // Color of the horizontal line
              ),
            ),
            const SizedBox(
              width: 16,
            ),
          ],
        ),
        SizedBox(
          height: mQ.height * 0.02,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.7), // Shadow color
                    spreadRadius: 3, // Spread radius
                    blurRadius: 7, // Blur radius
                    offset: const Offset(0, 3), // Offset in x and y direction
                  ),
                ],
              ),
              child: CircleAvatar(
                radius: 26, // Radius of the circular button.
                foregroundColor: kWhite, // Color of the button's foreground.
                backgroundColor: Color.fromARGB(
                    255, 226, 59, 59), // Background color of the button.
                child: IconButton(
                  onPressed:
                      onApplePressed, // Callback function when the button is pressed.
                  icon: Icon(
                      FontAwesomeIcons.google), // Icon displayed on the button.
                ),
              ),
            ),
            SizedBox(
              width: mQ.width * 0.1,
            ),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.7), // Shadow color
                    spreadRadius: 3, // Spread radius
                    blurRadius: 7, // Blur radius
                    offset: const Offset(0, 3), // Offset in x and y direction
                  ),
                ],
              ),
              child: CircleAvatar(
                radius: 26, // Radius of the circular button.
                foregroundColor: kWhite, // Color of the button's foreground.
                backgroundColor:
                    Colors.black, // Background color of the button.
                child: IconButton(
                  onPressed:
                      onApplePressed, // Callback function when the button is pressed.
                  icon: Icon(Icons.apple), // Icon displayed on the button.
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
