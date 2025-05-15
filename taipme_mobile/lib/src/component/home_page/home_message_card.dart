import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taipme_mobile/route/route.dart';
import 'package:taipme_mobile/src/component/button/secondary_button.dart';
import 'package:taipme_mobile/src/component/text/type_writter.dart';
import 'package:taipme_mobile/src/controller/typing_controller/typing_controller.dart';
import 'package:taipme_mobile/src/model/data_model/message_model_list/message_model/message_model.dart';
import 'package:taipme_mobile/src/theme/styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeMessageCard extends ConsumerStatefulWidget {
  const HomeMessageCard({super.key, required this.message});

  final MessageModel message;

  @override
  ConsumerState<HomeMessageCard> createState() => _HomeMessageCardState();
}

class _HomeMessageCardState extends ConsumerState<HomeMessageCard> {
  @override
  Widget build(BuildContext context) {
    final bool isTypingComplete = ref.watch(isTypingCompleteProvider(widget.message.idMsg.toString())); 

        WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!isTypingComplete) {
        ref.read(charIndexProvider(widget.message.desMsg ?? '').notifier).reset();
        ref
            .read(
                typingTimerProvider(const Duration(milliseconds: 90), widget.message.idMsg.toString()).notifier)
            .start(widget.message.desMsg ?? '');
      }
    });

    return Container(
      margin: const EdgeInsets.fromLTRB(8, 16, 8, 16),
      padding: const EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width * 0.85,
      decoration: BoxDecoration(
        border: Border.all(color: TaipmeStyle.inputFieldBorderColor),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 75,
            child: TypeWriter(fullText: widget.message.desMsg ?? '', id: widget.message.idMsg.toString()),
          ),
          Expanded(
            flex: 10,
            child: Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {
                  debugPrint("Reporting message ${widget.message}");
                  ref
                    .read(goRouterProvider)
                    .go('/report-page', extra: widget.message);
                },
                icon: Icon(
                  Icons.info_outline,
                  color: TaipmeStyle.primaryColor,
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            flex: 15,
            child: SecondaryButton(
              title: '_${AppLocalizations.of(context)!.answer}',
              onPressed: () {},
              icon: Icons.send,
              shouldRotate: true,
            ),
          )
        ],
      ),
    );
  }
}
