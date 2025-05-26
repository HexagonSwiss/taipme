import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taipme_mobile/route/route.dart';
import 'package:taipme_mobile/src/component/button/primary_button.dart';
import 'package:taipme_mobile/src/component/text/type_writter.dart';
import 'package:taipme_mobile/src/controller/paper_controller/paper_controller.dart';
import 'package:taipme_mobile/src/controller/typing_controller/typing_controller.dart';
import 'package:taipme_mobile/src/model/data_model/paper_model_list/message_model/message_model.dart';
import 'package:taipme_mobile/src/model/data_model/paper_model_list/paper_action_flags_model/paper_action_flags_model.dart';
import 'package:taipme_mobile/src/model/data_model/paper_model_list/paper_content_model/paper_content_model.dart';
import 'package:taipme_mobile/src/theme/styles.dart';
import 'package:taipme_mobile/l10n/app_localizations.dart';

class HomeMessageCard extends ConsumerStatefulWidget {
  const HomeMessageCard({super.key, required this.selectedPaperId});

  final int selectedPaperId;

  @override
  ConsumerState<HomeMessageCard> createState() => _HomeMessageCardState();
}

class _HomeMessageCardState extends ConsumerState<HomeMessageCard> {
  ValueKey _typeWriterKey = const ValueKey('initial');

  @override
  Widget build(BuildContext context) {
    final AsyncValue<PaperContentModel> paperContentAsync =
        ref.watch(fetchPaperContentProvider(widget.selectedPaperId));

    return Container(
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: TaipmeStyle.backgroundColor,
        borderRadius: BorderRadius.circular(18.0),
        border: Border.all(
          color: TaipmeStyle.primaryColor,
          width: 0.5,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
        child: paperContentAsync.when(
          loading: () => const Center(child: CircularProgressIndicator.adaptive()),
          error: (Object e, StackTrace st) {
            debugPrint(
              "HomeMessageCard: Error loading content for paper ${widget.selectedPaperId}: $e\n$st",
            );
            return Center(
              child: Text("Error loading paper content: ${e.toString()}"),
            );
          },
          data: (PaperContentModel content) {
            final MessageModel? currentMessage = content.mainMessage;
            final String messageIdKey = currentMessage?.idMsg.toString() ??
                'empty_paper_${widget.selectedPaperId}';

            if (_typeWriterKey.value != messageIdKey) {
              debugPrint(
                "HomeMessageCard: Message ID changed or new message. Resetting TypeWriter. OldKey: ${_typeWriterKey.value}, NewKey: $messageIdKey",
              );
              _typeWriterKey = ValueKey(messageIdKey);
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (mounted) {
                  debugPrint(
                    "HomeMessageCard: adding post frame callback to reset typing state",
                  );
                  ref
                      .read(isTypingCompleteProvider(messageIdKey).notifier)
                      .resetTypingComplete();
                  ref
                      .read(charIndexProvider(currentMessage?.desMsg ?? '')
                          .notifier)
                      .reset();
                  ref
                      .read(typingTimerProvider(
                              const Duration(milliseconds: 90), messageIdKey)
                          .notifier)
                      .start(currentMessage?.desMsg ?? '');
                }
              });
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${content.paperTitle}:',
                  style: const TextStyle(
                    color: TaipmeStyle.primaryColor,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 24),
                if (currentMessage != null)
                  Expanded(
                    flex: 75,
                    child: TypeWriter(
                      key: _typeWriterKey,
                      fullText: currentMessage.desMsg ?? '',
                      id: messageIdKey,
                    ),
                  )
                else
                  const Expanded(
                    flex: 75,
                    child: Center(
                      child: Text(
                        "This paper is empty or no public messages to display.",
                      ),
                    ),
                  ),
                if (currentMessage == null) const Spacer(flex: 10),
                const SizedBox(height: 16),
                Expanded(
                  flex: 15,
                  child: _buildActionButtons(
                    context,
                    ref,
                    content.actionFlags,
                    widget.selectedPaperId,
                    currentMessage,
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildActionButtons(
    BuildContext context,
    WidgetRef ref,
    PaperActionFlagsModel flags,
    int currentPaperId,
    MessageModel? currentMessage,
  ) {
    List<Widget> buttons = [];
    final localizations = AppLocalizations.of(context)!;
    final mainMessageId = currentMessage?.idMsg;

    if (flags.canReadOtherRandomMessages) {
      buttons.add(
        Expanded(
          child: PrimaryButton(
            title: '_${localizations.read}',
            onPressed: () {
              debugPrint(
                "Action: Read other random messages for paper $currentPaperId",
              );
              ref.refresh(fetchPaperContentProvider(currentPaperId));
            },
          ),
        ),
      );
    }

    if (flags.canWriteNewOnThisPaper) {
      buttons.add(
        Expanded(
          child: PrimaryButton(
            title: '_${localizations.writeNew}',
            onPressed: () {
              debugPrint("Action: Write new on paper $currentPaperId");
              ref
                  .read(goRouterProvider)
                  .go('/new-message-page/$currentPaperId');
            },
          ),
        ),
      );
    }

    if (flags.canReplyToMainMessage && mainMessageId != null) {
      buttons.add(
        Expanded(
          child: PrimaryButton(
            title: '_${localizations.reply}',
            onPressed: () {
              debugPrint(
                "Action: Reply to message $mainMessageId on paper $currentPaperId",
              );
              ref
                  .read(goRouterProvider)
                  .go('/reply-message-page/$currentPaperId/$mainMessageId');
            },
          ),
        ),
      );
    }

    if (flags.canTearMainMessage && mainMessageId != null) {
      buttons.add(
        Expanded(
          child: PrimaryButton(
            title: '_${AppLocalizations.of(context)!.tear}',
            onPressed: () async {
              debugPrint(
                "Action: Tear paper/message $mainMessageId on paper $currentPaperId",
              );
              // TODO: Implement call to a controller method for tearing the paper/message
            },
          ),
        ),
      );
    }

    if (flags.canReportMainMessage && mainMessageId != null) {
      buttons.add(
        Expanded(
          child: IconButton(
            icon: const Icon(Icons.report),
            color: TaipmeStyle.primaryColor,
            onPressed: () async {
              debugPrint(
                "Action: Report message ${currentMessage?.idMsg} on paper ${widget.selectedPaperId}",
              );
              ref
                  .read(goRouterProvider)
                  .go('/report-page', extra: currentMessage);
            },
          ),
        ),
      );
    }

    if (buttons.isEmpty) return const Center(child: SizedBox.shrink());

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: buttons
          .map(
            (button) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: button,
            ),
          )
          .toList(),
    );
  }
}
