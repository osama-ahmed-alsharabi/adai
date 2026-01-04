import 'package:adai/core/utils/app_color.dart';
import 'package:flutter/material.dart';

/// زر تسجيل الدخول - تصميم هادئ وأنيق
class CustomLoginButtonWidget extends StatefulWidget {
  final void Function()? onPressed;
  final String? text;

  const CustomLoginButtonWidget({super.key, this.onPressed, this.text});

  @override
  State<CustomLoginButtonWidget> createState() =>
      _CustomLoginButtonWidgetState();
}

class _CustomLoginButtonWidgetState extends State<CustomLoginButtonWidget> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final isEnabled = widget.onPressed != null;

    return GestureDetector(
      onTapDown: isEnabled ? (_) => setState(() => _isPressed = true) : null,
      onTapUp: isEnabled ? (_) => setState(() => _isPressed = false) : null,
      onTapCancel: isEnabled ? () => setState(() => _isPressed = false) : null,
      onTap: widget.onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOutCubic,
        height: 54,
        width: double.infinity,
        transform: Matrix4.identity()..scale(_isPressed ? 0.98 : 1.0),
        transformAlignment: Alignment.center,
        decoration: BoxDecoration(
          // لون موحد بدلاً من gradient قوي
          color: isEnabled
              ? AppColor.secondaryColor
              : Colors.white.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(27),
          // ظل خفيف وناعم
          boxShadow: isEnabled
              ? [
                  BoxShadow(
                    color: AppColor.secondaryColor.withValues(alpha: 0.25),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ]
              : [],
        ),
        child: Center(
          child: Text(
            widget.text ?? "تسجيل الدخول",
            style: TextStyle(
              color: isEnabled
                  ? Colors.white
                  : Colors.white.withValues(alpha: 0.5),
              fontSize: 16,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
        ),
      ),
    );
  }
}
