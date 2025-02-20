import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taipme_mobile/route/route.dart';
import 'package:taipme_mobile/src/theme/styles.dart';

class FooterInput extends ConsumerStatefulWidget {
  final String title;
  final String titleLink;
  final String state;
  final String action;
  final String actionLink;

  const FooterInput({super.key, required this.title, required this.titleLink, required this.state, required this.action, required this.actionLink});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FooterInputState();
  
}

class _FooterInputState extends ConsumerState<FooterInput> {
   
  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print("ChatHomePAGE!");
    } // Log durante il build
    return Column(
      children: [
        TextButton(
           onPressed: () => ref.read(goRouterProvider).go(widget.titleLink),
          child: Text(
            textAlign: TextAlign.center, 
            widget.title,
            style: TextStyle(
              color: TaipmeStyle.primaryColor,
              fontSize: TaipmeStyle.miniTextSize,
            ),
          ),
        ),
        SizedBox(height: 20), // Spazio verticale
        Text(
          widget.state,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: TaipmeStyle.primaryColor,
            fontSize: TaipmeStyle.miniTextSize
          ),
        ),
        TextButton(
          onPressed: () => ref.read(goRouterProvider).go(widget.actionLink),
          child: Text(
            widget.action,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: TaipmeStyle.primaryColor,
              fontSize: TaipmeStyle.miniTextSize
            ),
          ),
        ),
      ],
    );
  }
}
