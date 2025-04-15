import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taipme_mobile/src/component/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:taipme_mobile/src/component/app_bar/custom_header.dart';
import 'package:taipme_mobile/src/component/menu.dart';
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
    final textStyle = TextStyle(
      color: TaipmeStyle.primaryColor,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    );

    return Scaffold(
      backgroundColor: TaipmeStyle.backgroundColor,
      appBar: CustomHeader(),
      endDrawer: const Menu(),
      bottomNavigationBar: BottomNavBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 24, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hai segnalato correttamente un messaggio offensivo.',
              style: textStyle,
            ),
            const SizedBox(height: 16),
            Text('Grazie!', style: textStyle),
          ],
        ),
      ),
    );
  }
}
