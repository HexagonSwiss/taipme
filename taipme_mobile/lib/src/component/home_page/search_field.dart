import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taipme_mobile/src/theme/styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// HOME PAGE SEARCH FIELD

class SearchField extends ConsumerWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.80,
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
