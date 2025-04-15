import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taipme_mobile/src/component/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:taipme_mobile/src/component/app_bar/custom_header.dart';
import 'package:taipme_mobile/src/component/input_field.dart';
import 'package:taipme_mobile/src/component/menu.dart';
import 'package:taipme_mobile/src/component/primary_button.dart';
import 'package:taipme_mobile/src/controller/form_controller/form_controller.dart';
import 'package:taipme_mobile/src/controller/user_controller/user_controller.dart';
import 'package:taipme_mobile/src/theme/styles.dart';
import 'package:taipme_mobile/src/util/key/key.dart';

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
    return Scaffold(
      backgroundColor: TaipmeStyle.backgroundColor,
      appBar: const CustomHeader(),
      endDrawer: const Menu(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Form(
          key: profileKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InputField(
                  controller: _emailController,
                  focusNode: _emailFocusNode,
                  nextFocusNode: _passwordFocusNode,
                  hintText: 'e-mail',
                  icon: Icons.person,
                  hasSuffixIcon: true,
                  isReadOnly: true,
                  validator: (value) => ref
                      .read(formControllerProvider.notifier)
                      .validateEmail(value, context),
                ),
                const SizedBox(height: 16),
                InputField(
                  controller: _passwordController,
                  focusNode: _passwordFocusNode,
                  nextFocusNode: _newPasswordFocusNode,
                  hintText: 'password',
                  labelText: 'password',
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
                  hintText: 'nuova password',
                  labelText: 'nuova password',
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
                  hintText: 'conferma password',
                  labelText: 'conferma password',
                  icon: Icons.visibility,
                  hasSuffixIcon: true,
                  isConfirmation: true,
                  validator: (value) => ref
                      .read(formControllerProvider.notifier)
                      .comparePasswords(
                        _newPasswordController.text,
                        value,
                        context,
                      ),
                ),
                const SizedBox(height: 32),
                PrimaryButton(
                  title: '_salva',
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
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
