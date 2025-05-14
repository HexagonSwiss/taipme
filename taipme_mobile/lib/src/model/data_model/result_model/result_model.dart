import 'package:freezed_annotation/freezed_annotation.dart';

part 'result_model.freezed.dart';

@freezed
class ResultModel<T> with _$ResultModel<T> {
  const factory ResultModel({
    T? data,
    String? error,
    int? statusCode,
  }) = _ResultModel;
}