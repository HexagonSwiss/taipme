import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taipme_mobile/route/route.dart';
import 'package:taipme_mobile/src/component/button/primary_button.dart';
import 'package:taipme_mobile/src/component/home_page/new_message_card.dart';
import 'package:taipme_mobile/src/component/page_structure/logged_page_structure.dart';
import 'package:taipme_mobile/src/controller/paper_controller/paper_controller.dart';
import 'package:taipme_mobile/src/theme/styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NewMessagePage extends ConsumerStatefulWidget {
  const NewMessagePage({super.key, required this.paperId});

  final int paperId;

  @override
  ConsumerState<NewMessagePage> createState() => _NewMessagePageState();
}

class _NewMessagePageState extends ConsumerState<NewMessagePage> {
  TextEditingController textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LoggedPageStructure(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton(
              onPressed: () => ref.read(goRouterProvider).go('/home-page'),
              child: Text(
                '_${AppLocalizations.of(context)!.goBack}',
                style: TextStyle(
                  color: TaipmeStyle.primaryColor,
                ),
              ),
            ),
          ),
          SizedBox(height: 24),
          NewMessageCard(controller: textController),
          SizedBox(height: 24),
          PrimaryButton(
            title: AppLocalizations.of(context)!.publish,
            onPressed: () async {
              await ref
                  .read(paperActionsControllerProvider.notifier)
                  .createNewMessage(
                    paperId: widget.paperId,
                    content: textController.text,
                  );

              ref.read(goRouterProvider).go('/');
            },
          ),
        ],
      ),
    );
  }
}
