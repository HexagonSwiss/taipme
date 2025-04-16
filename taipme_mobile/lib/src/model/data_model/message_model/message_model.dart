import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taipme_mobile/src/util/enum/message_type_enum.dart';

part 'message_model.freezed.dart';
part 'message_model.g.dart';

@freezed
class MessageModel with _$MessageModel {
  const factory MessageModel({
    required String idMsg,
    required String desMsg,
    required String idUteAut,
    String? idUteReply,
    String? idMsgReply,
    DateTime? dataPub,
    DateTime? datUltMov,
    DateTime? idFoglio,
    @Default(MessageTypeEnum.public) MessageTypeEnum codTipMsg,
    @Default(false) bool isCurrent,
  }) = _MessageModel;

  factory MessageModel.fromJson(Map<String, Object?> json) =>
      _$MessageModelFromJson(json);
}