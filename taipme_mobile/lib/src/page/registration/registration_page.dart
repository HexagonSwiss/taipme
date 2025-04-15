import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taipme_mobile/src/component/footer_input.dart';
import 'package:taipme_mobile/src/component/input_field.dart';
import 'package:taipme_mobile/src/component/title_input.dart';
import 'package:taipme_mobile/src/controller/form_controller/form_controller.dart';
import 'package:taipme_mobile/src/theme/styles.dart';
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
    return Scaffold(
      backgroundColor: TaipmeStyle.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Form(
          key: registrationKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Spacer(flex: 2),
                PageTitle(title: 'registrati'),
                const Spacer(flex: 1),
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
                  nextFocusNode: _passwordConfirmationFocusNode,
                  hintText: 'password',
                  labelText: 'password',
                  icon: Icons.visibility,
                  hasSuffixIcon: true,
                  isPassword: true,
                  validator: (value) => ref
                      .read(formControllerProvider.notifier)
                      .validatePassword(value, context),
                ),
                const SizedBox(height: 16),
                InputField(
                  controller: _passwordConfirmationController,
                  focusNode: _passwordConfirmationFocusNode,
                  hintText: 'conferma password',
                  labelText: 'conferma password',
                  icon: Icons.visibility,
                  hasSuffixIcon: true,
                  isConfirmation: true,
                  validator: (value) =>
                      ref.read(formControllerProvider.notifier).comparePasswords(
                            _passwordConfirmationController.text,
                            value,
                            context,
                          ),
                ),
                const Spacer(flex: 1),
                const FooterInput(
                  title: '_registrati',
                  titleLink: '',
                  state: 'Hai già un account?',
                  action: '_accedi',
                  actionLink: '/login',
                ),
                const Spacer(flex: 1), // Spazio inferiore
              ],
            ),
          ),
        ),
      ),
    );
  }
}
