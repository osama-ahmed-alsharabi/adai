import 'package:adai/core/router/app_router_const.dart';
import 'package:adai/core/utils/app_color.dart';
import 'package:adai/feature/login/presentation/view/widgets/custom_login_button_widget.dart';
import 'package:adai/feature/login/presentation/view/widgets/custom_text_login_field_widget.dart';
import 'package:adai/feature/login/presentation/view/widgets/custom_text_password_login_field_widget.dart';
import 'package:adai/feature/login/presentation/view_model/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FormLoginWidget extends StatefulWidget {
  const FormLoginWidget({super.key});

  @override
  State<FormLoginWidget> createState() => _FormLoginWidgetState();
}

class _FormLoginWidgetState extends State<FormLoginWidget> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          // الانتقال للصفحة الرئيسية عند نجاح تسجيل الدخول
          context.goNamed(AppRouterConst.homeViewViewRouteName);
        } else if (state is LoginFailure) {
          // عرض رسالة الخطأ
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red.shade700,
              behavior: SnackBarBehavior.floating,
              margin: const EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16),
            const Text(
              "مرحبــاً",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              "قم بتسجيل الدخول..",
              style: TextStyle(color: AppColor.secondaryColor, fontSize: 16),
            ),
            _buildLoginFields(),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginFields() {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        // استخراج أخطاء التحقق من الحالة
        String? emailError;
        String? passwordError;
        bool isLoading = false;

        if (state is LoginValidationError) {
          emailError = state.emailError;
          passwordError = state.passwordError;
        } else if (state is LoginLoading) {
          isLoading = true;
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32),
            // خط فاصل خفيف
            Container(
              height: 1,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.white.withValues(alpha: 0.2),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
            const SizedBox(height: 28),
            const SizedBox(height: 24),
            // حقل الايميل
            CustomTextLoginFieldWidget(
              label: "الايميل",
              hintText: "قم بإدخال الايميل",
              controller: _emailController,
              errorText: emailError,
              keyboardType: TextInputType.emailAddress,
              onChanged: (_) {
                // إعادة تعيين الحالة عند التعديل
                if (state is LoginValidationError || state is LoginFailure) {
                  context.read<LoginCubit>().reset();
                }
              },
            ),
            const SizedBox(height: 16),
            // حقل كلمة المرور
            CustomTextPasswordLoginFieldWidget(
              label: "كلمة المرور",
              hintText: "قم بإدخال كلمة المرور",
              controller: _passwordController,
              errorText: passwordError,
              onChanged: (_) {
                if (state is LoginValidationError || state is LoginFailure) {
                  context.read<LoginCubit>().reset();
                }
              },
            ),
            // رابط نسيت كلمة المرور
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white.withValues(alpha: 0.7),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                ),
                onPressed: () {
                  // TODO: تنفيذ نسيت كلمة المرور
                },
                child: Text(
                  "نسيت كلمة المرور؟",
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.7),
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // زر تسجيل الدخول
            CustomLoginButtonWidget(
              isLoading: isLoading,
              onPressed: () => _handleLogin(context),
            ),
            const SizedBox(height: 24),
          ],
        );
      },
    );
  }

  void _handleLogin(BuildContext context) {
    context.read<LoginCubit>().login(
      email: _emailController.text,
      password: _passwordController.text,
    );
  }
}
