import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taipme_mobile/src/model/data_model/faq_model/faq_model.dart';
import 'package:taipme_mobile/src/model/data_model/result_model/result_model.dart';
import 'package:taipme_mobile/src/repository/faq_repository/faq_repository.dart';

part 'faq_controller.g.dart';

@Riverpod(keepAlive: true)
Future<List<FaqModel>?> faqController(Ref ref) async {
  final FaqRepository faqRepository = ref.read(faqRepositoryProvider.notifier);
  final ResultModel<List<FaqModel>> result = await faqRepository.getChatList();
  debugPrint('Controller Result: ${result.data}');
  if (result.error != null) {
    throw Exception(result.error);
  }

  ref.read(faqSyncControllerProvider.notifier).setFaqList(result.data!);

  return result.data;
}

@Riverpod(keepAlive: true)
class FaqSyncController extends _$FaqSyncController {
  @override
  List<FaqModel> build() => <FaqModel>[];

  void toggleExpansion(int index) {
    if (index < state.length) {
      // Use copyWith to create a new instance with the updated isExpanded value
      final updatedFaq =
          state[index].copyWith(isExpanded: !state[index].isExpanded);
      state = [
        ...state.sublist(0, index),
        updatedFaq,
        ...state.sublist(index + 1),
      ];
    }
  }

  void setFaqList(List<FaqModel> faqList) {
    state = faqList;
  }
}
