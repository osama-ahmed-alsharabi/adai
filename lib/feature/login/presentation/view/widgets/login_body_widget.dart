import 'package:adai/core/utils/app_asset.dart';
import 'package:adai/core/utils/app_color.dart';
import 'package:adai/feature/login/presentation/view/widgets/login_app_bar_widget.dart';
import 'package:flutter/material.dart';

class LoginBodyWidget extends StatelessWidget {
  const LoginBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
        children: [
          const LoginAppBarWidget(),
          const Spacer(),
          FormLoginWidget(),
          const Spacer(),
          Image.asset(AppAsset.loginBottomBackgroundImage),
        ],
      ),
    );
  }
}

class FormLoginWidget extends StatelessWidget {
  const FormLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Text(
            textAlign: TextAlign.right,
            "مرحبــاً",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 6,
                ),
                child: Text("label", style: TextStyle(color: Colors.white)),
              ),
              TextFormField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  hintText: "Enter your email",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
