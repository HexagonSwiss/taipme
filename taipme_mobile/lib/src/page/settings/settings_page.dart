import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taipme_mobile/src/component/input_field.dart';
import 'package:taipme_mobile/src/component/button/primary_button.dart';
import 'package:taipme_mobile/src/component/page_structure/logged_page_structure.dart';
import 'package:taipme_mobile/src/component/text/page_title.dart';
import 'package:taipme_mobile/src/controller/form_controller/form_controller.dart';
import 'package:taipme_mobile/src/controller/user_controller/user_controller.dart';
import 'package:taipme_mobile/src/util/key/key.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _newPasswordConfirmationController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _newPasswordFocusNode = FocusNode();
  final _newPasswordConfirmationFocusNode = FocusNode();

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _newPasswordFocusNode.dispose();
    _newPasswordConfirmationFocusNode.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _newPasswordController.dispose();
    _newPasswordConfirmationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LoggedPageStructure(
      child: Form(
        key: profileKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 24,
            children: [
              SizedBox(height: 16),
              Align(
                child: PageTitle(title: AppLocalizations.of(context)!.settings),
              ),
              SizedBox(height: 16),
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
                nextFocusNode: _newPasswordFocusNode,
                hintText: AppLocalizations.of(context)!.password,
                icon: Icons.visibility,
                hasSuffixIcon: true,
                isPassword: true,
                validator: (value) => ref
                    .read(formControllerProvider.notifier)
                    .validatePassword(value, context),
              ),
              InputField(
                controller: _newPasswordController,
                focusNode: _newPasswordFocusNode,
                nextFocusNode: _newPasswordConfirmationFocusNode,
                hintText: AppLocalizations.of(context)!.newPassword,
                icon: Icons.visibility,
                hasSuffixIcon: true,
                isPassword: true,
                validator: (value) => ref
                    .read(formControllerProvider.notifier)
                    .guaranteeDifferentPasswords(
                      _passwordController.text,
                      value,
                      context,
                    ),
              ),
              InputField(
                controller: _newPasswordConfirmationController,
                focusNode: _newPasswordConfirmationFocusNode,
                hintText: AppLocalizations.of(context)!.confirmPassword,
                icon: Icons.visibility,
                hasSuffixIcon: true,
                isConfirmation: true,
                validator: (value) =>
                    ref.read(formControllerProvider.notifier).comparePasswords(
                          _newPasswordController.text,
                          value,
                          context,
                        ),
              ),
              Align(
                alignment: Alignment.center,
                child: PrimaryButton(
                  title: '_${AppLocalizations.of(context)!.save}',
                  onPressed: () async => await ref
                      .read(formControllerProvider.notifier)
                      .handleForm(
                    actions: [
                      () async => await ref
                          .read(userControllerProvider.notifier)
                          .updatePassword(
                            email: _emailController.text,
                            password: _passwordController.text,
                            newPassword: _newPasswordController.text,
                            newPasswordConfirmation:
                                _newPasswordConfirmationController.text,
                          ),
                    ],
                    route: '/home-page',
                    globalKey: loginKey,
                    context: context,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
