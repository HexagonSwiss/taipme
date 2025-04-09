import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taipme_mobile/route/route.dart';
import 'package:taipme_mobile/src/component/titlle_input.dart';
import 'package:taipme_mobile/src/component/footer_input.dart';
import 'package:taipme_mobile/src/controller/form_controller/form_controller.dart';
import 'package:taipme_mobile/src/controller/user_controller/user_controller.dart';
import 'package:taipme_mobile/src/theme/styles.dart';
import 'package:taipme_mobile/src/component/text_input.dart';
import 'package:taipme_mobile/src/util/key/key.dart';

class LoginOrRegisterPage extends ConsumerStatefulWidget {
  const LoginOrRegisterPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginOrRegisterPage();
}

class _LoginOrRegisterPage extends ConsumerState<LoginOrRegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  bool _isEmailValid = true;
  bool _isPasswordValid = true;

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
                const Spacer(flex: 2), // Spazio in cima
                TitleInput(title: 'accedi'),
                const Spacer(flex: 1), // Spazio tra titolo e form
                _buildForm(),
                const Spacer(flex: 2), // Spazio tra form e footer
                TextButton(
                  onPressed: () async {
                    final result = await ref
                        .read(userControllerProvider.notifier)
                        .loginUser(
                          email: _emailController.text,
                          password: _passwordController.text,
                        );

                    if (!context.mounted)
                      return; // Evita errori se il widget è stato smontato

                    if (result.error != null) {
                      final snackBar = SnackBar(
                        content: Text(
                          result.error!,
                          textAlign: TextAlign
                              .center, // Centrare il testo dentro la snackbar
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        behavior:
                            SnackBarBehavior.floating, // Permette di spostarla
                        backgroundColor:
                            Colors.redAccent, // Colore per maggiore visibilità
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        margin: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height *
                              0.4, // Regola altezza (40% dello schermo)
                          left: 50,
                          right: 50,
                        ),
                        duration: Duration(
                            seconds: 3), // Quanto tempo rimane visibile
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else {
                      await ref
                          .read(formControllerProvider.notifier)
                          .handleForm(
                        actions: [],
                        route: '/chat-home-page',
                        globalKey: loginKey,
                        context: context,
                      );
                    }
                  },
                  child: Text(
                    textAlign: TextAlign.center,
                    '_accedi',
                    style: TextStyle(
                      color: TaipmeStyle.primaryColor,
                      fontSize: TaipmeStyle.miniTextSize,
                    ),
                  ),
                ),
                const FooterInput(
                    title: '',
                    titleLink: '',
                    state: 'Non hai ancora un account?',
                    action: '_registrati',
                    actionLink: '/register'),
                const Spacer(flex: 1), // Spazio inferiore
              ],
            )),
      ),
    );
  }

  Widget _buildForm() {
    return Column(
      children: [
        TextInput(
          controller: _emailController,
          focusNode: _emailFocusNode,
          hintText: 'e-mail',
          icon: Icons.person,
          iconPosition: IconPosition.right,
          isValid: _isEmailValid,
          onFocusLost: _validateEmail,
        ),
        const SizedBox(height: 16),
        TextInput(
          controller: _passwordController,
          focusNode: _passwordFocusNode,
          hintText: 'password',
          icon: Icons.visibility,
          iconPosition: IconPosition.right,
          isValid: _isPasswordValid,
          onFocusLost: _validatePassword,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              if (_validateForm()) {
                ref.read(goRouterProvider).go('/forgot-password');
              }
            },
            child: const Text(
              '_password dimenticata',
              style: TextStyle(color: TaipmeStyle.primaryColor),
            ),
          ),
        ),
      ],
    );
  }

  bool _validateForm() {
    setState(() {
      _isEmailValid = _emailController.text.contains('@');
      _isPasswordValid = _passwordController.text.isNotEmpty;
    });
    return _isEmailValid && _isPasswordValid;
  }

  void _validateEmail() {
    setState(() {
      _isEmailValid = _emailController.text.contains('@');
    });
  }

  void _validatePassword() {
    setState(() {
      _isPasswordValid = _passwordController.text.isNotEmpty;
    });
  }
}
