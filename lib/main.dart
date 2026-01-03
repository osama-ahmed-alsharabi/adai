import 'package:adai/core/router/app_router.dart';
import 'package:adai/core/theme/light_theme.dart';
import 'package:adai/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const Adai());
}

class Adai extends StatelessWidget {
  const Adai({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      locale: const Locale('ar'),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      theme: light(),
      routerConfig: AppRouter.router,
    );
  }
}
