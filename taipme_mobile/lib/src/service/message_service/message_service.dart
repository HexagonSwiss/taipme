import 'package:flutter/rendering.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;
import 'package:taipme_mobile/src/model/data_model/message_model/message_model.dart';
import 'dart:convert';
import 'package:taipme_mobile/src/model/data_model/result_model/result_model.dart';

part 'message_service.g.dart';

// TODO: CHANGE THIS LOGIC
final String baseUrl = 'http://10.0.2.2:8081/WhitePaper/mobile/messages';

@riverpod
class MessageService extends _$MessageService {
  @override
  void build() {}

  // Fetch all messages (GET /mobile/messages)
  FutureOr<ResultModel<List<MessageModel>>> getAllMessages() async {
    debugPrint(
        'Repository: getAllMessages Fetching all messages from $baseUrl');
    final Uri uri = Uri.parse('$baseUrl/all');

    try {
      final http.Response response = await http.get(uri, headers: _headers());
      debugPrint(
          'Repository: getAllMessages response body is ${response.body}');

      if (response.statusCode == 200) {
        debugPrint('Repository: getAllMessages code 200');
        final List<dynamic> decodedJson = jsonDecode(response.body);
        debugPrint('Repository: getAllMessages decodedJson is $decodedJson');

        final List<MessageModel> messages = decodedJson
            .map((jsonItem) =>
                MessageModel.fromJson(jsonItem as Map<String, dynamic>))
            .toList();

        debugPrint('Repository: getAllMessages response is $messages');

        return ResultModel(data: messages);
      } else {
        debugPrint(
            'Repository: getAllMessages error is ${response.statusCode}');
        return ResultModel(error: "Repository: Error: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint('Repository: getAllMessages error is $e');
      return ResultModel(error: "Repository: Connection error: $e");
    }
  }

  // Fetch a single message by ID (GET /mobile/messages/{id})
  FutureOr<ResultModel<MessageModel>> getMessageById(int id) async {
    final Uri uri = Uri.parse('$baseUrl/$id');

    try {
      final http.Response response = await http.get(uri, headers: _headers());

      if (response.statusCode == 200) {
        final Map<String, dynamic> decodedJson = jsonDecode(response.body);
        final MessageModel message = MessageModel.fromJson(decodedJson);

        return ResultModel(data: message);
      } else {
        return ResultModel(error: "Error: ${response.statusCode}");
      }
    } catch (e) {
      return ResultModel(error: "Connection error: $e");
    }
  }

  // Save a new message (POST /mobile/messages)
  FutureOr<ResultModel<MessageModel>> saveMessage(MessageModel message) async {
    final Uri uri = Uri.parse('$baseUrl/new');

    try {
      final http.Response response = await http.post(
        uri,
        headers: _headers(),
        body: jsonEncode(message.toJson()),
      );

      debugPrint('Repository: saveMessage response body is ${response.body}');

      if (response.statusCode == 200) {
        debugPrint('Repository: saveMessage code 200');
        final Map<String, dynamic> decodedJson = jsonDecode(response.body);
        debugPrint('Repository: saveMessage decodedJson is $decodedJson');
        final MessageModel savedMessage = MessageModel.fromJson(decodedJson);
        debugPrint('Repository: saveMessage response is $savedMessage');

        return ResultModel(data: savedMessage);
      } else {
        debugPrint(
            'Repository: saveMessage error is ${response.statusCode}');
        return ResultModel(error: "Error: ${response.statusCode}");
      }
    } catch (e) {
      return ResultModel(error: "Connection error: $e");
    }
  }

  // Update an existing message (PUT /mobile/messages/{id})
  FutureOr<ResultModel<MessageModel>> updateMessage(
    int id,
    MessageModel message,
  ) async {
    final Uri uri = Uri.parse('$baseUrl/$id');

    try {
      final http.Response response = await http.put(
        uri,
        headers: _headers(),
        body: jsonEncode(message.toJson()),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> decodedJson = jsonDecode(response.body);
        final MessageModel updatedMessage = MessageModel.fromJson(decodedJson);

        return ResultModel(data: updatedMessage);
      } else {
        return ResultModel(error: "Error: ${response.statusCode}");
      }
    } catch (e) {
      return ResultModel(error: "Connection error: $e");
    }
  }

  // Delete a message by ID (DELETE /mobile/messages/{id})
  FutureOr<ResultModel<void>> deleteMessage(int id) async {
    final Uri uri = Uri.parse('$baseUrl/$id');

    try {
      final http.Response response =
          await http.delete(uri, headers: _headers());

      if (response.statusCode == 200) {
        return ResultModel(data: null);
      } else {
        return ResultModel(error: "Error: ${response.statusCode}");
      }
    } catch (e) {
      return ResultModel(error: "Connection error: $e");
    }
  }

  Map<String, String> _headers() {
    return {
      "Content-Type": "application/json",
      "X-Request-Source": "mobile",
    };
  }
}
