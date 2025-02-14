import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_initialization.g.dart';

@Riverpod(keepAlive: true)
Future<void> appInitialization(Ref ref) async {
  // ref.onDispose(() {
  //   ref.invalidate(locationPermissionProvider);
  //   ref.invalidate(orientationInitializationProvider);
  //   ref.invalidate(notificationControllerProvider);
  //   ref.invalidate(initializeCrashlyticsProvider);
  //   // ref.invalidate(initializeAppCheckProvider);
  //   ref.invalidate(localeControllerProvider);
  // });

  // // All synchronous app initialization code should belong here:
  // ref.read(initializeCrashlyticsProvider);

  // debugPrint('Controller: appInitialization initialized all sync providers');

  // // All asynchronous app initialization code should belong here:
  // await Future.wait([
  //   // ref.watch(initializeAppCheckProvider.future),
  //   ref.watch(orientationInitializationProvider.future),
  //   ref.read(notificationControllerProvider.notifier).initNotifications(),
  //   ref.read(localeControllerProvider.notifier).getLocale(),
  // ]);

  // debugPrint('Controller: appInitialization initialized non-permission async providers');

  // await ref.watch(locationPermissionProvider.future);

  // debugPrint('Controller: appInitialization initialized location permission provider');
}