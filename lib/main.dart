import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voco/core/constants/voco_theme.dart';
import 'package:voco/core/router/voco_router.dart';

void main() => runApp(
      const ProviderScope(
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Voco App',
      theme: vocoTheme,
      routerConfig: vocoRouter,
    );
  }
}
