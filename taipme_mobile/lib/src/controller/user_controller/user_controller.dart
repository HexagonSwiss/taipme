import 'package:taipme_mobile/src/controller/instance_controller/instance_controller.dart';
import 'package:taipme_mobile/src/model/data_model/result_model/result_model.dart';
import 'package:taipme_mobile/src/model/data_model/user_model_list/user_login_request_model/user_login_request_model.dart';
import 'package:taipme_mobile/src/model/data_model/user_model_list/user_model/user_model.dart';
import 'package:taipme_mobile/src/model/data_model/user_model_list/user_register_request_model/user_register_request_model.dart';
import 'package:taipme_mobile/src/service/storage_service/storage_service.dart';
import 'package:taipme_mobile/src/service/user_service/user_service.dart';
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
  Future<void> invalidateCachedUser() async {
    await ref.read(storageServiceProvider.notifier).deleteToken();
    state = null;
  }

  Future<ResultModel<UserModel>> loginUser({
    required String email,
    required String password,
  }) async {
    debugPrint('Controller: loginUser is called with: $email and $password');

    final UserLoginRequestModel userRequest = UserLoginRequestModel(
      email: email,
      password: password,
    );

    final result = await ref
        .read(userServiceProvider.notifier)
        .authenticateUser(userRequest: userRequest);

    if (result.error != null) {
      debugPrint('Controller: loginUser error is ${result.error}');
      return ResultModel(error: result.error);
    } else {
      debugPrint('Controller: loginUser result is ${result.data}');
      if (result.data != null) updateCachedUser(result.data!);
      return ResultModel(data: result.data);
    }
  }

  Future<ResultModel<bool>> registerUser({
    String? userName,
    required String email,
    required String password,
  }) async {
    debugPrint('Controller: registerUser is called with: $email and $password');

    final UserRegisterRequestModel userRequest = UserRegisterRequestModel(
      userName: userName,
      email: email,
      password: password,
    );

    final result = await ref
        .read(userServiceProvider.notifier)
        .registerUser(userRequest: userRequest);

    if (result.error != null) {
      debugPrint('Controller: registerUser error is ${result.error}');
      return ResultModel(error: result.error);
    } else {
      debugPrint('Controller: registerUser result is ${result.data}');
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
