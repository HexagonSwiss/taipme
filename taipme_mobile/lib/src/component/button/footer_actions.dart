import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taipme_mobile/src/theme/styles.dart';

class FooterActions extends ConsumerWidget {
  const FooterActions({
    super.key,
    this.title,
    this.titleCallback,
    this.subtitle,
    this.subtitleCallback,
    this.supportText,
  });

  final String? title;
  final Function? titleCallback;
  final String? supportText;
  final String? subtitle;
  final Function? subtitleCallback;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (title != null)
        TextButton(
          onPressed: () => titleCallback != null ? titleCallback!() : null,
          child: Text(
            textAlign: TextAlign.center,
            title!,
            style: TextStyle(
              color: TaipmeStyle.primaryColor,
              fontSize: TaipmeStyle.standardTextSize,
            ),
          ),
        ),
        SizedBox(height: 16),
        if (supportText != null)
          Text(
            supportText!,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: TaipmeStyle.primaryColor,
              fontSize: TaipmeStyle.standardTextSize,
            ),
          ),
        if (supportText != null) SizedBox(height: 16),
        if (subtitle != null)
          TextButton(
            onPressed: () {
              subtitleCallback != null ? subtitleCallback!() : null;
            },
            child: Text(
              subtitle!,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: TaipmeStyle.primaryColor,
                fontSize: TaipmeStyle.standardTextSize,
              ),
            ),
          ),
      ],
    );
  }
}
