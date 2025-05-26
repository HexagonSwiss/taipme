import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taipme_mobile/src/theme/styles.dart';
import 'package:taipme_mobile/l10n/app_localizations.dart';

class SearchField extends ConsumerWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.9,
      child: TextField(
        style: const TextStyle(
          color: TaipmeStyle.primaryColor,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          hintText: '#${AppLocalizations.of(context)!.search}',
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: TaipmeStyle.inputFieldBorderColor),
          ),
        ),
      ),
    );
  }
}
