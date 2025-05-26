// ignore_for_file: avoid_build_context_in_providers
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taipme_mobile/l10n/app_localizations.dart';

part 'translated_text.g.dart';

@riverpod
class TranslatedText extends _$TranslatedText {
  @override
  void build() {}

  List<String> getintroText(BuildContext context)  {
    return [
      AppLocalizations.of(context)!.introText1,
      AppLocalizations.of(context)!.introText2,
      AppLocalizations.of(context)!.introText3,
    ];
  }
}