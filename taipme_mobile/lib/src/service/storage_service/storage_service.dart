import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../model/data_model/result_model/result_model.dart';

part 'storage_service.g.dart';

@riverpod
class StorageService extends _$StorageService {
  @override
  FlutterSecureStorage build() => const FlutterSecureStorage();

  Future<ResultModel<void>> storeToken(String token) async {
    try {
      debugPrint("StorageService: Storing token: $token");
      await state.write(key: 'jwt', value: token);
      return const ResultModel(data: null);
    } catch (e) {
      debugPrint("StorageService: Failed to store token. Error: $e");
      return ResultModel(error: e.toString());
    }
  }

  Future<ResultModel<String?>> getToken() async {
    try {
      debugPrint("StorageService: Retrieving token");
      final token = await state.read(key: 'jwt');
      if (token == null) {
        debugPrint("StorageService: No token found");
        return const ResultModel(data: null);
      }
      debugPrint("StorageService: Token retrieved successfully: $token");
      return ResultModel(data: token);
    } catch (e) {
      debugPrint("StorageService: Failed to retrieve token. Error: $e");
      return ResultModel(error: e.toString());
    }
  }

  Future<ResultModel<void>> deleteToken() async {
    try {
      debugPrint("StorageService: Deleting token");
      await state.delete(key: 'jwt');
      return const ResultModel(data: null);
    } catch (e) {
      debugPrint("StorageService: Failed to delete token. Error: $e");
      return ResultModel(error: e.toString());
    }
  }
}
