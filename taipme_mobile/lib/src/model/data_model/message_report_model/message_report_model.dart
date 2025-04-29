import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_report_model.freezed.dart';
part 'message_report_model.g.dart';

@freezed
class MessageReportModel with _$MessageReportModel {
  const factory MessageReportModel({
    required String idMsg,
    required String desMot,
    int? idMsgSegn,
    @JsonKey(fromJson: _fromJsonTimestamp, toJson: _toJsonTimestamp) DateTime? datSegn,
    @JsonKey(fromJson: _fromJsonTimestamp, toJson: _toJsonTimestamp) DateTime? datUltMov,
    String? idUteSegn,
    @Default(false) bool isExpanded,
  }) = _MessageReportModel;

  factory MessageReportModel.fromJson(Map<String, Object?> json) =>
      _$MessageReportModelFromJson(json);
}

DateTime? _fromJsonTimestamp(int? timestamp) =>
    timestamp != null ? DateTime.fromMillisecondsSinceEpoch(timestamp) : null;

int? _toJsonTimestamp(DateTime? date) => date?.millisecondsSinceEpoch;
