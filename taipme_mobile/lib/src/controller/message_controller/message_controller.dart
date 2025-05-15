import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taipme_mobile/src/model/data_model/message_model_list/message_model/message_model.dart';
import 'package:taipme_mobile/src/model/data_model/result_model/result_model.dart';
import 'package:taipme_mobile/src/service/message_service/message_service.dart';
import 'package:taipme_mobile/src/util/helper/snackbar/snackbar.dart';

part 'message_controller.g.dart';

@riverpod
FutureOr<List<MessageModel>> getAllMessages(Ref ref) async {
  final ResultModel<List<MessageModel>> result =
      await ref.read(messageServiceProvider.notifier).getAllMessages();
  final List<MessageModel>? data = result.data;
  if (data != null && data.isNotEmpty) {
    ref.watch(messageControllerProvider.notifier).updateStateFromList(data);
    return data;
  }

  return [];
}

@Riverpod(keepAlive: true)
class MessageController extends _$MessageController {
  @override
  List<MessageModel> build() => <MessageModel>[];

  void updateStateFromList(List<MessageModel> newList) {
    state = [...state, ...newList];
  }

  Future<void> addMessage(MessageModel message) async {
    final ResultModel<MessageModel> result =
        await ref.read(messageServiceProvider.notifier).saveMessage(message);
    final MessageModel? data = result.data;
    final String? error = result.error;

    if (error != null) {
      ref.read(snackBarProvider(text: '').future);
      return;
    }

    if (data != null) {
      state = [...state, data];
      ref.read(snackBarProvider(text: 'Message added successfully').future);
      ref.invalidate(getAllMessagesProvider);
      return;
    }
  }

  void removeMessage(int index) {
    state = [...state]..removeAt(index);
  }

  void updateIsSelected(int index) {
    state = [
      for (final message in state)
        if (state.indexOf(message) == index)
          message.copyWith(isCurrent: !message.isCurrent)
        else
          message
    ];
  }
}
