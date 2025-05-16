import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taipme_mobile/src/model/data_model/faq_model/faq_model.dart';
import 'package:taipme_mobile/src/model/data_model/result_model/result_model.dart';
import 'package:taipme_mobile/src/service/storage_service/storage_service.dart';
import 'package:taipme_mobile/src/util/helper/request_builder/request_builder.dart';

part 'faq_service.g.dart';

@riverpod
class FaqService extends _$FaqService {
  @override
  void build() {}

  Future<ResultModel<List<FaqModel>>> getFaqList() async {
    debugPrint("FaqService: getFaqList called");

    final tokenResult =
        await ref.read(storageServiceProvider.notifier).getToken();

    if (tokenResult.error != null || tokenResult.data == null) {
      debugPrint("FaqService: Error retrieving token: ${tokenResult.error}");
      return ResultModel(error: "User not logged in", statusCode: 401);
    }

    final String token = tokenResult.data!;
    debugPrint("FaqService: Using token for request");

    final ResultModel<List<FaqModel>> response =
        await RequestBuilder.get<List<FaqModel>>(
              endpoint: "/faq/all",
              token: token,
              parser: _faqParser,
            );

    if (response.error != null) {
      debugPrint("FaqService: getFaqList failed with error: ${response.error}");
      return ResultModel(error: response.error);
    }

    try {
      return response;
    } catch (e) {
      debugPrint("FaqService: Error processing getFaqList response: $e");
      return ResultModel(error: "Failed to process server response.");
    }
  }

  List<FaqModel> _faqParser(dynamic json) {
    if (json is List) {
      try {
        final List<FaqModel> faqs = json
            .map((item) => FaqModel.fromJson(item))
            .toList();

        debugPrint(
          "FaqService: _faqParser successfully parsed ${faqs.length} FAQs.",
        );
        return faqs;
      } catch (e) {
        debugPrint("FaqService: _faqParser error during mapping/fromJson: $e");
        throw FormatException("Error parsing FAQ items: ${e.toString()}");
      }
    } else {
      debugPrint(
        "FaqService: _faqParser expected a List but got ${json.runtimeType}. JSON: $json",
      );
      throw FormatException(
        "Expected a list of FAQs, but received type: ${json.runtimeType}",
      );
    }
  }
}
