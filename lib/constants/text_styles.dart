// Text Styles
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ropay_app/constants/colors.dart';

 const TextStyle titleStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w600,
  color: black,
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
    contentPadding: const EdgeInsets.symmetric(vertical: 12,horizontal: 16),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.black, width: 1)),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: primaryBlue, width: 1),
      borderRadius: BorderRadius.circular(12),
    ),
    errorText: errorText?.isEmpty ?? true ? null : errorText,
    filled: true,
    fillColor: white,
  );
}
