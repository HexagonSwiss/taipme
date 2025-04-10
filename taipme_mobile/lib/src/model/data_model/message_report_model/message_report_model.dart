import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_report_model.freezed.dart';
part 'message_report_model.g.dart';

@freezed
class MessageReportModel with _$MessageReportModel {
  const factory MessageReportModel({
    @JsonKey(name: "id_msg_segn") required int idMsgSegn,
    @JsonKey(name: "id_msg") required String idMsg,
    @JsonKey(name: "des_mot") required String desMot,
    @JsonKey(name: "dat_segn") DateTime? datSegn,
    @JsonKey(name: "dat_ult_mov") String? datUltMov,
    @JsonKey(name: "id_ute_segn") String? idUteSegn,
    @Default(false) bool isExpanded,
  }) = _MessageReportModel;

  factory MessageReportModel.fromJson(Map<String, Object?> json) =>
      _$MessageReportModelFromJson(json);
}
