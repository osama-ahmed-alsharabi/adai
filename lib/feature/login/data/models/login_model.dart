import 'package:adai/feature/login/domain/entities/login_entity.dart';

/// نموذج تسجيل الدخول - يمتد من الكيان مع دعم التحويل من/إلى JSON
class LoginModel extends LoginEntity {
  const LoginModel({
    required super.uid,
    required super.email,
    super.displayName,
    super.role,
  });

  /// إنشاء نموذج من Firebase User
  factory LoginModel.fromFirebaseUser({
    required String uid,
    required String email,
    String? displayName,
    String? role,
  }) {
    return LoginModel(
      uid: uid,
      email: email,
      displayName: displayName,
      role: role,
    );
  }

  /// تحويل إلى Map
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'displayName': displayName,
      'role': role,
    };
  }

  /// إنشاء من Map
  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      uid: map['uid'] ?? '',
      email: map['email'] ?? '',
      displayName: map['displayName'],
      role: map['role'],
    );
  }

  /// تحويل من Entity إلى Model
  factory LoginModel.fromEntity(LoginEntity entity) {
    return LoginModel(
      uid: entity.uid,
      email: entity.email,
      displayName: entity.displayName,
      role: entity.role,
    );
  }
}
