import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taipme_mobile/src/model/data_model/result_model/result_model.dart';
import 'package:taipme_mobile/src/model/data_model/user_model_list/user_change_password_model/user_change_password_model.dart';
import 'package:taipme_mobile/src/model/data_model/user_model_list/user_login_request_model/user_login_request_model.dart';
import 'package:taipme_mobile/src/model/data_model/user_model_list/user_model/user_model.dart';
import 'package:taipme_mobile/src/model/data_model/user_model_list/user_register_request_model/user_register_request_model.dart';
import 'package:taipme_mobile/src/model/data_model/user_model_list/user_register_response_model/user_register_response_model.dart';
import 'package:taipme_mobile/src/model/data_model/user_model_list/user_request_password_model/user_request_password_model.dart';
import 'package:taipme_mobile/src/model/data_model/user_model_list/user_request_password_response_model/user_request_password_response_model.dart';
import 'package:taipme_mobile/src/service/storage_service/storage_service.dart';
import 'package:taipme_mobile/src/util/helper/request_builder/request_builder.dart';

part 'user_service.g.dart';

@riverpod
class UserService extends _$UserService {
  @override
  void build() {}

  Future<ResultModel<UserModel>> authenticateUser({
    required UserLoginRequestModel userRequest,
  }) async {
    debugPrint(
      "UserService: authenticateUser called with userRequest: $userRequest",
    );

    final ResultModel<UserModel> response =
        await ref.read(requestBuilderProvider.notifier).post<UserModel>(
              endpoint: "/auth/login",
              body: {
                'username': userRequest.email,
                'password': userRequest.password,
              },
              parser: (json) => UserModel.fromJson(json),
            );

    if (response.error != null) {
      debugPrint(
        "UserService: authenticateUser failed with error: ${response.error}",
      );
      return ResultModel(
        error: response.error,
        statusCode: response.statusCode,
      );
    }

    try {
      final UserModel data = response.data!;
      if (data.token != null && data.username.isNotEmpty) {
        final String token = data.token!;
        final String username = data.username;

        final ResultModel<void> tokenResult =
            await ref.read(storageServiceProvider.notifier).storeToken(token);

        if (tokenResult.error != null) {
          debugPrint("UserService: Failed to store token");
          return ResultModel(error: tokenResult.error);
        }

        return ResultModel(
          data: UserModel.fromJson({'username': username}),
          statusCode: response.statusCode,
        );
      } else {
        debugPrint("UserService: Missing token or username in response");
        return ResultModel(error: "Unexpected response from server.");
      }
    } catch (e) {
      debugPrint("UserService: Error processing authenticateUser response: $e");
      return ResultModel(error: "Failed to process server response.");
    }
  }

  Future<ResultModel<UserRegisterResponseModel>> registerUser({
    required UserRegisterRequestModel userRequest,
  }) async {
    debugPrint(
      "UserService: registerUser called with userRequest: $userRequest",
    );

    Map<String, String> body = {
      'email': userRequest.email,
      'password': userRequest.password,
    };

    if (userRequest.userName != null && userRequest.userName!.isNotEmpty) {
      body['username'] = userRequest.userName!;
    }

    final ResultModel<UserRegisterResponseModel> response = await ref
        .read(requestBuilderProvider.notifier)
        .post<UserRegisterResponseModel>(
          endpoint: "/auth/register",
          body: body,
          parser: (json) => UserRegisterResponseModel.fromJson(json),
        );

    if (response.error != null) {
      debugPrint(
        "UserService: registerUser failed with error: ${response.error}",
      );
      return ResultModel(error: response.error);
    }

    return response;
  }

  Future<ResultModel<UserRequestPasswordResponseModel>> requestPasswordReset({
    required UserRequestPasswordModel userRequest,
  }) async {
    final String email = userRequest.email;
    debugPrint("UserService: requestPasswordReset called for email: $email");

    try {
      final ResultModel<UserRequestPasswordResponseModel> response = await ref
          .read(requestBuilderProvider.notifier)
          .post<UserRequestPasswordResponseModel>(
            endpoint: "/auth/forgot-password",
            body: {'email': email},
            parser: (json) => UserRequestPasswordResponseModel.fromJson(json),
          );

      if (response.error != null) {
        debugPrint(
          "UserService: requestPasswordReset failed with error: ${response.error}",
        );
        return ResultModel(error: response.error);
      }

      return response;
    } catch (e) {
      debugPrint(
        "UserService: Error processing requestPasswordReset response: $e",
      );
      return ResultModel(error: "Failed to process server response.");
    }
  }

  Future<ResultModel<UserRequestPasswordResponseModel>> changePassword({
    required UserChangePasswordModel changePasswordRequest,
  }) async {
    debugPrint("UserService: changePassword called.");

    final tk = await ref.read(storageServiceProvider.notifier).getToken();

    if (tk.hasError() || tk.data == null) {
      debugPrint(
        "UserService: changePassword - No token found or error retrieving token: ${tk.error}",
      );
      return ResultModel(
        error: "User not authenticated. Please log in again.",
        statusCode: 401,
      );
    }

    final String token = tk.data!;

    final response = await ref
        .read(requestBuilderProvider.notifier)
        .post<UserRequestPasswordResponseModel>(
          endpoint: "/auth/change-password",
          body: changePasswordRequest.toJson(),
          token: token,
          parser: (json) => UserRequestPasswordResponseModel.fromJson(json),
        );

    if (response.hasError()) {
      debugPrint(
        "UserService: changePassword failed. Error: ${response.error}, Status: ${response.statusCode}",
      );
      return ResultModel(
        error: response.error ?? "Failed to change password.",
        statusCode: response.statusCode,
      );
    }

    return ResultModel(data: response.data, statusCode: response.statusCode);
  }
}
