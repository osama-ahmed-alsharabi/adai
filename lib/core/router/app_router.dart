import 'package:adai/core/router/app_router_const.dart';
import 'package:adai/core/router/page_transitions.dart';
import 'package:adai/feature/splash/presentation/splash_view.dart';
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
          child: const SplashView(),
          transitionsBuilder: PageTransitions.noTransition,
        ),
      ),
      GoRoute(
        path: '/bracelet-test',
        name: AppRouterConst.braceletTestViewRouteName,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const BraceletTestView(),
          transitionsBuilder: PageTransitions.fadeTransition,
        ),
      ),
    ],
  );
}
