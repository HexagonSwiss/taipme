import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_report_model.freezed.dart';
part 'message_report_model.g.dart';

@freezed
class MessageReportModel with _$MessageReportModel {
  const factory MessageReportModel({
    required int idMsgSegn,
    required String idMsg,
    required String desMot,
    DateTime? datSegn,
    String? datUltMov,
    String? idUteSegn,
    @Default(false) bool isExpanded,
  }) = _MessageReportModel;

  factory MessageReportModel.fromJson(Map<String, Object?> json) =>
      _$MessageReportModelFromJson(json);
}
