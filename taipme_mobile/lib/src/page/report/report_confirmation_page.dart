import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taipme_mobile/l10n/app_localizations.dart';
import 'package:taipme_mobile/route/route.dart';
import 'package:taipme_mobile/src/component/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:taipme_mobile/src/component/app_bar/custom_header.dart';
import 'package:taipme_mobile/src/component/button/primary_button.dart';
import 'package:taipme_mobile/src/component/drawer/end_drawer.dart';
import 'package:taipme_mobile/src/theme/styles.dart';

class ReportConfirmationPage extends ConsumerStatefulWidget {
  const ReportConfirmationPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ReportConfirmationPageState();
}

class _ReportConfirmationPageState
    extends ConsumerState<ReportConfirmationPage> {
  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = TextStyle(
      color: TaipmeStyle.primaryColor,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    );

    return Scaffold(
      backgroundColor: TaipmeStyle.backgroundColor,
      appBar: CustomHeader(),
      endDrawer: const EndDrawer(),
      bottomNavigationBar: BottomNavBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 24, 0, 0),
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppLocalizations.of(context)!.reportConfirmationMessage,
                style: textStyle,
              ),
              const SizedBox(height: 16),
              Text(
                AppLocalizations.of(context)!.reportConfirmationThanks,
                style: textStyle,
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),
              Center(
                child: PrimaryButton(
                  title: '_${AppLocalizations.of(context)!.goBack}',
                  onPressed: () => ref.read(goRouterProvider).go('/'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
