import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taipme_mobile/src/controller/form_controller/form_controller.dart';
import 'package:taipme_mobile/src/theme/styles.dart';

class PrimaryButton extends ConsumerWidget {
  const PrimaryButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool canClick = ref.watch(formControllerProvider);

    return TextButton(
      onPressed: !canClick
          ? null
          : () async {
              await onPressed();
            },
      child: !canClick
          ? CircularProgressIndicator.adaptive()
          : Text(
              textAlign: TextAlign.center,
              title,
              style: TextStyle(
                color: TaipmeStyle.primaryColor,
                fontSize: TaipmeStyle.standardTextSize,
              ),
            ),
    );
  }
}
