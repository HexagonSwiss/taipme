import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taipme_mobile/route/route.dart';
import 'package:taipme_mobile/src/component/button/footer_actions.dart';
import 'package:taipme_mobile/src/component/button/primary_button.dart';
import 'package:taipme_mobile/src/component/input_field.dart';
import 'package:taipme_mobile/src/component/page_structure/form_page_structure.dart';
import 'package:taipme_mobile/src/controller/form_controller/form_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taipme_mobile/src/controller/input_error_controller/input_error_controller.dart';
import 'package:taipme_mobile/src/controller/user_controller/user_controller.dart';
import 'package:taipme_mobile/src/util/key/key.dart';

class RegistrationPage extends ConsumerStatefulWidget {
  const RegistrationPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RegistrationPageState();
}

class _RegistrationPageState extends ConsumerState<RegistrationPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmationController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _passwordConfirmationFocusNode = FocusNode();

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _passwordConfirmationFocusNode.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordConfirmationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FormPageStructure(
      formKey: registrationKey,
      title: AppLocalizations.of(context)!.registration,
      formFields: <Widget>[
        InputField(
          controller: _emailController,
          focusNode: _emailFocusNode,
          nextFocusNode: _passwordFocusNode,
          hintText: 'e-mail',
          icon: Icons.person,
          hasSuffixIcon: true,
          isReadOnly: false,
          validator: (value) => ref
              .read(formControllerProvider.notifier)
              .validateEmail(value, context),
        ),
        InputField(
          controller: _passwordController,
          focusNode: _passwordFocusNode,
          nextFocusNode: _passwordConfirmationFocusNode,
          hintText: 'password',
          icon: Icons.visibility,
          hasSuffixIcon: true,
          isPassword: true,
          validator: (value) => ref
              .read(formControllerProvider.notifier)
              .validatePassword(value, context),
        ),
        InputField(
          controller: _passwordConfirmationController,
          focusNode: _passwordConfirmationFocusNode,
          hintText: 'conferma password',
          icon: Icons.visibility,
          hasSuffixIcon: true,
          isConfirmation: true,
          validator: (value) =>
              ref.read(formControllerProvider.notifier).comparePasswords(
                    _passwordController.text,
                    value,
                    context,
                  ),
        ),
        SizedBox(height: 16),
        PrimaryButton(
          title: '_${AppLocalizations.of(context)!.registration}',
          onPressed: () async {
            await ref.read(formControllerProvider.notifier).handleForm(
              actions: [
                () async =>
                    await ref.read(userControllerProvider.notifier).loginUser(
                          email: _emailController.text,
                          password: _passwordController.text,
                        ),
              ],
              route: '/registration-sent',
              globalKey: registrationKey,
              context: context,
            );
          },
        ),
      ],
      footer: FooterActions(
        supportText: AppLocalizations.of(context)!.loginUserHasAnAccount,
        subtitle: '_${AppLocalizations.of(context)!.login}',
        subtitleCallback: () {
          ref
              .read(inputErrorControllerProvider('password').notifier)
              .clearError();
          ref
              .read(inputErrorControllerProvider('e-mail').notifier)
              .clearError();
          ref
              .read(inputErrorControllerProvider('conferma password').notifier)
              .clearError();
          ref.read(goRouterProvider).go('/login');
        },
      ),
    );
  }
}
