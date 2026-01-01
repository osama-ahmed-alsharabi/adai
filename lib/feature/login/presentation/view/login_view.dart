import 'package:adai/feature/login/presentation/view/widgets/login_body_widget.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: LoginBodyWidget()));
  }
}
