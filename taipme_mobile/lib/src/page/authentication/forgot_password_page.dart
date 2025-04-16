import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taipme_mobile/route/route.dart';
import 'package:taipme_mobile/src/component/input_field.dart';
import 'package:taipme_mobile/src/component/page_structure/form_page_structure.dart';
import 'package:taipme_mobile/src/component/button/footer_actions.dart';
import 'package:taipme_mobile/src/controller/form_controller/form_controller.dart';
import 'package:taipme_mobile/src/theme/styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taipme_mobile/src/util/key/key.dart';

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
    return FormPageStructure(
      formKey: forgotPasswordKey,
      title: AppLocalizations.of(context)!.resetPassword,
      formFields: <Widget>[
        Text(
          AppLocalizations.of(context)!.resetPasswordDescription,
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
      ],
      footer: FooterActions(
        supportText: AppLocalizations.of(context)!.loginUserHasNoAccount,
        subtitle: '_${AppLocalizations.of(context)!.registration}',
        subtitleCallback: () => ref.read(goRouterProvider).go('/register'),
      ),
    );
  }
}
