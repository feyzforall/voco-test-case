import 'package:go_router/go_router.dart';
import 'package:voco/core/router/voco_routes.dart';
import 'package:voco/features/view/screens/home_screen.dart';
import 'package:voco/features/view/screens/login_screen.dart';
import 'package:voco/features/view/screens/splash_screen.dart';

final vocoRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: VocoRoutes.path(VocoRoutes.login),
      name: VocoRoutes.login,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: VocoRoutes.path(VocoRoutes.home),
      name: VocoRoutes.home,
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
