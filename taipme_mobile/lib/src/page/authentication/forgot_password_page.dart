import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taipme_mobile/src/component/titlle_input.dart';
import 'package:taipme_mobile/src/component/footer_input.dart';
import 'package:taipme_mobile/src/theme/styles.dart';

class ForgotPasswordPage extends ConsumerStatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends ConsumerState<ForgotPasswordPage> {

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
          style: TextStyle(
            fontSize: TaipmeStyle.miniTextSize,
            color: TaipmeStyle.primaryColor,
          ),
        ),
          
        TextField(
          style: const TextStyle(color: TaipmeStyle.primaryColor),
          decoration: const InputDecoration(
            labelText: 'e-mail',
            labelStyle: TextStyle(color: TaipmeStyle.primaryColor),
            suffixIcon: Icon(Icons.person, color: TaipmeStyle.primaryColor),
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
