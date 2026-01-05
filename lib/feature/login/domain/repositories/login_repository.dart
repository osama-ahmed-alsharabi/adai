import 'package:adai/feature/login/domain/entities/login_entity.dart';

/// واجهة المستودع - تحدد عمليات تسجيل الدخول
abstract class LoginRepository {
  /// تسجيل الدخول بالإيميل وكلمة المرور
  Future<LoginEntity> login({required String email, required String password});

  /// تسجيل الخروج
  Future<void> logout();

  /// الحصول على المستخدم الحالي
  Future<LoginEntity?> getCurrentUser();
}
