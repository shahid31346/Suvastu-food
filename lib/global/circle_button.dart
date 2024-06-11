import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suvastufood/utils/const.dart';

// A custom circular button widget that resembles a round card-like shape with an icon.

class CircleButton extends RawMaterialButton {
  CircleButton({
    Key? key,
    required VoidCallback
        onPressed, // Callback function when the button is pressed
    required IconData icon, // The icon to display on the button
    double elevation = 1.5, // Elevation of the button (shadow)
    Color color = kWhite, // Background color of the button
    Color iconColor = kBlackColor, // Color of the icon
  }) : super(
          key: key,
          constraints: BoxConstraints.tight(const Size(40, 40)), // Button size
          child: Icon(icon,
              color: iconColor, size: 20), // Icon displayed inside the button
          elevation: elevation, // Shadow elevation of the button
          fillColor: color, // Background color of the button
          splashColor: Theme.of(Get.context!)
              .primaryColor
              .withOpacity(0.2), // Splash color when pressed
          highlightColor: Theme.of(Get.context!)
              .primaryColor
              .withOpacity(0.2), // Highlight color when pressed
          highlightElevation: 2, // Elevation when button is highlighted
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50)), // Circular shape
          onPressed:
              onPressed, // Function to execute when the button is pressed
        );
}
