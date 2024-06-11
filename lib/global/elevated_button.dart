import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final Color? iconColor;
  final Function onPressed;
  final IconData? iconData; // New parameter for icon

  const CustomElevatedButton({
    Key? key,
    required this.text,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
    required this.onPressed,
    this.iconData,
    this.iconColor, // Include icon parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ElevatedButton(
        onPressed: () => onPressed(),
        style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(0.0), // Apply elevation

          //backgroundColor: MaterialStateProperty.all<Color>(backgroundColor!),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(color: borderColor!, width: 1),
            ),
          ),
        ),
        child: Row(
          children: [
            Expanded(
                flex: 3,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(
                    iconData,
                    color: iconColor ??
                        Theme.of(context).textTheme.bodySmall!.color!,
                  ),
                )), // Add icon here

            Expanded(
              flex: 7,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  text,
                  style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
