import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taipme_mobile/route/route.dart';
import 'package:taipme_mobile/src/component/custom_footer.dart';
import 'package:taipme_mobile/src/component/custom_header.dart';
import 'package:taipme_mobile/src/component/menu.dart';
import 'package:taipme_mobile/src/component/message_card.dart';
import 'package:taipme_mobile/src/theme/styles.dart';

class PrivateChatPage extends ConsumerStatefulWidget {
  const PrivateChatPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PrivateChatPageState();
}

class _PrivateChatPageState extends ConsumerState<PrivateChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TaipmeStyle.backgroundColor,
      appBar: CustomHeader(),
      endDrawer: const Menu(),
      bottomNavigationBar: CustomFooter(
        isChatSelected: true,
        isHomeSelected: false,
        isSettingsSelected: false,
      ),
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
                    color: TaipmeStyle.inputFieldTextColor,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            flex: 40,
            child: MessageCard(
              message: 'Primo messagio della chat',
              isReadOnly: true,
              showReportButton: false,
            ),
          ),
          SizedBox(height: 24),
          Expanded(
            flex: 60,
            child: Center(
              child: Text(
                'Chat Messages',
                style: TextStyle(
                  fontSize: 24,
                  color: TaipmeStyle.inputFieldTextColor,
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              '_strappa',
              style: TextStyle(color: TaipmeStyle.inputFieldTextColor),
            ),
          ),
          const Spacer(),
          SizedBox(height: 48),
        ],
      ),
    );
  }
}
