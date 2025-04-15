import 'dart:convert';
import 'package:taipme_mobile/src/model/data_model/result_model/result_model.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;

part 'user_service.g.dart';

@riverpod
class UserService extends _$UserService {
  @override
  void build() {}

  Future<ResultModel<Map<String, String>>> loginUser({
    required String email,
    required String password,
  }) async {
    debugPrint("Repository: loginUser is called with email: $email");

    final http.Response response;
    final dynamic decodedResponse;
    final Uri uri = Uri.parse('http://127.0.0.1:8080/WhitePaper/mobile/login');

    final String encodedEmail = Uri.encodeComponent(email);
    final String encodedPassword = Uri.encodeComponent(password);

    final Map<String, String> headers = {
      "Content-Type": "application/json",
      "X-Request-Source": "mobile",
      "username": encodedEmail,
      "password": encodedPassword,
    };

    try {
      response = await http.post(uri, headers: headers);

      debugPrint("Repository: loginUser response body is ${response.body}");

      decodedResponse = jsonDecode(response.body);

      debugPrint("Repository: loginUser decodedResponse is $decodedResponse");

      if (decodedResponse['success'] == true) {
        return ResultModel(data: {
          'token': decodedResponse['token'],
          'userId': decodedResponse['userId'],
        });
      }

      return ResultModel(error: decodedResponse['error']);
    } catch (e) {
      debugPrint("Repository: loginUser error is: $e");
      return ResultModel(error: "Si è verificato un errore. Riprovare");
    }
  }
}
