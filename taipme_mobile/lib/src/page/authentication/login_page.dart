import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taipme_mobile/route/route.dart';
import 'package:taipme_mobile/src/component/button/primary_button.dart';
import 'package:taipme_mobile/src/component/page_structure/form_page_structure.dart';
import 'package:taipme_mobile/src/component/button/footer_actions.dart';
import 'package:taipme_mobile/src/controller/form_controller/form_controller.dart';
import 'package:taipme_mobile/src/controller/input_error_controller/input_error_controller.dart';
import 'package:taipme_mobile/src/controller/user_controller/user_controller.dart';
import 'package:taipme_mobile/src/theme/styles.dart';
import 'package:taipme_mobile/src/component/input_field.dart';
import 'package:taipme_mobile/src/util/key/key.dart';
import 'package:taipme_mobile/l10n/app_localizations.dart';

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
    return FormPageStructure(
      formKey: loginKey,
      title: AppLocalizations.of(context)!.login,
      formFields: <Widget>[
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
            onPressed: () => ref.read(goRouterProvider).go('/forgot-password'),
            child: const Text(
              '_password dimenticata',
              style: TextStyle(color: TaipmeStyle.primaryColor),
            ),
          ),
        ),
        SizedBox(height: 16),
        PrimaryButton(
          title: '_${AppLocalizations.of(context)!.login}',
          onPressed: () async {
            await ref.read(formControllerProvider.notifier).handleForm(
              actions: [
                () async =>
                    await ref.watch(userControllerProvider.notifier).loginUser(
                          email: _emailController.text,
                          password: _passwordController.text,
                        ),
              ],
              route: '/',
              globalKey: loginKey,
              context: context,
            );
          },
        ),
      ],
      footer: FooterActions(
        supportText: AppLocalizations.of(context)!.loginUserHasNoAccount,
        subtitle: '_${AppLocalizations.of(context)!.registration}',
        subtitleCallback: () {
          ref
              .read(inputErrorControllerProvider('password').notifier)
              .clearError();
          ref
              .read(inputErrorControllerProvider('e-mail').notifier)
              .clearError();
          ref.read(goRouterProvider).go('/register');
        },
      ),
    );
  }
}
