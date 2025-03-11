import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taipme_mobile/src/component/titlle_input.dart';
import 'package:taipme_mobile/src/component/footer_input.dart';
import 'package:taipme_mobile/src/theme/styles.dart';

class ForgotPasswordSentPage extends ConsumerStatefulWidget {
  const ForgotPasswordSentPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ForgotPasswordSentPageState();
}

class _ForgotPasswordSentPageState extends ConsumerState<ForgotPasswordSentPage> {

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
            const FooterInput(title: '', titleLink: '', state: 'Non hai ancora un account?', action: '_registrati', actionLink: '/register'),
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
          'Controlla la tua casella postale e segui il link per reimpostare la tua password!',
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
