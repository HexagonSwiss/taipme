import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taipme_mobile/src/model/data_model/faq_model/faq_model.dart';
import 'package:taipme_mobile/src/model/data_model/result_model/result_model.dart';
import 'package:taipme_mobile/src/service/faq_service/faq_service.dart';

part 'faq_controller.g.dart';

@riverpod
Future<List<FaqModel>> faqController(Ref ref) async {
  final FaqService faqService = ref.read(faqServiceProvider.notifier);
  final List<FaqModel> faqSync = ref.read(faqSyncControllerProvider);

  if (faqSync.isNotEmpty) {
    debugPrint('Controller: getFaqList from sync');
    return faqSync;
  }

  final ResultModel<List<FaqModel>> result = await faqService.getFaqList();
  debugPrint('Controller Result: ${result.data}');

  final data = result.data;
  final error = result.error;

  if (data == null) {
    debugPrint('Controller: getFaqList error is ${result.error}');
    return <FaqModel>[];
  }

  if (error != null) {
    debugPrint('Controller: getFaqList error is $error');
    return <FaqModel>[];
  }

  ref.read(faqSyncControllerProvider.notifier).setFaqList(result.data!);

  return data;
}

@Riverpod(keepAlive: true)
class FaqSyncController extends _$FaqSyncController {
  @override
  List<FaqModel> build() => [];

  void toggleExpansion(int index) {
    if (index < state.length) {
      final updatedFaq = state[index].copyWith(isExpanded: !state[index].isExpanded);
      state = [
        ...state.sublist(0, index),
        updatedFaq,
        ...state.sublist(index + 1),
      ];
    }
  }

  void setFaqList(List<FaqModel> faqList) => state = faqList;
}
