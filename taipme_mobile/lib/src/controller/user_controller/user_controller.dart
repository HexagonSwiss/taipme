import 'package:taipme_mobile/src/controller/instance_controller/instance_controller.dart';
import 'package:taipme_mobile/src/model/data_model/result_model/result_model.dart';
import 'package:taipme_mobile/src/model/data_model/user_model_list/user_change_password_model/user_change_password_model.dart';
import 'package:taipme_mobile/src/model/data_model/user_model_list/user_login_request_model/user_login_request_model.dart';
import 'package:taipme_mobile/src/model/data_model/user_model_list/user_model/user_model.dart';
import 'package:taipme_mobile/src/model/data_model/user_model_list/user_register_request_model/user_register_request_model.dart';
import 'package:taipme_mobile/src/model/data_model/user_model_list/user_register_response_model/user_register_response_model.dart';
import 'package:taipme_mobile/src/model/data_model/user_model_list/user_request_password_model/user_request_password_model.dart';
import 'package:taipme_mobile/src/service/storage_service/storage_service.dart';
import 'package:taipme_mobile/src/service/user_service/user_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taipme_mobile/src/util/helper/snackbar/snackbar.dart';

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

    final error = result.error;
    final data = result.data;

    if (error != null) {
      debugPrint('Controller: loginUser error is ${result.error}');
      ref.read(snackBarProvider(text: error));
      return ResultModel(error: result.error);
    } else {
      debugPrint('Controller: loginUser result is ${result.data}');
      if (data != null) updateCachedUser(data);
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

    final ResultModel<UserRegisterResponseModel> result = await ref
        .read(userServiceProvider.notifier)
        .registerUser(userRequest: userRequest);

    final error = result.error;

    if (error != null) {
      debugPrint('Controller: registerUser error is ${result.error}');
      ref.read(snackBarProvider(text: error));
      return ResultModel(error: result.error);
    } else {
      debugPrint('Controller: registerUser result is ${result.data}');
      return ResultModel(data: true);
    }
  }

  Future<ResultModel<String>> requestPasswordReset({
    required String email,
  }) async {
    debugPrint('Controller: requestPasswordReset is called with: $email');

    final UserRequestPasswordModel userRequest = UserRequestPasswordModel(
      email: email,
    );

    final result = await ref
        .read(userServiceProvider.notifier)
        .requestPasswordReset(userRequest: userRequest);

    final data = result.data;
    final error = result.error;

    if (error != null || data == null) {
      debugPrint('Controller: requestPasswordReset error is ${result.error}');
      ref.read(snackBarProvider(text: error ?? 'Errore sconosciuto, riprova'));
      return ResultModel(error: result.error);
    } else {
      debugPrint('Controller: requestPasswordReset result is ${result.data}');
      return ResultModel(data: data.message);
    }
  }

  Future<ResultModel<String>> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    debugPrint('Controller: changePassword is called.');

    final UserChangePasswordModel changePasswordRequest =
        UserChangePasswordModel(
      currentPassword: currentPassword,
      newPassword: newPassword,
    );

    final result = await ref
        .read(userServiceProvider.notifier)
        .changePassword(changePasswordRequest: changePasswordRequest);

    if (result.error != null) {
      debugPrint('Controller: changePassword error is ${result.error}');
      ref.read(snackBarProvider(text: result.error!));
      return ResultModel(error: result.error);
    } else {
      debugPrint('Controller: changePassword result is ${result.data}');
      ref.read(
        snackBarProvider(text: 'Password cambiata!', successOrFail: true),
      );
      return ResultModel(data: "Password changed successfully.");
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
