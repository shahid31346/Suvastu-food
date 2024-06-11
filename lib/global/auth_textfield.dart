import 'package:flutter/material.dart';
import 'package:suvastufood/utils/const.dart';

class AuthTextField extends StatefulWidget {
  const AuthTextField({
    Key? key,
    required this.controller,
    required this.inputType,
    required this.hintText,
    this.validators,
    required this.prefixIcon,
    this.autofillHints, // Include the autofillHints parameter
  }) : super(key: key);

  final TextEditingController controller;
  final TextInputType inputType;
  final String hintText;
  final IconData prefixIcon;
  final List<String>? autofillHints;

  final Function(String)? validators;

  @override
  _AuthTextFieldState createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  bool isFocused = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(10), boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2), // Shadow color
          blurRadius: 14,
          spreadRadius: 3,
          offset: Offset(0, 4), // Bottom and right-side shadow
        ),
      ]),
      child: Focus(
        onFocusChange: (hasFocus) {
          setState(() {
            isFocused = hasFocus;
          });
        },
        child: TextFormField(
          controller: widget.controller,
          style: TextStyle(
              fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.3),
          decoration: InputDecoration(
            filled: true,
            prefixIcon: Icon(widget.prefixIcon),
            fillColor: kWhite,
            isDense: true,
            hintStyle: TextStyle(
                color: Colors.grey[400]!,
                fontSize: 12,
                fontWeight: FontWeight.w400),
            hintText: widget.hintText,
            border: const OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[300]!, width: 0.5),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kPrimary, width: 0.5),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          validator: widget.validators as String? Function(String?)?,
          autofillHints: widget.autofillHints,
        ),
      ),
    );
  }
}
