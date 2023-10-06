import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:voco/core/router/voco_routes.dart';
import 'package:voco/core/voco_dimensions.dart';
import 'package:voco/features/view/widgets/voco_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: VocoDimensions.pagePadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            Spacer(flex: 5),
            HeaderSection(),
            Spacer(),
            TextFieldSection(),
            Spacer(),
            ButtonSection(),
            Spacer(flex: 5),
          ],
        ),
      ),
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
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'Email',
          ),
        ),
        SizedBox(height: VocoDimensions.smallGap),
        TextField(
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
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
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VocoButton(
          text: 'Giriş Yap',
          onPressed: () => context.pushReplacementNamed(
            VocoRoutes.home,
          ),
        ),
        // TODO:  One day we will register the user but not today.
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
  }
}
