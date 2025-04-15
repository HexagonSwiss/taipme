import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taipme_mobile/route/route.dart';
import 'package:taipme_mobile/src/component/primary_button.dart';
import 'package:taipme_mobile/src/component/title_input.dart';
import 'package:taipme_mobile/src/component/footer_input.dart';
import 'package:taipme_mobile/src/controller/form_controller/form_controller.dart';
import 'package:taipme_mobile/src/controller/user_controller/user_controller.dart';
import 'package:taipme_mobile/src/theme/styles.dart';
import 'package:taipme_mobile/src/component/input_field.dart';
import 'package:taipme_mobile/src/util/key/key.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginOrRegisterPage();
}

class _LoginOrRegisterPage extends ConsumerState<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TaipmeStyle.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Form(
          key: loginKey,
          child: Column(
            children: [
              const Spacer(flex: 2),
              PageTitle(title: 'accedi'),
              const Spacer(flex: 1),
              InputField(
                controller: _emailController,
                focusNode: _emailFocusNode,
                nextFocusNode: _passwordFocusNode,
                hintText: 'e-mail',
                icon: Icons.person,
                hasSuffixIcon: true,
                validator: (value) => ref
                    .read(formControllerProvider.notifier)
                    .validateEmail(value, context),
              ),
              const SizedBox(height: 16),
              InputField(
                controller: _passwordController,
                focusNode: _passwordFocusNode,
                hintText: 'password',
                hasSuffixIcon: true,
                icon: Icons.visibility,
                isPassword: true,
                validator: (value) => ref
                    .read(formControllerProvider.notifier)
                    .validatePassword(value, context),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () =>
                      ref.read(goRouterProvider).go('/forgot-password'),
                  child: const Text(
                    '_password dimenticata',
                    style: TextStyle(color: TaipmeStyle.primaryColor),
                  ),
                ),
              ),
              const Spacer(flex: 2),
              PrimaryButton(
                title: '_accedi',
                onPressed: () async {
                  await ref.read(formControllerProvider.notifier).handleForm(
                    actions: [
                      () async => await ref
                          .read(userControllerProvider.notifier)
                          .loginUser(
                            email: _emailController.text,
                            password: _passwordController.text,
                          ),
                    ],
                    route: '/home-page',
                    globalKey: loginKey,
                    context: context,
                  );
                },
              ),
              const FooterInput(
                title: '',
                titleLink: '',
                state: 'Non hai ancora un account?',
                action: '_registrati',
                actionLink: '/register',
              ),
              const Spacer(flex: 1), // Spazio inferiore
            ],
          ),
        ),
      ),
    );
  }
}
