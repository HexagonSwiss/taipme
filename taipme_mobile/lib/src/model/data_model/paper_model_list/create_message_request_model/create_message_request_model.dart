import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_message_request_model.freezed.dart';
part 'create_message_request_model.g.dart';

@freezed
abstract class CreateMessageRequestModel with _$CreateMessageRequestModel {
  const factory CreateMessageRequestModel({
    required String desMsg, // Message description/content
    String? titMsg,         // Optional message title
  }) = _CreateMessageRequestModel;

  // Freezed will generate toJson()
  factory CreateMessageRequestModel.fromJson(Map<String, Object?> json) =>
      _$CreateMessageRequestModelFromJson(json);
}
