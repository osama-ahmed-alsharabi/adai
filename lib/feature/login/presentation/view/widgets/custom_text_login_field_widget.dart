import 'package:flutter/material.dart';

/// حقل إدخال مخصص لنموذج تسجيل الدخول
class CustomTextLoginFieldWidget extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController? controller;
  final String? errorText;
  final TextInputType keyboardType;
  final void Function(String)? onChanged;

  const CustomTextLoginFieldWidget({
    super.key,
    required this.label,
    required this.hintText,
    this.controller,
    this.errorText,
    this.keyboardType = TextInputType.text,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
          child: Text(label, style: const TextStyle(color: Colors.white)),
        ),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          onChanged: onChanged,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: const BorderSide(color: Colors.red, width: 2),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: const BorderSide(color: Colors.red, width: 2),
            ),
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 12),
            prefixIcon: const Icon(Icons.email),
            errorText: errorText,
            errorStyle: const TextStyle(color: Colors.red, fontSize: 11),
          ),
        ),
      ],
    );
  }
}
