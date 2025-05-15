import 'package:freezed_annotation/freezed_annotation.dart';

part 'result_model.freezed.dart';

@freezed
abstract class ResultModel<T> with _$ResultModel<T> {
  const ResultModel._();

  const factory ResultModel({
    T? data,
    String? error,
    int? statusCode,
  }) = _ResultModel;

  bool hasError() => error != null;
  bool isSuccess() => data != null && error == null;
}
