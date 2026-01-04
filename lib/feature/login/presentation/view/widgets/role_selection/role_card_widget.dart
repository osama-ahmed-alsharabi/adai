import 'package:adai/feature/login/data/models/role_type.dart';
import 'package:flutter/material.dart';

/// بطاقة اختيار الدور (لاعب/مدرب) - تصميم هادئ وأنيق
class RoleCardWidget extends StatelessWidget {
  final RoleType roleType;
  final bool isSelected;
  final VoidCallback onTap;
  final IconData icon;

  const RoleCardWidget({
    super.key,
    required this.roleType,
    required this.isSelected,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOutCubic,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        decoration: BoxDecoration(
          // خلفية ناعمة شبه شفافة
          color: isSelected
              ? Colors.white.withValues(alpha: 0.150)
              : Colors.white.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected
                ? Colors.white.withValues(alpha: 0.4)
                : Colors.white.withValues(alpha: 0.15),
            width: 1.5,
          ),
          // ظل خفيف وناعم
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.08),
                    blurRadius: 15,
                    offset: const Offset(0, 6),
                  ),
                ]
              : [],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // الأيقونة
            _buildIconContainer(),
            const SizedBox(height: 10),
            // اسم الدور
            _buildRoleName(),
            const SizedBox(height: 4),
            // الوصف
            _buildDescription(),
          ],
        ),
      ),
    );
  }

  Widget _buildIconContainer() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeOutCubic,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected
            ? Colors.white.withValues(alpha: 0.2)
            : Colors.white.withValues(alpha: 0.1),
        border: Border.all(
          color: isSelected
              ? Colors.white.withValues(alpha: 0.3)
              : Colors.transparent,
          width: 1.5,
        ),
      ),
      child: AnimatedScale(
        scale: isSelected ? 1.1 : 1.0,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOutCubic,
        child: Icon(
          icon,
          size: 26,
          color: isSelected
              ? Colors.white
              : Colors.white.withValues(alpha: 0.6),
        ),
      ),
    );
  }

  Widget _buildRoleName() {
    return AnimatedDefaultTextStyle(
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeOutCubic,
      style: TextStyle(
        fontSize: isSelected ? 16 : 15,
        fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
        color: isSelected ? Colors.white : Colors.white.withValues(alpha: 0.75),
        letterSpacing: 0.3,
      ),
      child: Text(roleType.arabicName),
    );
  }

  Widget _buildDescription() {
    return AnimatedOpacity(
      opacity: isSelected ? 0.9 : 0.6,
      duration: const Duration(milliseconds: 350),
      child: Text(
        roleType.description,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 11,
          color: Colors.white.withValues(alpha: 0.7),
          height: 1.3,
        ),
      ),
    );
  }
}
