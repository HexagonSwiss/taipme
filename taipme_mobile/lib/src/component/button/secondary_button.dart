import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taipme_mobile/src/theme/styles.dart';

class SecondaryButton extends ConsumerWidget {
  const SecondaryButton({
    super.key,
    required this.title,
    required this.onPressed,
    required this.icon,
    this.shouldRotate = false,
    this.left = 0,
    this.right = 0,
    this.top = 0,
    this.bottom = 0,
  });

  final String title;
  final Function onPressed;
  final IconData icon;
  final bool shouldRotate;
  final double left;
  final double right;
  final double top;
  final double bottom;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.80,
      child: TextButton(
        onPressed: () => onPressed(),
        style: TextButton.styleFrom(
          backgroundColor: TaipmeStyle.appFooterColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: Row(
          children: [
            Text(
              title,
              style: TextStyle(color: TaipmeStyle.primaryColor),
            ),
            const Spacer(),
            Transform.rotate(
              angle: shouldRotate ? -45 * (3.14159 / 180) : 0,
              child: Icon(icon, color: TaipmeStyle.primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
