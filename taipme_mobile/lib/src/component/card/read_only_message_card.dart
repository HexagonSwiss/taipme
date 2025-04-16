import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taipme_mobile/route/route.dart';
import 'package:taipme_mobile/src/component/text/type_writter.dart';
import 'package:taipme_mobile/src/theme/styles.dart';

class MessageCard extends ConsumerWidget {
  const MessageCard({
    super.key,
    required this.message,
    this.textAlign = TextAlign.center,
    this.showReportButton = true,
    this.shouldRotate = true,
    this.isReadOnly = false,
    this.title = '_rispondi',
    this.icon = Icons.send,
    this.preLoadedMessage,
    this.onPressed,
  });

  final String message;
  final TextAlign textAlign;
  final bool showReportButton;
  final IconData icon;
  final bool shouldRotate;
  final bool isReadOnly;
  final String? preLoadedMessage;
  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.all(16),
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
            flex: isReadOnly && preLoadedMessage != null ? 100 : 30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: TypeWriter(
                    fullText: message,
                    textAlign: textAlign,
                    textStyle: TextStyle(
                      color: TaipmeStyle.primaryColor,
                    ),
                  ),
                ),
                if (preLoadedMessage != null)
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(
                      preLoadedMessage!,
                      style: TextStyle(
                        color: TaipmeStyle.primaryColor,
                      ),
                      textAlign: textAlign,
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
              flex: !isReadOnly ? 0 : 70,
              child: Column(
                children: [
                  if (showReportButton)
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        onPressed: () => ref
                            .read(goRouterProvider)
                            .go('/report-page', extra: message),
                        icon: Icon(
                          Icons.info_outline,
                          color: TaipmeStyle.primaryColor,
                        ),
                      ),
                    ),
                  if (!isReadOnly)
                    Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              if (onPressed != null) onPressed!();
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: TaipmeStyle.appFooterColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  title,
                                  style: TextStyle(
                                    color: TaipmeStyle.primaryColor,
                                  ),
                                ),
                                const Spacer(), // Spaziatore per spingere l'icona a destra
                                Transform.rotate(
                                  angle:
                                      shouldRotate ? -45 * (3.14159 / 180) : 0,
                                  child: Icon(
                                    icon,
                                    color: TaipmeStyle.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ))
        ],
      ),
    );
  }
}
