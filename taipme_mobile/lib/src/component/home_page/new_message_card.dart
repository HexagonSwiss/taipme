import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taipme_mobile/src/theme/styles.dart';
import 'package:taipme_mobile/l10n/app_localizations.dart';

class NewMessageCard extends ConsumerStatefulWidget {
  const NewMessageCard({
    super.key,
    required this.controller,
    this.isReply = false,
  });

  final TextEditingController controller;
  final bool isReply;

  @override
  ConsumerState<NewMessageCard> createState() => _NewMessageCardState();
}

class _NewMessageCardState extends ConsumerState<NewMessageCard> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      focusNode: _focusNode,
      maxLines: 10,
      minLines: 10,
      style: TextStyle(
        color: TaipmeStyle.primaryColor,
      ),
      decoration: InputDecoration(
        hintText: !widget.isReply
            ? AppLocalizations.of(context)!.shareYourThoughts
            : AppLocalizations.of(context)!.replyToMessage,
        hintStyle: TextStyle(color: TaipmeStyle.primaryColor),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(TaipmeStyle.lightRadius),
          borderSide: BorderSide(color: TaipmeStyle.inputFieldBorderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(TaipmeStyle.lightRadius),
          borderSide: BorderSide(
            color: TaipmeStyle.inputFieldBorderColor,
            width: 1.5,
          ),
        ),
      ),
    );
  }
}
