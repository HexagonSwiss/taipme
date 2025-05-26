import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taipme_mobile/route/route.dart';
import 'package:taipme_mobile/src/component/page_structure/static_page_structure.dart';
import 'package:taipme_mobile/src/component/button/footer_actions.dart';
import 'package:taipme_mobile/l10n/app_localizations.dart';

class ForgotPasswordSentPage extends ConsumerWidget {
  const ForgotPasswordSentPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StaticPageStructure(
      title: '_${AppLocalizations.of(context)!.resetPassword}',
      description:
          AppLocalizations.of(context)!.forgotPasswordEmailSentDescription,
      footer: FooterActions(
        title: '_${AppLocalizations.of(context)!.returnToLogin}',
        titleCallback: () => ref.read(goRouterProvider).go('/login'),
      ),
    );
  }
}
