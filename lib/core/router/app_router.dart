import 'package:adai/core/router/app_router_const.dart';
import 'package:adai/core/router/page_transitions.dart';
import 'package:adai/core/widgets/status_bar_widget.dart';
import 'package:adai/feature/login/presentation/view/login_view.dart';
import 'package:adai/feature/splash/presentation/splash_view.dart';
import 'package:adai/feature/splash/presentation/onboarding_view.dart';
import 'package:adai/feature/test_bracelet/presentation/bracelet_test_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: AppRouterConst.splashViewRouteName,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: StatusBarWidget(child: const SplashView()),
          transitionsBuilder: PageTransitions.noTransition,
        ),
      ),
      GoRoute(
        path: '/onboarding',
        name: AppRouterConst.onBoardingViewRouteName,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: StatusBarWidget(child: const OnboardingView()),
          transitionsBuilder: PageTransitions.fadeTransition,
        ),
      ),
      GoRoute(
        path: '/bracelet-test',
        name: AppRouterConst.braceletTestViewRouteName,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: StatusBarWidget(child: const BraceletTestView()),
          transitionsBuilder: PageTransitions.fadeTransition,
        ),
      ),
      GoRoute(
        path: '/login',
        name: AppRouterConst.loginViewRouteName,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: StatusBarWidget(child: const LoginView()),
          transitionsBuilder: PageTransitions.fadeTransition,
        ),
      ),
    ],
  );
}
