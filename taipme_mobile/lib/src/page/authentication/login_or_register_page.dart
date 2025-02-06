import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taipme_mobile/route/route.dart';
import 'package:taipme_mobile/src/component/titlle_input.dart';
import 'package:taipme_mobile/src/component/footer_input.dart';
import 'package:taipme_mobile/src/theme/styles.dart';
import 'package:taipme_mobile/src/component/text_input.dart';

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
        child: Column(
          children: [
            const Spacer(flex: 2), // Spazio in cima
            TitleInput(title: 'accedi'),
            const Spacer(flex: 1), // Spazio tra titolo e form
            _buildForm(),
            const Spacer(flex: 2), // Spazio tra form e footer
            const FooterInput(
                title: '_accedi',
                titleLink: '/chat-home-page',
                state: 'Non hai ancora un account?',
                action: '_registrati',
                actionLink: '/register'),
            const Spacer(flex: 1), // Spazio inferiore
          ],
        ),
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
          isValid: _isEmailValid,
          onFocusLost: _validateEmail,
        ),
        const SizedBox(height: 16),
        TextInput(
          controller: _passwordController,
          focusNode: _passwordFocusNode,
          hintText: 'password',
          icon: Icons.visibility,
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
