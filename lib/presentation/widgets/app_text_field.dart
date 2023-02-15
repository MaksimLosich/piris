import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final int maxLength;
  final TextInputType? textInputType;

  const AppTextField({
    required this.controller,
    required this.hint,
    this.maxLength = 64,
    this.textInputType,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 6,
        horizontal: 16,
      ),
      margin: const EdgeInsets.symmetric(
        vertical: 12,
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextField(
        keyboardType: textInputType,
        maxLength: maxLength,
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
        ),
      ),
    );
  }
}
