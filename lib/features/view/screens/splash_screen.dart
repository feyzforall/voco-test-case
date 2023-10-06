import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:voco/core/constants/voco_assets.dart';
import 'package:voco/core/router/voco_routes.dart';
import 'package:voco/features/repository/locale/locale_auth_repository.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
      () {
        if (LocalAuthRepository.isLoggedIn) {
          context.pushReplacementNamed(VocoRoutes.home);
        } else {
          context.pushReplacementNamed(VocoRoutes.login);
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(VocoAssets.animation),
      ),
    );
  }
}
