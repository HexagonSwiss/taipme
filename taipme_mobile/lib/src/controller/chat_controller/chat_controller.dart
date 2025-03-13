import 'dart:io';
import 'package:taipme_mobile/src/controller/instance_controller/instance_controller.dart';
import 'package:taipme_mobile/src/model/data_model/result_model/result_model.dart';
import 'package:taipme_mobile/src/model/data_model/user_model/user.dart';
import 'package:taipme_mobile/src/repository/chat_repository/chat_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'chat_controller.g.dart';

@Riverpod(keepAlive: true)  
class ChatController extends _$ChatController {
  @override
  void build() {}

  FutureOr<ResultModel<List>> getChatList() async {
    final result = await ref.read(chatRepositoryProvider.notifier).getChatList();
    if (result.error != null) {
      debugPrint('Controller: getChatList error is ${result.error}');
      return ResultModel(error: result.error);
    } else {
      debugPrint('Controller: getChatList result is ${result.data}');
      return result;
    }
  }
}