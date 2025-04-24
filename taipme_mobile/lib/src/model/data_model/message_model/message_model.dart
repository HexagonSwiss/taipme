import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taipme_mobile/src/util/enum/message_type_enum.dart';

part 'message_model.freezed.dart';
part 'message_model.g.dart';

@freezed
class MessageModel with _$MessageModel {
  const factory MessageModel({
    int? idMsg,
    int? idUteAut,
    int? idUteReply,
    int? idMsgReply,
    int? idFoglio,
    String? desMsg,
    @JsonKey(fromJson: _fromJsonTimestamp, toJson: _toJsonTimestamp) DateTime? dataPub,
    @JsonKey(fromJson: _fromJsonTimestamp, toJson: _toJsonTimestamp) DateTime? datUltMov,
    @Default(MessageTypeEnum.public) MessageTypeEnum codTipMsg,
    @Default(false) bool isCurrent,
  }) = _MessageModel;

  factory MessageModel.fromJson(Map<String, Object?> json) =>
      _$MessageModelFromJson(json);
}

DateTime? _fromJsonTimestamp(int? timestamp) =>
    timestamp != null ? DateTime.fromMillisecondsSinceEpoch(timestamp) : null;

int? _toJsonTimestamp(DateTime? date) => date?.millisecondsSinceEpoch;
