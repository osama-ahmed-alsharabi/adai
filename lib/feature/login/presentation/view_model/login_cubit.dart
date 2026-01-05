import 'package:adai/feature/login/domain/entities/login_entity.dart';
import 'package:adai/feature/login/domain/repositories/login_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

/// Cubit للتحكم في عملية تسجيل الدخول
class LoginCubit extends Cubit<LoginState> {
  final LoginRepository _loginRepository;

  LoginCubit({required LoginRepository loginRepository})
    : _loginRepository = loginRepository,
      super(const LoginInitial());

  /// التحقق من صحة الإيميل
  String? validateEmail(String? email) {
    if (email == null || email.trim().isEmpty) {
      return 'الرجاء إدخال البريد الإلكتروني';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(email.trim())) {
      return 'البريد الإلكتروني غير صالح';
    }
    return null;
  }

  /// التحقق من صحة كلمة المرور
  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'الرجاء إدخال كلمة المرور';
    }
    if (password.length < 6) {
      return 'كلمة المرور يجب أن تكون 6 أحرف على الأقل';
    }
    return null;
  }

  /// تسجيل الدخول
  Future<void> login({required String email, required String password}) async {
    // التحقق من المدخلات أولاً
    final emailError = validateEmail(email);
    final passwordError = validatePassword(password);

    if (emailError != null || passwordError != null) {
      emit(
        LoginValidationError(
          emailError: emailError,
          passwordError: passwordError,
        ),
      );
      return;
    }

    // بدء عملية تسجيل الدخول
    emit(const LoginLoading());

    try {
      final user = await _loginRepository.login(
        email: email,
        password: password,
      );
      emit(LoginSuccess(user));
    } catch (e) {
      emit(LoginFailure(e.toString().replaceAll('Exception: ', '')));
    }
  }

  /// تسجيل الخروج
  Future<void> logout() async {
    try {
      await _loginRepository.logout();
      emit(const LoginInitial());
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }

  /// إعادة التعيين للحالة الأولية
  void reset() {
    emit(const LoginInitial());
  }
}
