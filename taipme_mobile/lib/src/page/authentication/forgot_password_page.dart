import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taipme_mobile/src/component/text_input.dart';
import 'package:taipme_mobile/src/component/titlle_input.dart';
import 'package:taipme_mobile/src/component/footer_input.dart';
import 'package:taipme_mobile/src/theme/styles.dart';

class ForgotPasswordPage extends ConsumerStatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends ConsumerState<ForgotPasswordPage> {

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
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            const Spacer(flex: 2), // Spazio in cima
            TitleInput(title: 'recupero password'),
            const Spacer(flex: 1), // Spazio tra titolo e form
            _buildForm(),
            const Spacer(flex: 2), // Spazio tra form e footer
            const FooterInput(title: '_invia', titleLink: '', state: 'Non hai ancora un account?', action: '_registrati', actionLink: '/register'),
            const Spacer(flex: 1), // Spazio inferiore
          ],
        ),
      ),
    );
  }

Widget _buildForm() {
    return Column(
      children: [
        Text(
          'Inserisci la tua email per poter recuperare la tua password',
          textAlign: TextAlign.center, 
          style: TextStyle(
            fontSize: TaipmeStyle.miniTextSize,
            color: TaipmeStyle.primaryColor,
          ),
        ),
        const SizedBox(height: 16),
          TextInput(
          hintText: 'e-mail',
          icon: Icons.person,
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

}
