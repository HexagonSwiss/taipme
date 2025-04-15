import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taipme_mobile/src/controller/form_controller/form_controller.dart';
import 'package:taipme_mobile/src/theme/styles.dart';

class PrimaryButton extends ConsumerStatefulWidget {
  const PrimaryButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  final String title;
  final Function onPressed;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends ConsumerState<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    final bool canClick = ref.watch(formControllerProvider);

    return TextButton(
      onPressed: !canClick
          ? null
          : () async {
              await widget.onPressed();
            },
      child: !canClick
          ? CircularProgressIndicator()
          : Text(
              textAlign: TextAlign.center,
              '_accedi',
              style: TextStyle(
                color: TaipmeStyle.primaryColor,
                fontSize: TaipmeStyle.standardTextSize,
              ),
            ),
    );
  }
}
