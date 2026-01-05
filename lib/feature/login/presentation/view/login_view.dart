import 'package:adai/feature/login/data/repositories/login_repository_impl.dart';
import 'package:adai/feature/login/presentation/view/widgets/login_body_widget.dart';
import 'package:adai/feature/login/presentation/view_model/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(loginRepository: LoginRepositoryImpl()),
      child: GestureDetector(
        // إخفاء الكيبورد عند النقر خارج حقول الإدخال
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          // يسمح للشاشة بالتكيف مع ارتفاع الكيبورد
          resizeToAvoidBottomInset: true,
          body: const SafeArea(child: LoginBodyWidget()),
        ),
      ),
    );
  }
}
