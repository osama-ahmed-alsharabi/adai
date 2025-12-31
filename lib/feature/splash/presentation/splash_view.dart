import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:adai/core/utils/app_color.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotateAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeLogoAnimation;
  late Animation<double> _fadeBackgroundAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    );

    // Phase 1 (0-40%): Scale up and rotate to 45 degrees (Diamond)
    // Phase 2 (40-70%): Scale up slightly more and rotate back to 0 degrees (Square)
    // Phase 3 (70-100%): Reveal Logo and Background

    _rotateAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween:
            Tween<double>(
                  begin: 0.0,
                  end: 0.125,
                ) // 0 to 45 degrees (0.125 turns)
                .chain(CurveTween(curve: Curves.easeOut)),
        weight: 40,
      ),
      TweenSequenceItem(
        tween:
            Tween<double>(begin: 0.125, end: 0.0) // 45 to 0 degrees
                .chain(CurveTween(curve: Curves.easeInOut)),
        weight: 30,
      ),
      TweenSequenceItem(
        tween: ConstantTween<double>(0.0), // Stay at 0
        weight: 30,
      ),
    ]).animate(_controller);

    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 40,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 1.0,
          end: 1.2,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 30,
      ),
      TweenSequenceItem(
        tween:
            Tween<double>(begin: 1.2, end: 1.0) // Settle down
                .chain(CurveTween(curve: Curves.elasticOut)),
        weight: 30,
      ),
    ]).animate(_controller);

    _fadeLogoAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.7, 1.0, curve: Curves.easeIn),
      ),
    );

    _fadeBackgroundAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.6, 1.0, curve: Curves.easeIn),
      ),
    );

    _controller.forward().then((_) {
      // Navigate after animation
      // GoRouter.of(context).go('/onboarding'); // Verify route later
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background with Fade
          FadeTransition(
            opacity: _fadeBackgroundAnimation,
            child: Image.asset(
              "assets/images/splash_image.png",
              // fit: BoxFit.cover,
            ),
          ),

          // Rotating and Scaling White Box / Logo
          Center(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                // Determine if we show the white box or the logo based on progress
                bool showLogo = _controller.value > 0.7;

                return Transform.scale(
                  scale: _scaleAnimation.value,
                  child: Transform.rotate(
                    angle: _rotateAnimation.value * 2 * math.pi,
                    child: showLogo
                        ? FadeTransition(
                            opacity: _fadeLogoAnimation,
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                // color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 10,
                                    offset: Offset(0, 5),
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.all(16),
                              child: Image.asset("assets/images/app_logo.png"),
                            ),
                          )
                        : Container(
                            width: 80, // Initial white box size
                            height: 80,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
