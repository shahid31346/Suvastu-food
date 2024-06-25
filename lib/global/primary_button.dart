import 'package:flutter/material.dart';
import 'package:suvastufood/utils/const.dart';

// A custom primary button widget with various customizable properties.

class PrimaryButton extends MaterialButton {
  PrimaryButton({
    Key? key,
    required VoidCallback?
        onPressed, // Callback function when the button is pressed
    required String label, // Text label displayed on the button
    Widget? icon, // Optional icon widget to display alongside the label
    bool isPrimary =
        true, // Flag indicating whether the button is primary or secondary
    Color? bgColor, // Background color of the button
    double? elevation, // Elevation (shadow) of the button
    TextStyle? labelStyle, // Text style for the label
    BorderRadius? borderRadius, // Border radius for the button's shape
  }) : super(
          key: key,
          onPressed: onPressed,
          shape: RoundedRectangleBorder(
              borderRadius: borderRadius ??
                  kBorderRadius), // Button's shape with optional border radius
          elevation: elevation ?? 0, // Shadow elevation
          height: 60, // Button height
          highlightElevation: 0,
          disabledColor: kSecondaryBtn, // Color when the button is disabled
          highlightColor: Colors.transparent, // Highlight color
          color: bgColor ??
              (isPrimary
                  ? kPrimary
                  : kWhite), // Background color based on isPrimary flag
          textColor: isPrimary
              ? kWhite
              : kBlackColor, // Text color based on isPrimary flag
          animationDuration:
              const Duration(milliseconds: 300), // Animation duration
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label, // Display the provided label text
                style: labelStyle, // Apply the provided label style
              ),
              const SizedBox(width: 6.0), // Spacing between label and icon
              icon ?? const SizedBox(), // Display the optional icon
            ],
          ),
        );
}
