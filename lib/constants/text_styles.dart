// Text Styles
import 'package:flutter/material.dart';
import 'package:ropay_app/constants/colors.dart';

const TextStyle titleStyle = TextStyle(
  fontSize: 32,
  fontWeight: FontWeight.bold,
  color: primaryBlue,
);

const TextStyle buttonTextStyle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w600,
  color: white,
);

const TextStyle loginPromptStyle = TextStyle(
  fontSize: 14,
  color: accentBlue,
);

const TextStyle labelStyle = TextStyle(
  fontSize: 14,
  color: black,
);

// Input Decoration
InputDecoration customInputDecoration(String label, String? errorText) {
  return InputDecoration(
    labelText: label,
    labelStyle: labelStyle,
    contentPadding: EdgeInsets.all(16),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.black, width: 1)),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: primaryBlue, width: 1),
      borderRadius: BorderRadius.circular(12),
    ),
    errorText: errorText?.isEmpty ?? true ? null : errorText,
    filled: true,
    fillColor: white,
  );
}
