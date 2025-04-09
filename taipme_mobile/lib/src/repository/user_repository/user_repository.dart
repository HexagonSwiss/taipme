import 'dart:io';
import 'dart:convert';
import 'package:taipme_mobile/src/controller/instance_controller/instance_controller.dart';
import 'package:taipme_mobile/src/model/data_model/result_model/result_model.dart';
import 'package:taipme_mobile/src/model/data_model/user_model/user.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

part 'user_repository.g.dart';

@riverpod
class UserRepository extends _$UserRepository {
  @override
  void build() {}


  Future<ResultModel<Map<String, String>>> loginUser({required String email, required String password}) async {
    debugPrint("Repository: loginUser is called with email: $email");

    final http.Response response;
    final dynamic decodedResponse;
    final String body;
    final Uri uri = Uri.parse('http://127.0.0.1:8080/WhitePaper/hello');


    final Map<String, String> headers = {
      "Content-Type": "application/json",
      "X-Request-Source": "mobile",
      "username": encodedEmail,
      "password": encodedPassword,
    };

    try {


      body = json.encode({
        'email': email,
        'password': password,
      });

      response = await http.post(uri, headers: headers, body: body);

      debugPrint("Repository: loginUser response body is ${response.body}");

      // Decodifica la risposta
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
