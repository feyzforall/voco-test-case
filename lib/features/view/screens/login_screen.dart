import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:voco/core/constants/voco_assets.dart';
import 'package:voco/core/constants/voco_dimensions.dart';
import 'package:voco/core/router/voco_routes.dart';
import 'package:voco/core/utils/exceptions/server_exception.dart';
import 'package:voco/features/controller/auth_controller.dart';
import 'package:voco/features/view/widgets/voco_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: VocoDimensions.pagePadding,
        child: LoginScreenBody(
          emailController: _emailController,
          passwordController: _passwordController,
        ),
      ),
    );
  }
}

class LoginScreenBody extends ConsumerWidget {
  const LoginScreenBody({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authControllerProvider);
    ref.listen(authControllerProvider, (previous, next) {
      // If we get an error we show snackbar
      if (next is AsyncError) {
        final ServerException serverException = next.error as ServerException;
        var snackBar = SnackBar(
          content: Text(serverException.message.toString()),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        // If the login is successful, we go to the homepage
      } else if (next is AsyncData) {
        context.pushReplacementNamed(VocoRoutes.home);
      }
    });

    return state.maybeWhen(
      orElse: () => InitialBody(
        emailController: emailController,
        passwordController: passwordController,
      ),
      loading: () => Center(
        child: Lottie.asset(
          VocoAssets.animation,
          width: 96,
          height: 96,
        ),
      ),
    );
  }
}

class InitialBody extends StatelessWidget {
  const InitialBody({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        const Spacer(flex: 5),
        const HeaderSection(),
        const Spacer(),
        TextFieldSection(
          emailController: emailController,
          passwordController: passwordController,
        ),
        const Spacer(),
        ButtonSection(
          emailController: emailController,
          passwordController: passwordController,
        ),
        const Spacer(flex: 5),
      ],
    );
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'VOCO',
      style: Theme.of(context).textTheme.displayLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
    );
  }
}

class TextFieldSection extends StatelessWidget {
  const TextFieldSection({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            hintText: 'Email',
          ),
        ),
        const SizedBox(height: VocoDimensions.smallGap),
        TextField(
          controller: passwordController,
          keyboardType: TextInputType.visiblePassword,
          decoration: const InputDecoration(
            hintText: 'Şifre',
          ),
        ),
      ],
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, WidgetRef ref, __) {
        return Column(
          children: [
            VocoButton(
              text: 'Giriş Yap',
              onPressed: () async {
                await ref.read(authControllerProvider.notifier).login(
                      emailController.text,
                      passwordController.text,
                    );
              },
            ),
            // TODO:  One day we will register users but not today.
            TextButton(
              onPressed: () {
                // context.pushReplacementNamed(VocoRoutes.register);
              },
              child: const Text(
                'Kayıt Ol',
              ),
            ),
          ],
        );
      },
    );
  }
}
