import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taipme_mobile/src/theme/styles.dart';

class DrawerItem extends ConsumerWidget {
  const DrawerItem({
    super.key,
    required this.title,
    required this.onPressed,
  });

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
      onPressed: onPressed,
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: TaipmeStyle.standardTextSize,
              fontWeight: TaipmeStyle.standardFontWeight,
              color: TaipmeStyle.backgroundColor,
            ),
          ),
        ],
      ),
    );
  }
}