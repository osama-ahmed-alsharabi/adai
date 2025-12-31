import 'package:adai/core/router/app_router.dart';
import 'package:adai/core/theme/light_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Adai());
}

class Adai extends StatelessWidget {
  const Adai({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: light(),
      routerConfig: AppRouter.router,
    );
  }
}
