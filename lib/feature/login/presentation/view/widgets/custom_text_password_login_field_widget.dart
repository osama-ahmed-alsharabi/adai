import 'package:flutter/material.dart';

class CustomTextPasswordLoginFieldWidget extends StatefulWidget {
  final String label;
  final String hintText;
  const CustomTextPasswordLoginFieldWidget({
    super.key,
    required this.label,
    required this.hintText,
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
          child: Text( widget.label, style: TextStyle(color: Colors.white)),
        ),
        TextFormField(
          
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
            hintText: widget.hintText,
            hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
            prefixIcon: Icon(Icons.lock),
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
