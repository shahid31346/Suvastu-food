import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:suvastufood/utils/const.dart';

// A custom dialog utility class for showing and hiding dialogs with loading indicators.

class CustomDialog {
  // Show a dialog with a loading indicator and message.
  show(String message, {bool? dismissOnBgClick}) {
    SmartDialog.show(
      debounceTemp: true,
      clickBgDismissTemp: dismissOnBgClick ??
          true, // Dismiss on background click (default: true)
      maskColorTemp: kBlackColor.withOpacity(0.8), // Background mask color
      widget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            strokeWidth: 2.5, // Thickness of the progress indicator
            color:
                kPrimary, // Color of the progress indicator based on the theme
          ),
          const SizedBox(
              height: 10), // Spacing between the progress indicator and message
          Text(
            message.tr, // Message displayed below the progress indicator
            style: kWhite16.copyWith(
              fontSize: 16, // Font size of the message
            ),
          ),
        ],
      ),
    );
  }

  // Hide the currently displayed dialog.
  hide() {
    SmartDialog.dismiss(); // Dismiss any currently displayed dialog
  }
}
