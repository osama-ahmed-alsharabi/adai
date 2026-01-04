import 'package:flutter/material.dart';

/// عنوان قسم اختيار الدور - تصميم هادئ
class RoleSelectionHeaderWidget extends StatelessWidget {
  const RoleSelectionHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // العنوان الرئيسي
        const Text(
          'اختر نوع حسابك',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 8),
        // العنوان الفرعي
        Text(
          'حدد دورك للمتابعة',
          style: TextStyle(
            fontSize: 14,
            color: Colors.white.withValues(alpha: 0.65),
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
