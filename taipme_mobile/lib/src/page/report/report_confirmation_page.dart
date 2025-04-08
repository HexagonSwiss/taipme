import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taipme_mobile/src/component/custom_footer.dart';
import 'package:taipme_mobile/src/component/custom_header.dart';
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
      color: TaipmeStyle.inputFieldTextColor,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    );

    return Scaffold(
      backgroundColor: TaipmeStyle.backgroundColor,
      appBar: CustomHeader(),
      endDrawer: const Menu(),
      bottomNavigationBar: CustomFooter(
        isChatSelected: false,
        isHomeSelected: true,
        isSettingsSelected: false,
      ),
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
