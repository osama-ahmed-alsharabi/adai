import 'package:adai/core/utils/app_asset.dart';
import 'package:adai/core/utils/app_color.dart';
import 'package:adai/feature/login/presentation/view/widgets/login_app_bar_widget.dart';
import 'package:adai/feature/login/presentation/view/widgets/login_form_container_widget.dart';
import 'package:flutter/material.dart';

class LoginBodyWidget extends StatelessWidget {
  const LoginBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // حساب ارتفاع الكيبورد لإضافة padding مناسب
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomCenter,
          colors: [
            AppColor.primaryColor,
            AppColor.primaryColor,
            // AppColor.secondaryColor,
          ],
        ),
      ),
      child: SingleChildScrollView(
        // يجعل الـ scroll يعمل تلقائياً عند فتح الكيبورد
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: EdgeInsets.only(bottom: bottomInset),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: IntrinsicHeight(
            child: Column(
              children: [
                const LoginAppBarWidget(),
                const SizedBox(height: 20),
                const FormLoginWidget(),
                const Spacer(), // الآن Spacer يعمل لأن IntrinsicHeight يعطي bounded constraints
                Image.asset(AppAsset.loginBottomBackgroundImage),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
