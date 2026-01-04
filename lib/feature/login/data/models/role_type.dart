/// نوع الدور في التطبيق
enum RoleType { player, coach }

/// Extension لإضافة خصائص للـ RoleType
extension RoleTypeExtension on RoleType {
  String get arabicName {
    switch (this) {
      case RoleType.player:
        return 'لاعب';
      case RoleType.coach:
        return 'مدرب';
    }
  }

  String get description {
    switch (this) {
      case RoleType.player:
        return 'سجل كلاعب وتابع تطورك';
      case RoleType.coach:
        return 'سجل كمدرب وأدر فريقك';
    }
  }
}
