import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voco/core/constants/voco_strings.dart';
import 'package:voco/core/constants/voco_theme.dart';
import 'package:voco/core/router/voco_router.dart';
import 'package:voco/features/repository/locale/locale_auth_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalAuthRepository().fetchToken();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

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
