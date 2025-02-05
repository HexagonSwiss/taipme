import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taipme_mobile/route/route.dart';
import 'package:taipme_mobile/src/component/titlle_input.dart';
import 'package:taipme_mobile/src/component/footer_input.dart';
import 'package:taipme_mobile/src/theme/styles.dart';

class LoginOrRegisterPage extends ConsumerStatefulWidget {
  const LoginOrRegisterPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginOrRegisterPage();
}

class _LoginOrRegisterPage extends ConsumerState<LoginOrRegisterPage> {
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
            const FooterInput(title: '_accedi', titleLink: '', state: 'Non hai ancora un account?', action: '_registrati', actionLink: '/register'),
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
        const SizedBox(height: 16),
        TextField(
          obscureText: true,
          style: const TextStyle(color: TaipmeStyle.primaryColor),
          decoration: const InputDecoration(
            labelText: 'password',
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
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () => ref.read(goRouterProvider).go(''),
            child: const Text(
              '_password dimenticata',
              style: TextStyle(color: TaipmeStyle.primaryColor),
            ),
          ),
        ),
      ],
    );
  }
}
