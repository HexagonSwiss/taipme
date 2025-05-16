import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_model.freezed.dart';
part 'message_model.g.dart';

@freezed
abstract class MessageModel with _$MessageModel {
  const factory MessageModel({
    required int idMsg,
    String? desMsg,
    String? titMsg,
    int? idUteAut,
    String? emailAut,
    int? idUteReply,
    int? idMsgReply,
    String? codTipMsg,
    String? desTipMsg,
    @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
    DateTime? datUltMov,
    @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeToTimestamp)
    DateTime? dataPub,
    required int idFoglio,
  }) = _MessageModel;

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);
}

DateTime? _dateTimeFromTimestamp(int? timestamp) =>
    timestamp != null ? DateTime.fromMillisecondsSinceEpoch(timestamp) : null;

int? _dateTimeToTimestamp(DateTime? date) => date?.millisecondsSinceEpoch;
