import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:adai/core/utils/app_color.dart';
import 'package:adai/core/utils/app_asset.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  Future<void> _completeOnboarding(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboarding_completed', true);
    if (context.mounted) {
      context.go('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 40),

              // Logo
              Image.asset(AppAsset.logoImage, width: 100, height: 100),

              const SizedBox(height: 32),

              // Motivational Text
              Text(
                "بينَ دقَّاتِ قلبِك، وقوةِ تحمُّلك، وسرعةِ ردّ فعلك..يُولدُ البطلُ الأفضل!",
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColor.primaryColor, fontSize: 16),
              ),

              const Spacer(),

              // Character Image
              Image.asset(AppAsset.hiCharacterImageGIF, height: 280),

              const Spacer(),

              // Start Button
              GestureDetector(
                onTap: () => _completeOnboarding(context),
                child: Container(
                  width: 180,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                  decoration: BoxDecoration(
                    color: AppColor.secondaryColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.arrow_back, color: Colors.white, size: 20),
                      SizedBox(width: 8),
                      Text(
                        'ابدأ الان',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
