import 'package:adai/core/router/app_router_const.dart';
import 'package:adai/core/utils/app_color.dart';
import 'package:adai/feature/login/data/models/role_type.dart';
import 'package:adai/feature/login/presentation/view/widgets/custom_login_button_widget.dart';
import 'package:adai/feature/login/presentation/view/widgets/custom_text_login_field_widget.dart';
import 'package:adai/feature/login/presentation/view/widgets/custom_text_password_login_field_widget.dart';
import 'package:adai/feature/login/presentation/view/widgets/role_selection/role_selection_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FormLoginWidget extends StatefulWidget {
  const FormLoginWidget({super.key});

  @override
  State<FormLoginWidget> createState() => _FormLoginWidgetState();
}

class _FormLoginWidgetState extends State<FormLoginWidget> {
  RoleType? _selectedRole;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 16),
          Text(
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
    );
  }

  Widget _buildLoginFields() {
    return Column(
      key: ValueKey(_selectedRole),
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
        // رسالة ترحيب
        // _buildWelcomeText(),
        const SizedBox(height: 24),
        // حقل الايميل
        const CustomTextLoginFieldWidget(
          label: "الايميل",
          hintText: "قم بإدخال الايميل",
        ),
        const SizedBox(height: 16),
        // حقل كلمة المرور
        const CustomTextPasswordLoginFieldWidget(
          label: "كلمة المرور",
          hintText: "قم بإدخال كلمة المرور",
        ),
        // رابط نسيت كلمة المرور
        Align(
          alignment: Alignment.centerLeft,
          child: TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white.withValues(alpha: 0.7),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            ),
            onPressed: () {},
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
          onPressed: _selectedRole != null ? () => _handleLogin() : null,
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildWelcomeText() {
    final roleText = _selectedRole == RoleType.player
        ? 'أيها اللاعب'
        : 'أيها المدرب';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "أهلاً $roleText",
          textAlign: TextAlign.right,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          "سجّل دخولك للمتابعة",
          textAlign: TextAlign.right,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.white.withValues(alpha: 0.65),
          ),
        ),
      ],
    );
  }

  void _handleLogin() {
    context.goNamed(AppRouterConst.homeViewViewRouteName);
    // TODO: Implement login logic based on selected role
    debugPrint('Login as: ${_selectedRole?.arabicName}');
  }
}
