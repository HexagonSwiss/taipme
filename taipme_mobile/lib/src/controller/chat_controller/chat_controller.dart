import 'package:taipme_mobile/src/model/data_model/result_model/result_model.dart';
import 'package:taipme_mobile/src/service/chat_service/chat_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/foundation.dart';

part 'chat_controller.g.dart';

@Riverpod(keepAlive: true)  
class ChatController extends _$ChatController {
  @override
  void build() {}

  FutureOr<ResultModel<List>> getChatList() async {
    final result = await ref.read(chatServiceProvider.notifier).getChatList();
    if (result.error != null) {
      debugPrint('Controller: getChatList error is ${result.error}');
      return ResultModel(error: result.error);
    } else {
      debugPrint('Controller: getChatList result is ${result.data}');
      return result;
    }
  }
}