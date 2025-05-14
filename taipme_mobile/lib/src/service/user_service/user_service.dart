import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:taipme_mobile/src/model/data_model/result_model/result_model.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;
import 'package:taipme_mobile/src/model/data_model/user_model_list/user_login_request_model/user_login_request_model.dart';
import 'package:taipme_mobile/src/model/data_model/user_model_list/user_model/user_model.dart';
import 'package:taipme_mobile/src/model/data_model/user_model_list/user_register_request_model/user_register_request_model.dart';
import 'package:taipme_mobile/src/service/storage_service/storage_service.dart';

part 'user_service.g.dart';

@riverpod
class UserService extends _$UserService {
  @override
  void build() {}

  Future<ResultModel<UserModel>> authenticateUser({
    required UserLoginRequestModel userRequest,
  }) async {
    debugPrint("Repository: loginUser is called with user dto: $userRequest");

    final baseUrl = dotenv.env['API_URL']!;
    final finalUrL = '$baseUrl/auth/login';

    final Uri uri = Uri.parse(finalUrL);

    final Map<String, String> requestBody = {
      'username': userRequest.email,
      'password': userRequest.password,
    };

    final encodedBody = jsonEncode(requestBody);

    final Map<String, String> headers = {
      "Content-Type": "application/json",
    };

    try {
      final http.Response response = await http.post(
        uri,
        headers: headers,
        body: encodedBody,
      );

      debugPrint("Repository: loginUser status: ${response.statusCode}");
      debugPrint("Repository: loginUser response body: ${response.body}");

      if (response.statusCode == 200) {
        try {
          final decodedResponse = jsonDecode(response.body);

          if (decodedResponse.containsKey('token') &&
              decodedResponse.containsKey('username')) {
            debugPrint("UserService: loginUser received token and username");

            final String token = decodedResponse['token'] as String;
            final String username = decodedResponse['username'] as String;

            final result = await ref
                .read(storageServiceProvider.notifier)
                .storeToken(token);

            if (result.error != null) {
              debugPrint("Repository: loginUser failed to store token");
              return ResultModel(error: result.error);
            }

            return ResultModel(
              data: UserModel.fromJson({'userName': username}),
              statusCode: response.statusCode,
            );
          } else {
            debugPrint("Repository: loginUser received 200 but no token");
            return ResultModel(error: "Unexpected response from server.");
          }
        } catch (e) {
          debugPrint("Repository: Error decoding 200 response body: $e");
          return ResultModel(error: "Failed to process server response.");
        }
      } else if (response.statusCode == 401) {
        debugPrint("Repository: loginUser authentication failed (401)");
        return ResultModel(error: response.body);
      } else {
        debugPrint("Repository: loginUser code is: ${response.statusCode}");
        return ResultModel(error: "Server code is ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("Repository: loginUser network error is: $e");
      return ResultModel(error: "Si è verificato un errore. Riprovare");
    }
  }

  Future<ResultModel<bool>> registerUser({
    required UserRegisterRequestModel userRequest,
  }) async {
    debugPrint(
        "Repository: registerUser is called with user dto: $userRequest");

    final baseUrl = dotenv.env['API_URL']!;
    final finalUrL = '$baseUrl/auth/register';

    final Uri uri = Uri.parse(finalUrL);

    Map<String, String> requestBody = {
      'email': userRequest.email,
      'password': userRequest.password,
    };

    final userName = userRequest.userName;

    if (userName != null && userName.isNotEmpty) {
      requestBody['username'] = userName;
    }

    final encodedBody = jsonEncode(requestBody);

    final Map<String, String> headers = {
      "Content-Type": "application/json",
    };

    try {
      final http.Response response = await http.post(
        uri,
        headers: headers,
        body: encodedBody,
      );

      debugPrint("Repository: registerUser status: ${response.statusCode}");
      debugPrint("Repository: registerUser response body: ${response.body}");

      if (response.statusCode == 200) {
        return ResultModel(data: true, statusCode: response.statusCode);
      } else if (response.statusCode == 400) {
        return ResultModel(error: response.body);
      } else {
        return ResultModel(error: "Server code is ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("Repository: registerUser network error is: $e");
      return ResultModel(error: "Si è verificato un errore. Riprovare");
    }
  }
}
