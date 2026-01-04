import 'package:flutter/material.dart';

class CustomTextLoginFieldWidget extends StatelessWidget {
  final String label;
  final String hintText;
  const CustomTextLoginFieldWidget({
    super.key,
    required this.label,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
          child: Text(label, style: TextStyle(color: Colors.white)),
        ),
        TextFormField(
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
            prefixIcon: Icon(Icons.email),
          ),
        ),
      ],
    );
  }
}
