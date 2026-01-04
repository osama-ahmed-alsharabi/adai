import 'package:adai/feature/login/presentation/view/widgets/login_body_widget.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // إخفاء الكيبورد عند النقر خارج حقول الإدخال
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        // يسمح للشاشة بالتكيف مع ارتفاع الكيبورد
        resizeToAvoidBottomInset: true,
        body: const SafeArea(child: LoginBodyWidget()),
      ),
    );
  }
}
