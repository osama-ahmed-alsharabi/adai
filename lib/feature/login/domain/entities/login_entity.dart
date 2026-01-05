import 'package:equatable/equatable.dart';

/// كيان المستخدم - يحتوي على البيانات الأساسية للمستخدم
class LoginEntity extends Equatable {
  final String uid;
  final String email;
  final String? displayName;
  final String? role;

  const LoginEntity({
    required this.uid,
    required this.email,
    this.displayName,
    this.role,
  });

  @override
  List<Object?> get props => [uid, email, displayName, role];
}
