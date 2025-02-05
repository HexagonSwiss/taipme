import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taipme_mobile/src/component/footer_input.dart';
import 'package:taipme_mobile/src/component/titlle_input.dart';
import 'package:taipme_mobile/src/theme/styles.dart';

class ForgotPasswordConfirmationPage extends ConsumerStatefulWidget {
  const ForgotPasswordConfirmationPage({super.key,  required this.token});

final String token;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ForgotPasswordCOnfirmationPageState();
}

class _ForgotPasswordCOnfirmationPageState extends ConsumerState<ForgotPasswordConfirmationPage> {

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
            const FooterInput(title: '_modifica', titleLink: '', state: 'Non hai ancora un account?', action: '_registrati', actionLink: '/register'),
            const Spacer(flex: 1), // Spazio inferiore
          ],
        ),
      ),
    );
  }


  Widget _buildForm() {
    return Column(
      children: [
        TextField(
          obscureText: true,
          style: const TextStyle(color: TaipmeStyle.primaryColor),
          decoration: const InputDecoration(
            labelText: 'nuova password',
            labelStyle: TextStyle(color: TaipmeStyle.primaryColor),
            suffixIcon: Icon(Icons.lock, color: TaipmeStyle.primaryColor),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: TaipmeStyle.primaryColor),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: TaipmeStyle.primaryColor),
            ),
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          obscureText: true,
          style: const TextStyle(color: TaipmeStyle.primaryColor),
          decoration: const InputDecoration(
            labelText: 'conferma nuova password',
            labelStyle: TextStyle(color: TaipmeStyle.primaryColor),
            suffixIcon: Icon(Icons.visibility, color: TaipmeStyle.primaryColor),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: TaipmeStyle.primaryColor),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: TaipmeStyle.primaryColor),
            ),
          ),
        ),
      ],
    );
  }
}