import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taipme_mobile/src/controller/locale_controller/locale_controller.dart';
import 'package:taipme_mobile/src/theme/styles.dart';

class LanguageButton extends ConsumerWidget {
  const LanguageButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeControllerProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: locale.languageCode == 'en'
                ? TaipmeStyle.inputFieldBorderColor
                : null,
          ),
          onPressed: () => ref
              .read(localeControllerProvider.notifier)
              .setLocale(Locale('en')),
          child: Text(
            'EN',
            style: TextStyle(
              fontSize: TaipmeStyle.standardTextSize,
              fontWeight: TaipmeStyle.standardFontWeight,
              color: TaipmeStyle.backgroundColor,
            ),
          ),
        ),
        SizedBox(width: 20),
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: locale.languageCode == 'it'
                ? TaipmeStyle.inputFieldBorderColor
                : null,
          ),
          onPressed: () => ref
              .read(localeControllerProvider.notifier)
              .setLocale(Locale('it')),
          child: Text(
            'IT',
            style: TextStyle(
              fontSize: TaipmeStyle.standardTextSize,
              fontWeight: TaipmeStyle.standardFontWeight,
              color: TaipmeStyle.backgroundColor,
            ),
          ),
        ),
      ],
    );
  }
}
