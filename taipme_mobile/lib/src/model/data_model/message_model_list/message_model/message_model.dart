import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taipme_mobile/src/util/enum/message_type_enum.dart'; // Assuming this path is correct

part 'message_model.freezed.dart';
part 'message_model.g.dart';

@freezed
abstract class MessageModel with _$MessageModel {
  const factory MessageModel({
    int? idMsg,
    int? idUteAut,
    int? idUteReply,
    int? idMsgReply,
    int? idFoglio,
    String? desMsg,
    String? titMsg, // Added from Java Messaggio
    String? emailAut, // Added from Java Messaggio
    @JsonKey(fromJson: _fromJsonTimestamp, toJson: _toJsonTimestamp) DateTime? dataPub,
    @JsonKey(fromJson: _fromJsonTimestamp, toJson: _toJsonTimestamp) DateTime? datUltMov,
    @Default(MessageTypeEnum.public) MessageTypeEnum codTipMsg,
    String? desTipMsg, // Added from Java Messaggio
    bool? tipMsgPub, // Added from Java Messaggio
    bool? tipMsgPri, // Added from Java Messaggio
    String? datUltMovView, // Added from Java Messaggio
    int? idFoglioOrig, // Added from Java Messaggio
    bool? segnala, // Added from Java Messaggio
    bool? presenteRisposta, // Added from Java Messaggio
    String? hashtag, // Added from Java Messaggio
    String? desErrHashTag, // Added from Java Messaggio
    String? desSuccessHashTag, // Added from Java Messaggio
    String? desMot, // Added from Java Messaggio
    bool? offensivo, // Added from Java Messaggio
    bool? msgUteReg, // Added from Java Messaggio
    bool? foundMsgPubRandom, // Added from Java Messaggio
    @Default(false) bool isCurrent, // Keep your UI-specific field
  }) = _MessageModel;

  factory MessageModel.fromJson(Map<String, Object?> json) =>
      _$MessageModelFromJson(json);
}

// Your existing timestamp converters
DateTime? _fromJsonTimestamp(int? timestamp) =>
    timestamp != null ? DateTime.fromMillisecondsSinceEpoch(timestamp) : null;

int? _toJsonTimestamp(DateTime? date) => date?.millisecondsSinceEpoch;