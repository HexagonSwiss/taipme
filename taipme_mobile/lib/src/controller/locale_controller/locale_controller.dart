import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taipme_mobile/src/controller/instance_controller/instance_controller.dart';

part 'locale_controller.g.dart';

@Riverpod(keepAlive: true)
class LocaleController extends _$LocaleController {
  @override
  Locale build() => Locale('it');

  Future<void> setLocale(Locale newLocale) async {
    await ref.read(sharedPreferencesProvider).setString('locale', newLocale.languageCode);
    debugPrint('Controller: locale value after setting it is ${newLocale.languageCode}');
    state = newLocale;
  }

  Future<void> getLocale() async {
    String? locale = await ref.read(sharedPreferencesProvider).getString('locale');
    if (locale != null) {
      debugPrint('Controller: locale value after getting it from local is $locale');
      state = Locale(locale);
    }
  }
}
