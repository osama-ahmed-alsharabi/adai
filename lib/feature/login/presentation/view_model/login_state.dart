part of 'login_cubit.dart';

/// حالات تسجيل الدخول
sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

/// الحالة الأولية
final class LoginInitial extends LoginState {
  const LoginInitial();
}

/// حالة التحميل
final class LoginLoading extends LoginState {
  const LoginLoading();
}

/// حالة النجاح
final class LoginSuccess extends LoginState {
  final LoginEntity user;

  const LoginSuccess(this.user);

  @override
  List<Object?> get props => [user];
}

/// حالة الفشل
final class LoginFailure extends LoginState {
  final String message;

  const LoginFailure(this.message);

  @override
  List<Object?> get props => [message];
}

/// حالة أخطاء التحقق من المدخلات
final class LoginValidationError extends LoginState {
  final String? emailError;
  final String? passwordError;

  const LoginValidationError({this.emailError, this.passwordError});

  @override
  List<Object?> get props => [emailError, passwordError];
}
