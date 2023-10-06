import 'package:flutter/material.dart';
import 'package:voco/core/constants/voco_theme.dart';
import 'package:voco/core/router/voco_router.dart';

void main() => runApp(const MyApp());

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
