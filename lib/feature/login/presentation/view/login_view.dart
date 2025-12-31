import 'package:adai/core/utils/app_color.dart';
import 'package:adai/feature/login/presentation/view/widgets/login_app_bar_widget.dart';
import 'package:adai/feature/login/presentation/view/widgets/login_form_container_widget.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              colors: [
                AppColor.primaryColor,
                AppColor.primaryColor,
                // AppColor.primaryColor,
                // AppColor.secondaryColor,
                AppColor.secondaryColor,
              ],
            ),
          ),
          child: Column(
            children: [const LoginAppBarWidget(), const LoginWaveContainer()],
          ),
        ),
      ),
    );
  }
}
