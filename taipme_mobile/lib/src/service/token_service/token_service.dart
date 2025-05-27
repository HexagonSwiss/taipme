import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taipme_mobile/src/model/data_model/result_model/result_model.dart';
import 'package:taipme_mobile/src/service/storage_service/storage_service.dart';

part 'token_service.g.dart';

@riverpod
class TokenService extends _$TokenService {
  @override
  void build() {}

  Future<ResultModel<String>> getValidToken() async {
    final tokenResult = await ref.read(storageServiceProvider.notifier).getToken();
    if (tokenResult.hasError() || tokenResult.data == null) {
      debugPrint("TokenService: No valid token. Error: ${tokenResult.error}");
      return ResultModel(error: "User not authenticated.", statusCode: 401);
    }
    return ResultModel(data: tokenResult.data);
  }
}