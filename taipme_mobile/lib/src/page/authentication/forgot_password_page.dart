import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taipme_mobile/src/component/input_field.dart';
import 'package:taipme_mobile/src/component/title_input.dart';
import 'package:taipme_mobile/src/component/footer_input.dart';
import 'package:taipme_mobile/src/controller/form_controller/form_controller.dart';
import 'package:taipme_mobile/src/theme/styles.dart';

class ForgotPasswordPage extends ConsumerStatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends ConsumerState<ForgotPasswordPage> {
  final _emailController = TextEditingController();
  final _emailFocusNode = FocusNode();

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _emailController.dispose();
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
            const Spacer(flex: 2),
            PageTitle(title: 'recupero password'),
            const Spacer(flex: 1),
            Text(
              'Inserisci la tua email per poter recuperare la tua password',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: TaipmeStyle.standardTextSize,
                color: TaipmeStyle.primaryColor,
              ),
            ),
            const SizedBox(height: 16),
            InputField(
              hintText: 'e-mail',
              icon: Icons.person,
              controller: _emailController,
              focusNode: _emailFocusNode,
              hasSuffixIcon: true,
              validator: (value) => ref
                  .read(formControllerProvider.notifier)
                  .validateEmail(value, context),
            ),
            const Spacer(flex: 2), // Spazio tra form e footer
            const FooterInput(
              title: '_invia',
              titleLink: '',
              state: 'Non hai ancora un account?',
              action: '_registrati',
              actionLink: '/register',
            ),
            const Spacer(flex: 1), // Spazio inferiore
          ],
        ),
      ),
    );
  }
}
