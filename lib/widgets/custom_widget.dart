import 'package:flutter/material.dart';
import 'package:ropay_app/constants/colors.dart';
import 'package:ropay_app/constants/text_styles.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? errorText;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    this.obscureText,
    this.errorText,
    this.keyboardType,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: customInputDecoration(label, errorText),
      keyboardType: keyboardType,
      onChanged: onChanged,
    );
  }
}

class CustomButton extends StatelessWidget {
  final bool isLoading;
  final bool isEnabled;
  final VoidCallback onPressed;
  final String text;

  const CustomButton({
    super.key,
    required this.isLoading,
    required this.isEnabled,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isEnabled && !isLoading ? onPressed : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryBlue,
        foregroundColor: white,
        padding: const EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 2,
      ),
      child: isLoading
          ? const CircularProgressIndicator(color: white)
          : Text(
              text,
              style: buttonTextStyle,
            ),
    );
  }
}