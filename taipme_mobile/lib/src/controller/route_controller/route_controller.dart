
import 'package:taipme_mobile/src/controller/instance_controller/instance_controller.dart';
import 'package:taipme_mobile/src/controller/user_controller/user_controller.dart';
import 'package:taipme_mobile/src/model/data_model/user_model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'route_controller.g.dart';

@riverpod
FutureOr<String?> routeController(Ref ref, {String? backupRoute, bool requiresAuth = false}) async {
  final sharedPref = ref.read(sharedPreferencesProvider);

  try {
    final bool isFirstTime = await ref.read(isFirstTimeProvider.future);
    if (isFirstTime) return '/login-or-register';

    debugPrint('Route: it is not the first time the user opens the app');

    final userId = await sharedPref.getString('user_id');
    final userToken = await sharedPref.getString('auth_token');

    if (requiresAuth == true) {
      if (userToken == null) return backupRoute ?? '/login-or-register';

      debugPrint('Route: user is authenticated $userToken');

      UserModel? currentUser = ref.read(userControllerProvider);

      // if (currentUser == null && userId != null) {
      //   final userResult = await ref.read(userControllerProvider.notifier).getUser(userId);
      //   currentUser = userResult.data;
      // }

      if (currentUser == null) return backupRoute ?? '/login-or-register';

      debugPrint('Route: currentUser id before proceeding to route is ${currentUser.id}');
    }

    return null;
  } catch (e) {
    debugPrint('Route: error in route navigation is: $e');
    return backupRoute ?? '/login-or-register';
  }
}

@riverpod
FutureOr<String?> loginOrRegisterRouteController(Ref ref) async {
  // final sharedPref = ref.read(sharedPreferencesProvider);
  // final userId = await sharedPref.getString('user_id');
  // final userToken = await sharedPref.getString('auth_token');

  // if (userToken == null) null;

  // debugPrint('Route: user is authenticated');

  // UserModel? currentUser = ref.read(userControllerProvider);

  // // if (currentUser == null && userId != null) {
  // //   final userResult = await ref.read(userControllerProvider.notifier).getUser(userId);
  // //   currentUser = userResult.data;
  // // }

  // if (currentUser == null) return null;

  // debugPrint('Route: currentUser id before proceeding to route is ${currentUser.id}');

  return '/chat-home-page';
}
