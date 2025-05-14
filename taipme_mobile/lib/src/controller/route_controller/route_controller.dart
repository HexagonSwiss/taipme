import 'package:taipme_mobile/src/controller/user_controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taipme_mobile/src/model/data_model/result_model/result_model.dart';
import 'package:taipme_mobile/src/service/storage_service/storage_service.dart';

part 'route_controller.g.dart';

@riverpod
FutureOr<String?> routeController(Ref ref, {bool requiresAuth = true}) async {
  debugPrint('Route: routeController is called');

  try {
    final bool isFirstTime = await ref.read(isFirstTimeProvider.future);
    if (isFirstTime) return '/login-or-register';

    debugPrint('Route: it is not the first time the user opens the app');

    final ResultModel<String?> userToken =
        await ref.read(storageServiceProvider.notifier).getToken();
    final String? userTokenData = userToken.data;

    debugPrint('Route: userToken is $userTokenData');

    if (requiresAuth == true) {
      debugPrint('Route: requiresAuth is true');

      if (userTokenData == null) return '/login-or-register';

      debugPrint('Route: user is authenticated in a private route');

      return null;
    }

    debugPrint('Route: requiresAuth is false');

    return null;
  } catch (e) {
    debugPrint('Route: error in route navigation is: $e');
    return '/login-or-register';
  }
}
