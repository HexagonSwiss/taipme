import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taipme_mobile/src/component/text/page_title.dart';
import 'package:taipme_mobile/src/theme/styles.dart';

class StaticPageStructure extends ConsumerWidget {
  const StaticPageStructure({
    super.key,
    required this.title,
    required this.description,
    this.footer,
  });

  final String title;
  final String description;
  final Widget? footer;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: TaipmeStyle.backgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            const Spacer(flex: 2),
            PageTitle(title: title),
            const Spacer(flex: 1),
            Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: TaipmeStyle.standardTextSize,
                color: TaipmeStyle.primaryColor,
              ),
            ),
            const Spacer(flex: 2),
            if (footer != null) ...[
              footer!,
            ],
            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
