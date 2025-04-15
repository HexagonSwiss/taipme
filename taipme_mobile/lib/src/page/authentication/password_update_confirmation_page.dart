import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taipme_mobile/src/component/footer_input.dart';
import 'package:taipme_mobile/src/component/title_input.dart';

class PasswordUpdateConfirmationPage extends ConsumerStatefulWidget {
  const PasswordUpdateConfirmationPage({super.key, required this.token});

  final String token;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PasswordUpdateConfirmationPageState();
}

class _PasswordUpdateConfirmationPageState
    extends ConsumerState<PasswordUpdateConfirmationPage> {
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
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            const Spacer(flex: 2), // Spazio in cima
            PageTitle(title: 'recupero password'),
            const Spacer(flex: 1), // Spazio tra titolo e form
            const Spacer(flex: 2), // Spazio tra form e footer
            const FooterInput(
                title: '_modifica',
                titleLink: '',
                state: 'Non hai ancora un account?',
                action: '_registrati',
                actionLink: '/register'),
            const Spacer(flex: 1), // Spazio inferiore
          ],
        ),
      ),
    );
  }
}
