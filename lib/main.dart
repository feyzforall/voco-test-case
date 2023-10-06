import 'package:flutter/material.dart';
import 'package:voco/core/router/voco_router.dart';
import 'package:voco/core/voco_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Voco App',
      theme: vocoTheme,
      routerConfig: vocoRouter,
    );
  }
}
