
import 'dart:io';
import 'package:taipme_mobile/src/controller/instance_controller/instance_controller.dart';
import 'package:taipme_mobile/src/model/data_model/result_model/result_model.dart';
import 'package:taipme_mobile/src/model/data_model/user_model/user.dart';
import 'package:taipme_mobile/src/repository/user_repository/user_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'user_controller.g.dart';

@Riverpod(keepAlive: true)
class UserController extends _$UserController {
  @override
  UserModel? build() => null;

  // STATE

  void updateCachedUser(UserModel user) => state = user;
  void invalidateCachedUser() => state = null;

  Future<ResultModel<String>> loginUser({required String email, required String password}) async {
    debugPrint('Controller: loginUser is called - Email: $email, Password: $password');
    final result = await ref.read(userRepositoryProvider.notifier).loginUser(email: email, password: password);

  if (result.error != null) {
      debugPrint('Controller: loginUser error is ${result.error}');
      return ResultModel(error: result.error);
    } else {
      debugPrint('Controller: loginUser result is ${result.data}');
      return ResultModel(data: result.data);
    }
  }
}

// READ REACTIVELY

@riverpod
Future<bool> isFirstTime(Ref ref) async {
  debugPrint('Controller: isFirstTime is called');
  final SharedPreferencesAsync prefs = ref.read(sharedPreferencesProvider);
  final bool isFirstTime = await prefs.getBool('is_first_time') ?? true;
  if (isFirstTime) prefs.setBool('is_first_time', false);
  debugPrint('Controller: isFirstTime is $isFirstTime');
  return isFirstTime;
}
