import 'package:adai/core/utils/app_color.dart';
import 'package:flutter/material.dart';

/// زر تسجيل الدخول - تصميم هادئ وأنيق مع دعم حالة التحميل
class CustomLoginButtonWidget extends StatefulWidget {
  final void Function()? onPressed;
  final String? text;
  final bool isLoading;

  const CustomLoginButtonWidget({
    super.key,
    this.onPressed,
    this.text,
    this.isLoading = false,
  });

  @override
  State<CustomLoginButtonWidget> createState() =>
      _CustomLoginButtonWidgetState();
}

class _CustomLoginButtonWidgetState extends State<CustomLoginButtonWidget> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final isEnabled = widget.onPressed != null && !widget.isLoading;

    return GestureDetector(
      onTapDown: isEnabled ? (_) => setState(() => _isPressed = true) : null,
      onTapUp: isEnabled ? (_) => setState(() => _isPressed = false) : null,
      onTapCancel: isEnabled ? () => setState(() => _isPressed = false) : null,
      onTap: isEnabled ? widget.onPressed : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOutCubic,
        height: 54,
        width: double.infinity,
        transform: Matrix4.identity()..scale(_isPressed ? 0.98 : 1.0),
        transformAlignment: Alignment.center,
        decoration: BoxDecoration(
          color: isEnabled
              ? AppColor.secondaryColor
              : Colors.white.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(27),
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
          child: widget.isLoading
              ? const SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2.5,
                  ),
                )
              : Text(
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
