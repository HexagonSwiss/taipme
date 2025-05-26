import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taipme_mobile/route/route.dart';
import 'package:taipme_mobile/src/component/button/footer_actions.dart';
import 'package:taipme_mobile/src/component/page_structure/static_page_structure.dart';
import 'package:taipme_mobile/l10n/app_localizations.dart';

// TODO: ADD BUSINESS LOGIC TO CONFIRM PASSWORD UPDATE

class PasswordUpdateConfirmationPage extends ConsumerStatefulWidget {
  const PasswordUpdateConfirmationPage({super.key, required this.token});

  final String token;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PasswordUpdateConfirmationPageState();
}

class _PasswordUpdateConfirmationPageState
    extends ConsumerState<PasswordUpdateConfirmationPage> {
  @override
  Widget build(BuildContext context) {
    return StaticPageStructure(
      title: AppLocalizations.of(context)!.passwordUpdatedSuccessfully,
      description:
          AppLocalizations.of(context)!.passwordUpdatedSuccessfullyDescription,
      footer: FooterActions(
        title: '_${AppLocalizations.of(context)!.returnToLogin}',
        titleCallback: () => ref.read(goRouterProvider).go('/login'),
      ),
    );
  }
}
