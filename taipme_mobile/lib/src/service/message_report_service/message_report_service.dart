import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;
import 'package:taipme_mobile/src/model/data_model/message_report_model/message_report_model.dart';
import 'dart:convert';
import 'package:taipme_mobile/src/model/data_model/result_model/result_model.dart';
import 'package:taipme_mobile/src/model/data_model/message_model/message_model.dart';

part 'message_report_service.g.dart';

// TODO: CHANGE THIS LOGIC
final String baseUrl = 'http://10.0.2.2:8081/WhitePaper/mobile/message-reports';

@riverpod
class MessageReportService extends _$MessageReportService {
  @override
  void build() {}

  FutureOr<ResultModel<bool>> reportMessage(
    MessageModel message,
  ) async {
    debugPrint("Starting reportMessage method...");

    // Create MessageReportModel using MessageModel properties
    final MessageReportModel messageReport = MessageReportModel(
      idMsg: message.idMsg.toString(),
      desMot: "Reported via app",
      datSegn: DateTime.now(),
      idUteSegn: message.idUteAut?.toString(),
    );

    final String body = json.encode(messageReport.toJson());
    debugPrint("Request body: $body");
    final Uri uri = Uri.parse(baseUrl);
    debugPrint("Request URI: $uri");
    final Map<String, String> headers = _headers();
    debugPrint("Request headers: $headers");

    try {
      debugPrint("Sending POST request...");
      final http.Response response =
          await http.post(uri, headers: headers, body: body);
      debugPrint("Response received with status code: ${response.statusCode}");

      if (response.statusCode == 200) {
        debugPrint("Request successful.");
        return ResultModel(data: true);
      } else {
        debugPrint("Request failed with status code: ${response.statusCode}");
        return ResultModel(error: "Errore: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("Exception occurred: $e");
      return ResultModel(error: "Errore di connessione: $e");
    }
  }

  Map<String, String> _headers() {
    return {
      "Content-Type": "application/json",
      "X-Request-Source": "mobile",
    };
  }
}
