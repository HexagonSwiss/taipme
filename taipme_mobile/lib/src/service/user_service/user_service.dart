import 'dart:convert';
import 'package:taipme_mobile/src/model/data_model/result_model/result_model.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;

part 'user_service.g.dart';

final String baseUrl = 'http://10.0.2.2:8081/WhitePaper/mobile/auth';

@riverpod
class UserService extends _$UserService {
  @override
  void build() {}

  Future<ResultModel<Map<String, String>>> loginUser({
    required String email,
    required String password,
  }) async {
    debugPrint("Repository: loginUser is called with email: $email");

    final Uri uri = Uri.parse('$baseUrl/login');

    final Map<String, String> requestBody = {
      'username': email, 
      'password': password, 
    };

    final Map<String, String> headers = {
      "Content-Type": "application/json",
      "X-Request-Source": "mobile",
    };

    try {
      final http.Response response = await http.post(
        uri,
        headers: headers,
        body: jsonEncode(requestBody),
      );

      debugPrint(
          "Repository: loginUser response status: ${response.statusCode}");
      debugPrint("Repository: loginUser response body: ${response.body}");

      if (response.statusCode == 200) {
        try {
          final Map<String, dynamic> decodedResponse =
              jsonDecode(response.body);
          if (decodedResponse.containsKey('token')) {
            debugPrint("Repository: loginUser received token");
            return ResultModel(data: {
              'token': decodedResponse['token'],
              'userId': 'not_available_in_current_backend_response',
            });
          } else {
            debugPrint(
                "Repository: loginUser received 200 but no token in body");
            return ResultModel(
                error: "Unexpected successful response from server.");
          }
        } catch (e) {
          debugPrint("Repository: Error decoding 200 response body: $e");
          return ResultModel(error: "Failed to process server response.");
        }
      } else if (response.statusCode == 401) {
        debugPrint("Repository: loginUser authentication failed (401)");
        return ResultModel(error: response.body);
      } else {
        debugPrint(
            "Repository: loginUser received unexpected status code: ${response.statusCode}");
        return ResultModel(
            error: "Server returned status code ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("Repository: loginUser network error is: $e");
      return ResultModel(
          error: "Si è verificato un errore di connessione. Riprovare");
    }
  }
}
