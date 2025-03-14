import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:taipme_mobile/src/model/data_model/result_model/result_model.dart';

part 'chat_repository.g.dart';

@riverpod
class ChatRepository extends _$ChatRepository {
  @override
  void build() {}

Future<ResultModel<List<dynamic>>> getChatList() async {
  final Uri uri = Uri.parse('https://www.taipme.com/WhitePaper/message_mobile');

  try {
    final http.Response response = await http.post(uri);

    if (response.statusCode == 200) {
      // Decodifica il JSON
      final List<dynamic> decodedResponse = jsonDecode(response.body).toList();

      return ResultModel(data: decodedResponse);
    } else {
      // In caso di errore HTTP
      return ResultModel(error: "Errore: ${response.statusCode}");
    }
  } catch (e) {
    // Gestione degli errori di rete
    return ResultModel(error: "Errore di connessione: $e");
  }
}
}
