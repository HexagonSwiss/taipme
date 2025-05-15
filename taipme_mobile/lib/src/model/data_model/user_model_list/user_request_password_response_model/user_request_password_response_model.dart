import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_request_password_response_model.freezed.dart';
part 'user_request_password_response_model.g.dart';

@freezed
abstract class UserRequestPasswordResponseModel with _$UserRequestPasswordResponseModel {
  const factory UserRequestPasswordResponseModel({
    required String message,
  }) = _UserRequestPasswordResponseModel;

  factory UserRequestPasswordResponseModel.fromJson(Map<String, Object?> json) => _$UserRequestPasswordResponseModelFromJson(json);
}