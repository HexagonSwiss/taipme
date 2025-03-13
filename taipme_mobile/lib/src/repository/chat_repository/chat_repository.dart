import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taipme_mobile/src/model/data_model/result_model/result_model.dart';

part 'chat_repository.g.dart';

@riverpod
class ChatRepository extends _$ChatRepository {
  @override
  void build() {}

  Future<ResultModel<List>> getChatList() async {
    final http.Response response;
    final dynamic decodedResponse;
    final Uri uri = Uri.parse('http://127.0.0.1:8080/WhitePaper/message_mobile');

    response = await http.post(uri).to;

    return ResultModel(data: response);
  }
}
