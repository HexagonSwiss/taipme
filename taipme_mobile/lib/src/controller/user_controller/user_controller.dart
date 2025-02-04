
import 'dart:io';
import 'package:taipme_mobile/src/controller/instance_controller/instance_controller.dart';
// import 'package:excape_mobile/src/model/data_model/result_model/result_model.dart';
import 'package:taipme_mobile/src/model/data_model/user_model/user.dart';
// import 'package:excape_mobile/src/repository/user_repository/user_repository.dart';
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

  // Future<void> syncCachedUserWithDatabase() async {
  //   final SharedPreferencesAsync prefs = ref.read(sharedPreferencesProvider);
  //   final String? userId = await prefs.getString('user_id');

  //   debugPrint('Controller: syncCachedUserWithDatabase is called with non-null currentUser id $userId');

  //   if (userId == null) {
  //     debugPrint('Controller: syncCachedUserWithDatabase userId is null');
  //     return;
  //   }

  //   final result = await ref.read(userRepositoryProvider.notifier).getUser(userId);

  //   if (result.error != null) {
  //     debugPrint('Controller: syncCachedUserWithDatabase error is ${result.error}');
  //     return;
  //   }

  //   final updatedUser = result.data;
  //   if (updatedUser != null) state = updatedUser;

  //   debugPrint('Controller: syncCachedUserWithDatabase is successful');
  // }

  // // CREATE

  // Future<ResultModel<bool>> registerUser({required String email, required String password, required String name}) async {
  //   debugPrint('Controller: registerUser is called with email: $email, name: $name and password: $password');
  //   final result = await ref.read(userRepositoryProvider.notifier).registerUser(email: email, password: password, name: name);

  //   if (result.error != null) {
  //     debugPrint('Controller: registerUser error is ${result.error}');
  //     return ResultModel(error: result.error);
  //   }

  //   return ResultModel(data: result.data);
  // }

  // // READ

  // Future<ResultModel<bool>> verifyEmail({required String token}) async {
  //   debugPrint('Controller: verifyEmail is called with token: $token');
  //   final result = await ref.read(userRepositoryProvider.notifier).verifyEmail(token: token);

  //   if (result.error != null) {
  //     debugPrint('Controller: verifyEmail error is ${result.error}');
  //     return ResultModel(error: result.error);
  //   }

  //   return ResultModel(data: result.data);
  // }

  // Future<ResultModel<UserModel>> getUser(String userId) async {
  //   debugPrint('Controller: getUser is called with userId: $userId');
  //   final result = await ref.read(userRepositoryProvider.notifier).getUser(userId);

  //   if (result.error != null) {
  //     debugPrint('Controller: getUser error is ${result.error}');
  //     return ResultModel(error: result.error);
  //   }

  //   final UserModel? user = result.data;
  //   if (user == null) {
  //     debugPrint('Controller: getUser user is null');
  //     return ResultModel(error: 'user-is-null');
  //   }

  //   updateCachedUser(user);
  //   return ResultModel(data: user);
  // }

  // Future<ResultModel<UserModel>> getUserByEmail(String email) async {
  //   debugPrint('Controller: getUserByEmail is called with email: $email');
  //   final result = await ref.read(userRepositoryProvider.notifier).getUserByEmail(email);

  //   if (result.error != null) {
  //     debugPrint('Controller: getUserByEmail error is ${result.error}');
  //     return ResultModel(error: result.error);
  //   }

  //   final UserModel? user = result.data;
  //   if (user == null) {
  //     debugPrint('Controller: getUserByEmail user is null');
  //     return ResultModel(error: 'user-is-null');
  //   }

  //   updateCachedUser(user);
  //   return ResultModel(data: user);
  // }

  // // UPDATE

  // Future<ResultModel<bool>> loginUser({required String email, required String password}) async {
  //   debugPrint('Controller: loginUser is called');
  //   final result = await ref.read(userRepositoryProvider.notifier).loginUser(email: email, password: password);

  //   if (result.error != null) {
  //     debugPrint('Controller: loginUser error is ${result.error}');
  //     return ResultModel(error: result.error);
  //   }

  //   final Map<String, String>? data = result.data;

  //   if (data == null) {
  //     debugPrint('Controller: loginUser data is null');
  //     return ResultModel(error: 'data-is-null');
  //   }

  //   final token = data['token'];
  //   final userId = data['userId'];

  //   if (token == null || userId == null) {
  //     debugPrint('Controller: loginUser token or userId is null');
  //     return ResultModel(error: 'token-or-userId-is-null');
  //   }

  //   // Save token and userId to SharedPreferences
  //   final SharedPreferencesAsync prefs = ref.read(sharedPreferencesProvider);
  //   await prefs.setString('auth_token', token);
  //   await prefs.setString('user_id', userId);

  //   await syncCachedUserWithDatabase();
  //   return ResultModel(data: true);
  // }

  // Future<ResultModel<bool>> sendResetPasswordEmail({required String email}) async {
  //   debugPrint('Controller: sendResetPasswordEmail is called');

  //   final userResult = await getUserByEmail(email);
  //   final name = userResult.data?.name ?? '';
  //   final result = await ref.read(userRepositoryProvider.notifier).sendResetPasswordEmail(email: email, name: name);

  //   if (result.error != null) {
  //     debugPrint('Controller: sendResetPasswordEmail error is ${result.error}');
  //     return ResultModel(error: result.error);
  //   }

  //   // Optionally perform other actions
  //   return ResultModel(data: result.data);
  // }

  // Future<ResultModel<bool>> resetPassword({required String token, required String newPassword}) async {
  //   debugPrint('Controller: resetPassword is called with token: $token and newPassword: $newPassword');
  //   final result = await ref.read(userRepositoryProvider.notifier).resetPassword(token: token, newPassword: newPassword);

  //   if (result.error != null) {
  //     debugPrint('Controller: resetPassword error is ${result.error}');
  //     return ResultModel(error: result.error);
  //   }

  //   return ResultModel(data: result.data);
  // }

  // Future<ResultModel<bool>> saveProfileImage(File enteredImage) async {
  //   debugPrint('Controller: saveProfileImage is called');
  //   final currentUser = state;
  //   if (currentUser == null) return ResultModel(error: 'current-user-is-null');
  //   final result = await ref.read(userRepositoryProvider.notifier).saveProfileImage(enteredImage, currentUser);

  //   if (result.error != null) {
  //     debugPrint('Controller: saveProfileImage error is ${result.error}');
  //     return ResultModel(error: result.error);
  //   }

  //   await syncCachedUserWithDatabase();
  //   return ResultModel(data: result.data);
  // }

  // // DELETE

  // Future<ResultModel<bool>> deleteProfileImage() async {
  //   debugPrint('Controller: deleteProfileImage is called');
  //   final currentUser = state;
  //   if (currentUser == null) return ResultModel(error: 'current-user-is-null');
  //   final result = await ref.read(userRepositoryProvider.notifier).deleteProfileImage(currentUser);

  //   if (result.error != null) {
  //     debugPrint('Controller: deleteProfileImage error is ${result.error}');
  //     return ResultModel(error: result.error);
  //   }

  //   await syncCachedUserWithDatabase();
  //   return ResultModel(data: result.data);
  // }
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
