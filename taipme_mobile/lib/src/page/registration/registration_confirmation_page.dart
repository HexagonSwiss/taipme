import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taipme_mobile/route/route.dart';
import 'package:taipme_mobile/src/component/button/footer_actions.dart';
import 'package:taipme_mobile/src/component/page_structure/static_page_structure.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// TODO: ADD BUSINESS LOGIC TO CONFIRM REGISTRATION

class RegistrationConfirmationPage extends ConsumerStatefulWidget {
  const RegistrationConfirmationPage({super.key, required this.token});

  final String token;

  @override
  ConsumerState<RegistrationConfirmationPage> createState() =>
      _RegistrationConfirmationPageState();
}

class _RegistrationConfirmationPageState
    extends ConsumerState<RegistrationConfirmationPage> {
  @override
  Widget build(BuildContext context) {
    return StaticPageStructure(
      title: AppLocalizations.of(context)!.registrationConfirmedMessage,
      description:
          AppLocalizations.of(context)!.registrationConfirmedDescription,
      footer: FooterActions(
        title: '_${AppLocalizations.of(context)!.login}',
        titleCallback: () => ref.read(goRouterProvider).go('/login'),
      ),
    );
  }
}
