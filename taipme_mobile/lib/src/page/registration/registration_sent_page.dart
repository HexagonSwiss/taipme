import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taipme_mobile/src/component/footer_input.dart';
import 'package:taipme_mobile/src/component/titlle_input.dart';
import 'package:taipme_mobile/src/theme/styles.dart';

class RegistrationSentPage extends ConsumerStatefulWidget {
  const RegistrationSentPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegistrationSentPageState();
}

class _RegistrationSentPageState extends ConsumerState<RegistrationSentPage> {

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
            const Spacer(flex: 2), // Spazio tra form e footer
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
        Text(
          'Registrazione avvenuta! Controlla la tua casella postale e segui il link per accedere',
          textAlign: TextAlign.center, 
          style: TextStyle(
            fontSize: TaipmeStyle.miniTextSize,
            color: TaipmeStyle.primaryColor,
          ),
        ),          
      ],
    );
  }
}