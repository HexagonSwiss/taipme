import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taipme_mobile/src/component/footer_input.dart';
import 'package:taipme_mobile/src/component/text_input.dart';
import 'package:taipme_mobile/src/component/titlle_input.dart';
import 'package:taipme_mobile/src/theme/styles.dart';

class RegistrationPage extends ConsumerStatefulWidget {
  const RegistrationPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends ConsumerState<RegistrationPage> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  bool _isEmailValid = true;
  bool _isPasswordValid = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TaipmeStyle.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            const Spacer(flex: 2), // Spazio in cima
            TitleInput(title: 'registrati'),
            const Spacer(flex: 1), // Spazio tra titolo e form
            _buildForm(),
            const Spacer(flex: 1), // Spazio tra form e footer
            const FooterInput(title: '_registrati', titleLink: '', state: 'Hai già un account?', action: '_accedi', actionLink: '/login-or-register'),
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
          hintText: 'e-mail',
          icon: Icons.person,
          controller: _emailController,
          focusNode: _emailFocusNode,
          isValid: _isEmailValid,
          onFocusLost: _validateEmail,
        ),
        const SizedBox(height: 16),
        TextInput(
          hintText: 'password',
          icon: Icons.visibility,
          controller: _emailController,
          focusNode: _emailFocusNode,
          isValid: _isEmailValid,
          onFocusLost: _validateEmail,
        ),
        const SizedBox(height: 16),
        TextInput(
          hintText: 'conferma password',
          icon: Icons.visibility,
          controller: _emailController,
          focusNode: _emailFocusNode,
          isValid: _isEmailValid,
          onFocusLost: _validateEmail,
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
