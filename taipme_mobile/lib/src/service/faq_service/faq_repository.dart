import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;
import 'package:taipme_mobile/src/model/data_model/faq_model/faq_model.dart';
import 'dart:convert';
import 'package:taipme_mobile/src/model/data_model/result_model/result_model.dart';

part 'faq_repository.g.dart';

@riverpod
class FaqRepository extends _$FaqRepository {
  @override
  void build() {}

  Future<ResultModel<List<FaqModel>>> getChatList() async {
    final Uri uri = Uri.parse('http://10.0.2.2:8081/WhitePaper/mobile/faq');

    final Map<String, String> headers = {
      "Content-Type": "application/json",
      "X-Request-Source": "mobile",
    };

    try {
      final http.Response response = await http.get(uri, headers: headers);

      debugPrint('Repository: FaqRepository Response is: $response');

      if (response.statusCode == 200) {
        debugPrint('Repository: FaqRepository Response body is: ${response.body}');
        final List<dynamic> decodedJson = jsonDecode(response.body);

        final List<FaqModel> faqs = decodedJson
            .map((jsonItem) =>
                FaqModel.fromJson(jsonItem as Map<String, dynamic>))
            .toList();

        return ResultModel(data: faqs);
      } else {
        return ResultModel(
          error: "Repository: FaqRepo statusCode is: ${response.statusCode}",
        );
      }
    } catch (e) {
      return ResultModel(error: "Repository: FaqRepo error is: $e");
    }
  }
}
