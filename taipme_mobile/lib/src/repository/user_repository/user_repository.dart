import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taipme_mobile/src/model/data_model/result_model/result_model.dart';
import 'dart:convert';

part 'user_repository.g.dart';

@riverpod
class UserRepository extends _$UserRepository {
  @override
  void build() {}

  List<String> parseCookies(String cookieHeader) {
    // Split cookies by semicolon and remove spaces
    List<String> cookieList =
        cookieHeader.split(';').map((cookie) => cookie.trim()).toList();

    // Filter out empty or malformed cookies if needed (optional)
    return cookieList.where((cookie) => cookie.isNotEmpty).toList();
  }

  String getSessionCookie(List<String> cookies) {
    // Cerca il cookie che inizia con "SESSIONID"
    for (var cookie in cookies) {
      if (cookie.startsWith('SESSIONID')) {
        return cookie; // Restituisce il cookie che inizia con SESSIONID
      }
    }
    return ''; // Se non trovi il cookie, restituisci una stringa vuota
  }

  Future<ResultModel<String>> loginUser({
    required String email,
    required String password,
  }) async {
    debugPrint("Repository: loginUser is called with email: $email");

    final http.Response response;
    final dynamic decodedResponse;
    final Uri uri = Uri.parse('https://www.taipme.com/WhitePaper/login_mobile');
// Convertire in Base64
    String encodedEmail = base64Encode(utf8.encode(email));
    String encodedPassword = base64Encode(utf8.encode(password));

    final Map<String, String> headers = {
      "Content-Type": "application/json",
      "X-Request-Source": "mobile",
      "username": encodedEmail,
      "password": encodedPassword,
    };

    try {
      // Fai la richiesta POST
      response = await http.post(uri, headers: headers);

      debugPrint("Repository: loginUser response body is ${response.body}");

      // Decodifica la risposta
      decodedResponse = jsonDecode(response.body);

      debugPrint("Repository: loginUser decodedResponse is $decodedResponse");

      if (decodedResponse['message'] == "Invalid credentials") {
        debugPrint(
            "ERROR: Invalid credentials received. Full response: $decodedResponse");

        // Assicurati che esista un messaggio di errore, altrimenti impostane uno di default
        return ResultModel(
            error: decodedResponse['error'] ?? "Credenziali non valide");
      }

      // Estrai e gestisci manualmente i cookie
      List<String> cookies = [];
      if (response.headers['set-cookie'] != null) {
        debugPrint("Extracted cookies!!!!!!!!!!!!");
        cookies = parseCookies(response.headers['set-cookie']!);
        debugPrint("Extracted cookies: $cookies");

        // Estrai solo il cookie SESSIONID
        String sessionCookie = getSessionCookie(cookies);

        if (sessionCookie.isNotEmpty) {
          // Salva il cookie nelle SharedPreferences
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('sessionCookie', sessionCookie);
          debugPrint("SESSIONID cookie saved: $sessionCookie");
          return ResultModel(data: "Success");
        }
      }
      debugPrint(
          "Repository: loginUser decodedResponseMessage is ${decodedResponse['message']}");
      // Se c'è un errore, ritorna l'errore
      return ResultModel(data: "Success");
    } catch (e) {
      debugPrint("Repository: loginUser error is: $e");
      return ResultModel(error: "Si è verificato un errore. Riprovare");
    }
  }
}
