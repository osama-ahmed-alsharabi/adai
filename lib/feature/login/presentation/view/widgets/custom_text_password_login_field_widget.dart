import 'package:flutter/material.dart';

/// حقل إدخال كلمة المرور المخصص
class CustomTextPasswordLoginFieldWidget extends StatefulWidget {
  final String label;
  final String hintText;
  final TextEditingController? controller;
  final String? errorText;
  final void Function(String)? onChanged;

  const CustomTextPasswordLoginFieldWidget({
    super.key,
    required this.label,
    required this.hintText,
    this.controller,
    this.errorText,
    this.onChanged,
  });

  @override
  State<CustomTextPasswordLoginFieldWidget> createState() =>
      _CustomTextPasswordLoginFieldWidgetState();
}

class _CustomTextPasswordLoginFieldWidgetState
    extends State<CustomTextPasswordLoginFieldWidget> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
          child: Text(
            widget.label,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        TextFormField(
          controller: widget.controller,
          obscureText: !isPasswordVisible,
          onChanged: widget.onChanged,
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
            hintText: widget.hintText,
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 12),
            prefixIcon: const Icon(Icons.lock),
            errorText: widget.errorText,
            errorStyle: const TextStyle(color: Colors.red, fontSize: 11),
            suffixIcon: IconButton(
              icon: Icon(
                isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
                  isPasswordVisible = !isPasswordVisible;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
