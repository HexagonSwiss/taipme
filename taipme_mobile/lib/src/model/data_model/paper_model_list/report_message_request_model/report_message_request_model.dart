import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_message_request_model.freezed.dart';
part 'report_message_request_model.g.dart';

@freezed
abstract class ReportMessageRequestModel with _$ReportMessageRequestModel {
  const factory ReportMessageRequestModel({
    required int messageId,
    required String reason,
  }) = _ReportMessageRequestModel;

  factory ReportMessageRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ReportMessageRequestModelFromJson(json);
}
