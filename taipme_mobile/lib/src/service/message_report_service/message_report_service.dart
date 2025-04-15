import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;
import 'package:taipme_mobile/src/model/data_model/message_report_model/message_report_model.dart';
import 'dart:convert';
import 'package:taipme_mobile/src/model/data_model/result_model/result_model.dart';

part 'message_report_service.g.dart';

@riverpod
class MessageReportService extends _$MessageReportService {
  @override
  void build() {}

  FutureOr<ResultModel<bool>> reportMessage(MessageReportModel messageReport) async {
    final String body = json.encode({messageReport.toJson()});

    final Uri uri =
        Uri.parse('http://localhost:8081/WhitePaper/api/mobile/msg_segn');

    try {
      final Map<String, String> headers = {
        "Content-Type": "application/json",
        // "X-Request-Source": "mobile",
      };

      final http.Response response =
          await http.post(uri, headers: headers, body: body);

      if (response.statusCode == 200) {


        return ResultModel(data: true);
      } else {
        return ResultModel(error: "Errore: ${response.statusCode}");
      }
    } catch (e) {
      return ResultModel(error: "Errore di connessione: $e");
    }
  }
}
