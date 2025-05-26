import 'package:freezed_annotation/freezed_annotation.dart';

part 'reply_message_request_model.freezed.dart';
part 'reply_message_request_model.g.dart';

@freezed
abstract class ReplyMessageRequestModel with _$ReplyMessageRequestModel {
  const factory ReplyMessageRequestModel({
    required String desMsg,
  }) = _ReplyMessageRequestModel;

  factory ReplyMessageRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ReplyMessageRequestModelFromJson(json);
}
