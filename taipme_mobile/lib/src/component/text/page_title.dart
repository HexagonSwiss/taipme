import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taipme_mobile/src/theme/styles.dart';

class PageTitle extends ConsumerWidget {
  final String title;

  const PageTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(
      title,
      style: TextStyle(
        fontSize: TaipmeStyle.largeTextSize,
        color: TaipmeStyle.primaryColor,
        fontWeight: TaipmeStyle.standardFontWeight,
      ),
      textAlign: TextAlign.center,
    );
  }
}
