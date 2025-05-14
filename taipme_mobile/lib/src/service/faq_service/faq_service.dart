import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;
import 'package:taipme_mobile/src/model/data_model/faq_model/faq_model.dart';
import 'dart:convert';
import 'package:taipme_mobile/src/model/data_model/result_model/result_model.dart';
import 'package:taipme_mobile/src/service/storage_service/storage_service.dart';

part 'faq_service.g.dart';

@riverpod
class FaqService extends _$FaqService {
  @override
  void build() {}

  Future<ResultModel<List<FaqModel>>> getFaqList() async {
    final baseUrl = dotenv.env['API_URL']!;
    final finalUrL = '$baseUrl/faq/all';

    final Uri uri = Uri.parse(finalUrL);

    final tokenResult =
        await ref.read(storageServiceProvider.notifier).getToken();

    if (tokenResult.error != null || tokenResult.data == null) {
      debugPrint("FaqService: error retrieving token: ${tokenResult.error}");
      return ResultModel(error: "User not logged in", statusCode: 401);
    }

    final String token = tokenResult.data!;
    debugPrint("FaqService: Using token for request");

    final Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $token",
    };

    try {
      final http.Response response = await http.get(uri, headers: headers);

      debugPrint('Repository: FaqService Response is: ${response.statusCode}');
      debugPrint('Repository: FaqService Response body is: ${response.body}');

      if (response.statusCode == 200) {
        final List<dynamic> decodedJson = jsonDecode(response.body);

        final List<FaqModel> faqs = decodedJson
            .map((jsonItem) =>
                FaqModel.fromJson(jsonItem as Map<String, dynamic>))
            .toList();

        return ResultModel(data: faqs);
      } else {
        return ResultModel(
          error:
              "Repository: FaqRepo statusCode is: ${response.statusCode} and body is: ${response.body}",
        );
      }
    } catch (e) {
      debugPrint('Repository: FaqRepo error is: $e');
      return ResultModel(error: "Repository: FaqRepo error is: $e");
    }
  }
}
