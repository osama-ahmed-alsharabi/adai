import 'package:adai/core/utils/app_color.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class StatusBarWidget extends StatelessWidget {
  final Widget child;
  const StatusBarWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: AppColor.secondaryColor.withAlpha(80),
        statusBarIconBrightness: Brightness.dark,
      ),
      child: child,
    );
  }
}
