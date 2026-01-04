import 'package:adai/feature/login/data/models/role_type.dart';
import 'package:adai/feature/login/presentation/view/widgets/role_selection/role_card_widget.dart';
import 'package:adai/feature/login/presentation/view/widgets/role_selection/role_selection_header_widget.dart';
import 'package:flutter/material.dart';

/// Widget رئيسي لاختيار الدور (لاعب/مدرب)
class RoleSelectionWidget extends StatelessWidget {
  final RoleType? selectedRole;
  final ValueChanged<RoleType> onRoleSelected;

  const RoleSelectionWidget({
    super.key,
    required this.selectedRole,
    required this.onRoleSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const RoleSelectionHeaderWidget(),
        const SizedBox(height: 32),
        // بطاقات الأدوار
        Row(
          children: [
            // بطاقة اللاعب
            Expanded(
              child: RoleCardWidget(
                roleType: RoleType.player,
                isSelected: selectedRole == RoleType.player,
                onTap: () => onRoleSelected(RoleType.player),
                icon: Icons.sports_soccer,
              ),
            ),
            const SizedBox(width: 16),
            // بطاقة المدرب
            Expanded(
              child: RoleCardWidget(
                roleType: RoleType.coach,
                isSelected: selectedRole == RoleType.coach,
                onTap: () => onRoleSelected(RoleType.coach),
                icon: Icons.sports,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
