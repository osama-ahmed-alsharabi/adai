import 'package:adai/core/utils/app_asset.dart';
import 'package:flutter/material.dart';

class LoginAppBarWidget extends StatelessWidget {
  const LoginAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            fit: BoxFit.fill,
            AppAsset.loginAppBarBackgroundImage,
            height: 150,
          ),
        ),
        Image.asset(AppAsset.loginSpeedBackgroundImage),
        Center(child: Image.asset(AppAsset.hiCharacterImageGIF, height: 180)),
      ],
    );
  }
}
