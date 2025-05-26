import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taipme_mobile/route/route.dart';
import 'package:taipme_mobile/src/component/button/primary_button.dart';
import 'package:taipme_mobile/src/component/home_page/new_message_card.dart';
import 'package:taipme_mobile/src/component/page_structure/logged_page_structure.dart';
import 'package:taipme_mobile/src/controller/form_controller/form_controller.dart';
import 'package:taipme_mobile/src/controller/paper_controller/paper_controller.dart';
import 'package:taipme_mobile/src/theme/styles.dart';
import 'package:taipme_mobile/l10n/app_localizations.dart';
import 'package:taipme_mobile/src/util/key/key.dart';

class NewMessagePage extends ConsumerStatefulWidget {
  const NewMessagePage({
    super.key,
    required this.paperId,
    this.messageIdToReplyTo,
  });

  final int paperId;
  final int? messageIdToReplyTo;

  @override
  ConsumerState<NewMessagePage> createState() => _NewMessagePageState();
}

class _NewMessagePageState extends ConsumerState<NewMessagePage> {
  final TextEditingController _textController = TextEditingController();
  bool _isReply = false;

  @override
  void initState() {
    _isReply = widget.messageIdToReplyTo != null;
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LoggedPageStructure(
      child: Form(
        key: messageKey,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () => ref.read(goRouterProvider).go('/'),
                child: Text(
                  '_${AppLocalizations.of(context)!.goBack}',
                  style: TextStyle(
                    color: TaipmeStyle.primaryColor,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            NewMessageCard(
              controller: _textController,
              isReply: _isReply,
            ),
            SizedBox(height: 24),
            PrimaryButton(
              title: AppLocalizations.of(context)!.publish,
              onPressed: () async {
                await ref.read(formControllerProvider.notifier).handleForm(
                  globalKey: messageKey,
                  context: context,
                  actions: [
                    () async => !_isReply
                        ? await ref
                            .read(paperActionsControllerProvider.notifier)
                            .createNewMessage(
                              paperId: widget.paperId,
                              content: _textController.text,
                            )
                        : await ref
                            .read(paperActionsControllerProvider.notifier)
                            .replyToExistingMessage(
                              paperId: widget.paperId,
                              messageIdToReplyTo: widget.messageIdToReplyTo!,
                              replyContent: _textController.text,
                            )
                  ],
                  onEnd: [
                    () => ref.read(goRouterProvider).go('/'),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
