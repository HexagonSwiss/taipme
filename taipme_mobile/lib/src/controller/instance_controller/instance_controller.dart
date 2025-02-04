
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'instance_controller.g.dart';

// NORMAL PROVIDERS

// @riverpod
// AppLinks appLinks(ref) => AppLinks();

@riverpod
void exceptionInstance(Ref ref) => throw Exception('ExceptionProvider is called'); // TEST ONLY

@riverpod
SharedPreferencesAsync sharedPreferences(Ref ref) => SharedPreferencesAsync();

@riverpod
Future<void> orientationInitialization(Ref ref) async => await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);


// // FUTURE

// @riverpod
// FutureOr<void> initializeAppCheck(Ref ref) async {
//   debugPrint('Controller: initializeAppCheck is called');
//   final AndroidProvider androidProvider;
//   final AppleProvider appleProvider;

//   if (kDebugMode) {
//     debugPrint('Controller: AppleProvider.debug && AndroidProvider.debug');
//     androidProvider = AndroidProvider.debug;
//     appleProvider = AppleProvider.debug;
//   } else {
//     debugPrint('Controller: AppleProvider.appAttest && AndroidProvider.playIntegrity');
//     androidProvider = AndroidProvider.playIntegrity;
//     appleProvider = AppleProvider.appAttest;
//   }

//   return;
// }

// KEEP ALIVE PROVIDERS

@Riverpod(keepAlive: true)
class LocaleController extends _$LocaleController {
  @override
  Locale build() => Locale('it');

  Future<void> setLocale(Locale newLocale) async {
    SharedPreferencesAsync sharedPreferencesAsync = SharedPreferencesAsync();
    await sharedPreferencesAsync.setString('locale', newLocale.languageCode);
    debugPrint('Controller: locale value after setting it is ${newLocale.languageCode}');
    state = newLocale;
  }

  Future<void> getLocale() async {
    SharedPreferencesAsync sharedPreferencesAsync = SharedPreferencesAsync();
    String? locale = await sharedPreferencesAsync.getString('locale');
    if (locale != null) {
      debugPrint('Controller: locale value after getting it from local is $locale');
      state = Locale(locale);
    }
  }
}

// FUTURE KEEP ALIVE PROVIDERS

// @Riverpod(keepAlive: true)
// Stream<Uri> deepLinkStream(Ref ref) async* {
//   debugPrint('Controller: deepLinkStream is called');
//   final appLinks = ref.read(appLinksProvider);
//   await for (Uri uri in appLinks.uriLinkStream) {
//     debugPrint('Controller: LinkSuscription: uri from stream is: $uri');
//     ref.read(goRouterProvider).go(uri.path);
//     yield uri;
//   }
// }
