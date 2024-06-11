import 'package:flutter/material.dart';
import 'package:suvastufood/utils/const.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.autofillHints, // Include the autofillHints parameter

    this.validators,
    required this.prefixIcon,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final Function(String)? validators;
  final IconData prefixIcon;
  final List<String>? autofillHints; // New parameter for autofillHints

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool isFocused = false;
  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(10), boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          blurRadius: 14,
          spreadRadius: 3,
          offset: Offset(0, 4),
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
            fontSize: 12,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.3,
          ),
          decoration: InputDecoration(
            prefixIcon: Icon(widget.prefixIcon),
            filled: true,
            fillColor: Colors.white,
            isDense: true,
            hintStyle: TextStyle(
              color: Colors.grey[400]!,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
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
            suffixIcon: InkWell(
              onTap: () {
                setState(() {
                  passwordVisible = !passwordVisible;
                });
              },
              child: Icon(
                passwordVisible
                    ? Icons.visibility_off
                    : Icons.visibility, // Change the icon based on visibility
                color: Colors.grey,
              ),
            ),
          ),
          obscureText: !passwordVisible,
          validator: widget.validators as String? Function(String?)?,
          autofillHints: widget.autofillHints,
        ),
      ),
    );
  }
}
