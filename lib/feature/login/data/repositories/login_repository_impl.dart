import 'package:adai/feature/login/data/models/login_model.dart';
import 'package:adai/feature/login/domain/entities/login_entity.dart';
import 'package:adai/feature/login/domain/repositories/login_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// تنفيذ مستودع تسجيل الدخول باستخدام Firebase Auth
class LoginRepositoryImpl implements LoginRepository {
  final FirebaseAuth _firebaseAuth;

  LoginRepositoryImpl({FirebaseAuth? firebaseAuth})
    : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  @override
  Future<LoginEntity> login({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );

      final user = userCredential.user;
      if (user == null) {
        throw Exception('فشل تسجيل الدخول: المستخدم غير موجود');
      }

      return LoginModel.fromFirebaseUser(
        uid: user.uid,
        email: user.email ?? email,
        displayName: user.displayName,
      );
    } on FirebaseAuthException catch (e) {
      throw _mapFirebaseAuthException(e);
    }
  }

  @override
  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<LoginEntity?> getCurrentUser() async {
    final user = _firebaseAuth.currentUser;
    if (user == null) return null;

    return LoginModel.fromFirebaseUser(
      uid: user.uid,
      email: user.email ?? '',
      displayName: user.displayName,
    );
  }

  /// تحويل أخطاء Firebase إلى رسائل عربية مفهومة
  Exception _mapFirebaseAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return Exception('لا يوجد حساب بهذا البريد الإلكتروني');
      case 'wrong-password':
        return Exception('كلمة المرور غير صحيحة');
      case 'invalid-email':
        return Exception('البريد الإلكتروني غير صالح');
      case 'user-disabled':
        return Exception('تم تعطيل هذا الحساب');
      case 'too-many-requests':
        return Exception('محاولات كثيرة جداً، حاول لاحقاً');
      case 'network-request-failed':
        return Exception('خطأ في الاتصال بالإنترنت');
      case 'invalid-credential':
        return Exception('البريد الإلكتروني أو كلمة المرور غير صحيحة');
      default:
        return Exception('حدث خطأ: ${e.message}');
    }
  }
}
