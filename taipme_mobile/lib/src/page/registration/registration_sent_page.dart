import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taipme_mobile/route/route.dart';
import 'package:taipme_mobile/src/component/button/footer_actions.dart';
import 'package:taipme_mobile/src/component/page_structure/static_page_structure.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RegistrationSentPage extends ConsumerStatefulWidget {
  const RegistrationSentPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RegistrationSentPageState();
}

class _RegistrationSentPageState extends ConsumerState<RegistrationSentPage> {
  @override
  Widget build(BuildContext context) {
    return StaticPageStructure(
      title: '_${AppLocalizations.of(context)!.registration}',
      description: AppLocalizations.of(context)!.registrationSuccessMessage,
      footer: FooterActions(
        title: AppLocalizations.of(context)!.returnToLogin,
        titleCallback: () => ref.read(goRouterProvider).go('/login'),
      ),
    );
  }
}
