import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taipme_mobile/route/route.dart';
import 'package:taipme_mobile/src/component/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:taipme_mobile/src/component/app_bar/custom_header.dart';
import 'package:taipme_mobile/src/component/drawer/end_drawer.dart';
import 'package:taipme_mobile/src/component/card/read_only_message_card.dart';
import 'package:taipme_mobile/src/theme/styles.dart';

class ReportPage extends ConsumerStatefulWidget {
  const ReportPage({super.key, required this.message});

  final String message;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ReportPageState();
}

class _ReportPageState extends ConsumerState<ReportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TaipmeStyle.backgroundColor,
      appBar: CustomHeader(),
      endDrawer: const EndDrawer(),
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.85,
            child: Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () => ref.read(goRouterProvider).go('/home-page'),
                child: Text(
                  '_indietro',
                  style: TextStyle(
                    color: TaipmeStyle.primaryColor,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            flex: 30,
            child: MessageCard(
              message: 'Messagio da segnalare',
              textAlign: TextAlign.start,
              showReportButton: false,
              icon: Icons.info_outline,
              shouldRotate: false,
              isReadOnly: true,
              preLoadedMessage: widget.message,
            ),
          ),
          SizedBox(height: 24),
          Expanded(
            flex: 70,
            child: MessageCard(
              message: 'Motivazione (opzionale)',
              textAlign: TextAlign.start,
              showReportButton: false,
              icon: Icons.info_outline,
              shouldRotate: false,
              title: '_segnala',
              onPressed: () => ref.read(goRouterProvider).go(
                    '/report-confirmation-page',
                  ),
            ),
          ),
          SizedBox(height: 24),
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
